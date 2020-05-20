# Proposal for JSONPath

**This is work in progress!**

This is a proposal for a unified implementation of JSONPath.

This document is guided by the initial implementation from
[Goessner](https://goessner.net/articles/JsonPath/) (especially the JS version)
and the [comparison of other known implementation](https://cburgmer.github.io/json-path-comparison/)
of JSONPath, especially the consensus.

This document tries to call out specific decisions where it deviates from
either.

The proposal is also implemented in JavaScript:

- [index.js](./index.js) Entry point
- [selector.peg](./selector.peg) Selector grammar
- [operators.js](./operators.js) Operator definitions and execution algorithm

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

Operators are structured in a hierarchy:

1. Children lookup, e.g. `$[1, 10]`
    1. Index lookup, e.g. `$.key` or `$[1]`
    2. All children, e.g. `$.*` or `$[*]`
    3. Array slice, e.g. `$[3:5]`
    4. Filter, e.g. `$[?(@.key>2)]`
2. Recursive descent, e.g. `$..key`

Grouping most operators under a general operator "children lookup" allows for
the union of any particular query and thus a more powerful query mechanism.

The recursive descent operator is specific as it is not allowed to exist by
itself, i.e. without being followed by a children lookup. This simplifies
the selector grammar somewhat, considering that we need special handling for
the contraction in combination with dot notation, e.g. `$..key`. (The more
logical notation would've been `$...key`, not the three dots.)

## Notation

All notations from Goessner's initial proposal are supported and mapped to the
above operators.

Examples:

- `$`, the empty set
- `$.key`, children lookup with index `key`
- `$["key", "another"]`, children lookup wih index "key" and index "another"
- `$..[0]`, recursive descent and children lookup with index "0"
- `$..key`, recursive descent and children lookup with index "key"
  (note the contraction of `..` and `.key`)

See the grammar [selector.peg](./selector.peg).

To call out some decisions deviating from other implementations:

- Array slice with step 0 (`$[1:3:0]`) does not parse
- Dot bracket (`$.["key"]`) does not parse
- Empty bracket notation (`$[]`) does not parse
- Dot notation with quotes (`$.'a key'`) does not parse
- Dot notation inside bracket notation (`$[a.key]`) does not parse
- Quotes inside strings for key bracket notation can be quoted with a backslash, e.g. `$['E\'lir']`
- Whitespace is allowed in key bracket notation, around the brackets and the comma
- Bracket notation needs quotes when indexing, unless a number is given

## Grammar

    Start
      ::= "$" Operator*

    Operator
      ::= DotChild
        | BracketChild
        | RecursiveDescentWithChildren

    DotChild
      ::= "." DotChildName
        | ".*"

    DotChildName
      ::= [^\.\*\[\]\(\)@\?\|& ,:=<>!"'\\]+

    BracketChild
      ::= "[" ws BracketElements ws "]"

    BracketElements
      ::= BracketElement ws "," ws BracketElements
        | BracketElement

    BracketElement
      ::= ListBracketElement
        | ScalarBracketElement

    ScalarBracketElement
      ::= "'" SingleQuotedString "'"
        | '"' DoubleQuotedString '"'
        | Integer

    ListBracketElement
      ::= "*"
        | Integer? ":" Integer? ":" NonZeroInteger?
        | Integer? ":" Integer?
        | "?(" FilterExpression ")"

    RecursiveDescentWithChildren
      ::= ".." DotChildName
        | "..*"
        | ".." BracketChild

    FilterExpression
      ::= HigherPrecedenceFilterExpression ws "&&" ws LogicalAndRightHandSide
        | HigherPrecedenceFilterExpression ws "||" ws LogicalOrRightHandSide
        | HigherPrecedenceFilterExpression

    HigherPrecedenceFilterExpression
      ::= FilterValue ws ComparisonOperator ws FilterValue
        | UnaryFilterExpression

    LogicalAndRightHandSide
      ::= HigherPrecedenceFilterExpression ws "&&" ws LogicalAndRightHandSide
        | HigherPrecedenceFilterExpression

    LogicalOrRightHandSide
      ::= HigherPrecedenceFilterExpression ws "||" ws LogicalOrRightHandSide
        | HigherPrecedenceFilterExpression

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
      ::= "@" ScalarOperators
        | "$" ScalarOperators
        | SimpleValue

    ScalarOperators
      ::= ScalarOperator*

    ScalarOperator
      ::= ScalarDotNotation
        | ScalarBracketNotation

    ScalarDotNotation
      ::= "." DotChildName

    ScalarBracketNotation
      ::= "[" ws ScalarBracketElement ws "]"

    SimpleValue
      ::= "'" SingleQuotedString "'"
        | '"' DoubleQuotedString '"'
        | "false"
        | "true"
        | "null"
        | Number

## TODO

- JSON in filter?
- Arbitrary brackets in filter
