# Open questions regarding a standard JSONPath implementation

The following questions are inspired by the comparison in
[docs/index.html](docs/index.html). While the queries only probe small pieces
of the implementation, from a broader look patterns are visible.

- Should array index and key bracket notation have the same semantics?
  I.e. $[2] and $['2'] find the third element in an array and the value for key
  "2" in an object.

- Should dot notation and array index have the same semantics?
  I.e. $.2 finds the third element in an array and the value for key "2" in an
  object.

- Do array index slice queries that are out of bounds return errors or a valid
  array?

- Does an array index query error when out of bounds or return an empty result
  (empty array/null respectively)?

- Do we differentiate errors from empty results, from results with empty/null
  values?

- Does a key bracket notation union query return an array or an object?

- Are queries on an object ordered?

- Should JSONPath support uniform script expressions across languages?
