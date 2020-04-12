# Open questions regarding a standard JSONPath implementation

The following questions are inspired by the comparison in
[docs/index.html](docs/index.html). While the queries only probe small pieces
of the implementation, from a broader look patterns are visible.

- Should pure numbers and quoted numbers have the same semantics in bracket
  notation?

  I.e. $[2] and $['2'] find the third element in an array and the value for key
  "2" in an object.

- Should dot notation with numbers behave like bracket notation with numbers?

  I.e. $.2 finds the third element in an array and the value for key "2" in an
  object.

- Do array index slice queries that are out of bounds return errors or a valid
  array?

- Does an array index query error when out of bounds or return an empty result
  (empty array/null respectively)?

- Do we differentiate errors from empty results, from results with empty/null
  values?

- Does a key bracket notation union query return an array or an object?

  Compare https://github.com/s3u/JSONPath/issues/108 for a syntax addition to return the latter.

- Are queries on an object ordered?

- Should JSONPath support uniform script expressions across languages?

- Is `null` considered a value when filtering e.g. `[?(@.key)]`?

- Does filtering for `[?(@.key==null)]` return then same whether a key exists
  with value `null` or is missing altogether?

- Do filter expressions allow the same complex JSONPath queries for the current
  object?

  E.g. Goessner allows @.key and @['key'] but not @.* and @.@ (although $.@ is
  allowed outside).
