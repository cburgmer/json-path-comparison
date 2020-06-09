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

- Array slice with step 0 (`$[1:3:0]`) does not parse.

  *Motivation*: This follows how Python implements slicing. Step 0 is the only
  value that can be safely rejected at compile time, while the other values
  interact with the length of the array at runtime.

- Dot bracket (`$.["key"]`) does not parse.

  *Motivation*: Less is more. Use `$["key"]` instead.

- Empty bracket notation (`$[]`) does not parse.

- Dot notation with quotes (`$.'a key'`) does not parse.

  *Motivation*: Less is more. Use `$["a key"]` instead.

- Dot notation inside bracket notation (`$[a.key]`) does not parse.

  *Motivation*: There are potential use cases when combining sub-keys in a union
  (e.g. `$[key.sub,anotherKey]`, but this would need further investigation.

- Dot notation with number will lookup an object by name, but not an array by
  index.

  *Motivation*: Follow clear split in children lookup by index or name.

- Quotes inside strings for key bracket notation can be quoted with a backslash,
  e.g. `$['E\'lir']`.

- Whitespace is allowed in key bracket notation, around the brackets and the
  comma.

  *Motivation*: Humans need whitespace to communicate structure.

- Bracket notation needs quotes when indexing, unless a number is given.

  *Motivation*: Find clear split between array index and object name lookup.

- Bracket notation allows one or many elements ("union"), and allows mixing
  anything that is also allowed in it's own within bracket notation, e.g.
  filter expressions. So `$[*,-1,?(@>1),"key"]` is supported.

  *Motivation*: This is simple, yet powerful and allows for a few sensible use
  cases, e.g. combining multiple filter expressions. It does not require any
  extension to the syntax, on the contrary, it feels like it fits right in.

- "Bald" recursive descent is not supported.

  *Motivation*: No consensus, but more specifically would introduce more
  complexity into grammar without much gain to the user. (We would have to
  introduce a specific terminating rule for the bald version, to avoid
  `$...name` becoming valid.)

- No complex operator precedence unless trivial. Force explicit brackets.

  *Motivation*: The author loves Lisp which makes precedence explicit by
  grouping and avoids complex precedence tables. Maybe we can reduce user
  errors by making some of the groups explicit via enforcing brackets.

- No support for integers with leading zeros.

  *Motivation*: No consistency in implementations on where octal numerals are
  (not) supported.

- Allow whole Unicode range in dot notation, with the exception of
  non-alphanumeric ASCII characters and '$' and '-'.

  *Motivation*: Let's not follow JavaScript's more complex identifier syntax if
  we can keep it simple. To avoid "special characters" though to avoid conflict
  with JSONPath's own syntactic elements.

- Force every selector to start with the root `$`.

  *Motivation*: Less is more. The dollar is needed to distinguish queries inside
  filter expressions from the current object.

- Path queries inside filter expressions are scalar only.

  *Motivation*: Unclear what operators mean on a list value: *all* match, or
  *at least one* matches?

- Script expressions are not supported.

  *Motivation*: Eval is evil.

- No notation to construct objects is supported.

  *Motivation*: This might need a longer discussion. JSONPath allows the limited
  construction of arrays using the union operator (albeit keys need to be on the
  same level). No such thing exists for objects yet. One could argue that
  JSONPath is a query language and not a JSON transformation language and thus
  should not need such a feature.

- Filters inside filters are not supported.

  *Motivation*: I couldn't come up with an example where this could not be
  solved without. Less is more.

- Filter expression operators like `==`, `<` and `>` don't attempt to apply type
  conversion, e.g. `"42"` (string) to `42` (number). Comparing different types
  will always result in a false result. Negating such a comparison using `!`
  (or using short form `!=` for `!` and `=`) will then match all non-matching
  types (in addition to the regular matches).
  This however means that `!(@.key<10)` cannot be the same as `@.key>=10`.

  *Motivation*: If we are to enforce a unified operator response pattern, we
  will necessarily go against some programming language's understanding of type
  conversion. Currently this proposal is just conservative and will not try any
  conversion.

- Integers with leading zeros are not supported unless it's the number `0`.

  *Motivation*: There is not clear consensus yet where octal notation is
  supported.


## TODO

- JSON in filter?

  Users might want to check for complex values, i.e. arrays and objects. Some
  implementations allow JSON notation to denote those values. Some even allow
  single quotes which JSON does not. If we allow JSON, are we going to be
  inconsistent if we continue to allow simple strings with single quotes? If
  we disallow simple values in single quotes, are we keeping single quotes for
  children name lookup?

- Arbitrary brackets in filter

  The current grammar does not allow for well formatted brackets in any place.
  This isn't what I'd expect as a user.

- $[::-2]

  No consensus, but if we support $[::2] we should probably support this too.
  The current default values (start 0 and end "len(array)") do not work for
  negative steps as the start and end need to be switched.

- Regexp!

- Let's get more example queries from ../../INTERESTING_QUERIES as they include
  some lessons from implementing the proposal.
