# Proposal for a consistent naming pattern for queries

## Why?

So queries can be easy discussed in bug reports, clarify the intent of the query
(e.g. the area of test) and group queries easily by sorting alphabetically.

## Open questions
- Will this translate to the current table
- Is this consistent
- Do we look ahead and try to think about grouping already?
  How would we group given the complex query syntax?

## Operator notations

As a comparative approach we try to stay impartial and keep interpretation out
of the naming scheme. We hence choose to call operators by their form. For
example we will not make any difference between `$[0]` and `$['a']` and call
both "bracket notation".

- array slice `[:]`, e.g. `[0:2]`, `[-1:]`, `[0:3:2]`
- union `[ , ]`, e.g. `[0, 2]`, `['a', 'b']`, `[1, 3:5]`
- bracket notation `[ ]`, e.g. `[0]`, `['a']`, `[*]`
- dot notation `.`, e.g. `.key`, `.*`
- dot bracket notation `.[ ]`, e.g. `.[1]`, `.['key']`
- filter expression `[?( )]`, e.g. `[?(@key==2)]`
- script expression `[( )]`, e.g. `[(@.length==2)]`
- recursive descent `..`
- root `$`

## Complex queries

We use a limited set of prepositions to describe queries more specifically:

- ... on ..., described specific input query is executed on
  e.g. dot notation on array
- ... with/without ..., describes specific selector configuration
  e.g. bracket notation with double quotes
- ... after ..., complex query with multiple selector notations in reverse order
  dot notation after recursive descent

The following regular expression describes how the prepositions relate to each other:

((OPERATOR)(with .*)? after )*(OPERATOR)(with .*)?( on .*)?

One exception: the "root" operator is used to describe the trivial query `$`,
but excluded for any other more complex query.
