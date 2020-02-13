# Proposal for a consistent naming pattern for queries

## Why?

So queries can be easily discussed in bug reports, clarify the intent of the
query (e.g. the area of test) and group queries easily by sorting
alphabetically.

## Naming

- Operator: fragment of a JSONPath selector.
- Selector: one or more operators passed to the JSONPath evaluation, starting
  with the root operator.
- Document: JSON payload the selector is evaluated against.
- Query: Pair of selector and a document.

## Open questions
- Will this translate to the current table
- Is this consistent
- Do we look ahead and try to think about grouping already?
  How would we group given the complex query syntax?

## Operator notations

As a comparative approach we try to stay impartial and not imply any intent via
the naming scheme. We hence choose to call operators by their form instead of
their potential function. For example we will not distinguish between `$[0]`
("subscript operator") and `$['a']` ("child operator") and instead call both
"bracket notation".

This will allow us to take no sides when talking for example about `$[0]` on
a document like `{"0": 1}`. Is the selector treated as an array index or a key
without any wrapping quotes? We leave this up to the implementation to decide.

- array slice `[:]`, e.g. `[0:2]`, `[-1:]`, `[0:3:2]`
- union `[ , ]`, e.g. `[0, 2]`, `['a', 'b']`, `[1, 3:5]`
- bracket notation `[ ]`, e.g. `[0]`, `['a']`, `[*]`
- dot notation `.`, e.g. `.key`, `.*`
- dot bracket notation `.[ ]`, e.g. `.[1]`, `.['key']`
- filter expression `[?( )]`, e.g. `[?(@key==2)]`
- script expression `[( )]`, e.g. `[(@.length==2)]`
- recursive descent `..`
- root `$`

## Query notations

A trivial query (with an unspecified document) for selector `$` is "root".

Simple queries will consist of the root and another operator, e.g. `$.key`.
Such queries we will just call by the latter operator, e.g. "dot notation".

For more complex queries we use a limited set of prepositions:

- ... with/without ..., when describing a specific selector configuration,
  e.g. `$["key"]`: "bracket notation with double quotes"
- ... on ..., when describing the document of the query,
  e.g. for a document `[1, 42]` with selector `$.key`: "dot notation on array"
- ... after ..., when chaining operators to form a complex query, calling out
  the operators in reverse order,
  e.g. `$..key`: "dot notation after recursive descent"

The following regular expression describes how the prepositions are intended
to be placed relatively to each other:

    ((OPERATOR)(with .*)? after )*(OPERATOR)(with .*)?( on .*)?

A complex example hence could be:
"array slice without start and end after bracket notation with wildcard on
nested arrays" for `$[*][:]` on document `[[1], [2, 3]]`.
