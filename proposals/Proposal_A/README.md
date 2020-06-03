# Proposal for JSONPath

**This is work in progress!**

This is a proposal for a unified implementation of JSONPath.

This document is guided by the initial implementation from
[Goessner](https://goessner.net/articles/JsonPath/) (especially the JS version)
and the [comparison of other known implementation](https://cburgmer.github.io/json-path-comparison/)
of JSONPath, especially the consensus.

This document tries to call out specific decisions where it deviates from
either.

The guiding principle of this proposal is to balance
- reduced complexity (less code is better),
- adherence to the consensus (more alignment is better),
- reduced room for user errors (less options are better).

## Implementation

The proposal is also implemented in JavaScript for inspection:

- [index.js](./index.js) Entry point
- [selector.peg](./selector.peg) Selector grammar
- [operators.js](./operators.js) Operator definitions and execution algorithm

For now, if this documentation and the implementation disagree, the
implementation wins.

## Execution algorithm

1. The given selector is translated into a list of operators,
   e.g. `$..["key"]` is translated to recursive descent (`..`) and
   children lookup (`["key"]`).
2. The operators are reduced, initially applied against the input document, and
   subsequently against the output of the previous operator,
   e.g. `[{"key": 42}]` is first applied against the recursive descent, yielding
   `( {"key": 42} , 42 )`, and then applied against the children lookup, yielding
   `42` (as only `{"key": 42}` matches the last operator).
   Most importantly operators are always applied against a flat list:
   - Initially the input of the query is supplied as a singleton list, whose
     only entry is the input itself. The first operator loops through the list,
     yielding 0, 1, or many results. Flattening the output yields a new list.
     E.g. The initial list `( [{"key": 42}] )` applied against the recursive
     descent yields `( ( {"key": 42} , 42 ) )`. Flattening this structure gives
     us `( {"key": 42} , 42 )`.
   - The next operators iterates through the flattened list of the previous
     results, and itself will return a list of results, flattened.
     E.g. `( {"key": 42} , 42 )` applied against the children lookup `["key"]`
     yields `( (42) )`, which is flattened to `( 42 )`.
3. The result of the last operator is also the output of the query.

To clarify the impact of the flattening, examine selector `$.*["keyA", "keyB"]`:
The relationship between the underlying documents is lost for e.g.
`[{"keyA": 1, "keyB": 2}, {"keyA": 3}]` in the result of `[1,2,3]`.
To follow the execution results: `( [{"keyA": 1, "keyB": 2}, {"keyA": 3}] )`
=> `( {"keyA": 1, "keyB": 2} , {"keyA": 3} )`
=> `( 1 , 2, 3 )`.

## Operators

Two main operators exist, "recursive descent" and "children lookup". The latter
can be divided further:

1. Children lookup, e.g. `$[1, 10]`
    1. Index lookup, e.g. `$[1]`
    2. Name lookup, e.g. `$.key`
    2. All children, e.g. `$.*` or `$[*]`
    3. Array slice, e.g. `$[3:5]`
    4. Filter, e.g. `$[?(@.key>2)]`
2. Recursive descent, e.g. `$..key`

*Motivation*

Grouping most operators under a general operator "children lookup" allows for
the union of any particular query and thus a more powerful query mechanism.

### Notation

All notations from Goessner's initial proposal are supported and mapped to the
above operators.

Examples:

- `$`, the empty list of operators
- `$.key`, children lookup with name `key`
- `$["key", "another"]`, children lookup with name "key" and name "another"
- `$..[0]`, recursive descent and children lookup with index "0"
- `$..key`, recursive descent and children lookup with name "key"
  (note the contraction of `..` and `.key`)

## Grammar

    Start
      ::= "$" Operator*

    Operator
      ::= DotChild
        | BracketChildren
        | RecursiveDescentChildren

    DotChild
      ::= "." DotChildName
        | ".*"

    DotChildName
      ::= [^ -#%-,\.\/\:-\@\[-\`\{-\~]+

    BracketChildren
      ::= "[" ws BracketElements ws "]"

    BracketElements
      ::= BracketElement ws "," ws BracketElements
        | BracketElement

    BracketElement
      ::= Integer? ":" Integer? ":" NonZeroInteger?
        | Integer? ":" Integer?
        | BracketChild
        | "*"
        | "?(" FilterExpression ")"

    RecursiveDescentChildren
      ::= ".." DotChildName
        | "..*"
        | ".." BracketChildren

    BracketChild
      ::= "'" SingleQuotedString "'"
        | '"' DoubleQuotedString '"'
        | Integer

    FilterExpression
      ::= LogicalAnd
        | LogicalOr
        | HigherPrecedenceFilterExpression

    LogicalAnd
      ::= HigherPrecedenceFilterExpression ws "&&" ws LogicalAnd
        | HigherPrecedenceFilterExpression ws "&&" ws HigherPrecedenceFilterExpression

    LogicalOr
      ::= HigherPrecedenceFilterExpression ws "||" ws LogicalOr
        | HigherPrecedenceFilterExpression ws "||" ws HigherPrecedenceFilterExpression

    HigherPrecedenceFilterExpression
      ::= FilterValue ws ComparisonOperator ws FilterValue
        | UnaryFilterExpression

    UnaryFilterExpression
      ::= FilterValue
        | "!" ws UnaryFilterExpression
        | "(" ws FilterExpression ws ")"

    ComparisonOperator
      ::= "=="
        | "!="
        | "<="
        | ">="
        | "<"
        | ">"

    FilterValue
      ::= "@" ScalarOperator*
        | "$" ScalarOperator*
        | SimpleValue

    ScalarOperator
      ::= "." DotChildName
        | "[" ws BracketChild ws "]"

    SimpleValue
      ::= "'" SingleQuotedString "'"
        | '"' DoubleQuotedString '"'
        | "false"
        | "true"
        | "null"
        | Number

To call out some decisions deviating from other implementations:

- Array slice with step 0 (`$[1:3:0]`) does not parse

  *Motivation*: This follows how Python implements slicing. Step 0 is the only
  value that can be safely rejected at compile time, while the other values
  interact with the length of the array at runtime.

- Dot bracket (`$.["key"]`) does not parse

  *Motivation*: Less is more. Use `$["key"]` instead.

- Empty bracket notation (`$[]`) does not parse
- Dot notation with quotes (`$.'a key'`) does not parse

  *Motivation*: Less is more. Use `$["a key"]` instead.

- Dot notation inside bracket notation (`$[a.key]`) does not parse

  *Motivation*: There are potential use cases when combining sub-keys in a union
  (e.g. `$[key.sub,anotherKey]`, but this would need further investigation.

- Quotes inside strings for key bracket notation can be quoted with a backslash, e.g. `$['E\'lir']`
- Whitespace is allowed in key bracket notation, around the brackets and the comma

  *Motivation*: Humans need whitespace to communicate structure.

- Bracket notation needs quotes when indexing, unless a number is given

  *Motivation*: Find clear split between array index and object name lookup.

- "Bald" recursive descent is not supported

  *Motivation*: No consensus, but more specifically would introduce more
  complexity into grammar without much gain to the user. (We would have to
  introduce a specific terminating rule for the bald version, to avoid
  `$...name` becoming valid.)

- No complex operator precedence unless trivial. Force explicit brackets.

  *Motivation*: The author loves Lisp which makes precedence explicit by
  grouping and avoids complex precedence tables. Maybe we can reduce user
  errors by making some of the groups explicit via enforcing brackets.

- No support for integers with leading zeros

  *Motivation*: No consistency in implementations on where octal numerals are
  (not) supported.

- Allow whole Unicode range in dot notation, with the exception of
  non-alphanumeric ASCII characters and '$' and '-'.

  *Motivation*: Let's not follow JavaScript's more complex identifier syntax if
  we can keep it simple. To avoid "special characters" though to avoid conflict
  with JSONPath's own syntactic elements.

## TODO

- JSON in filter?
- Arbitrary brackets in filter
- $[::-2]
