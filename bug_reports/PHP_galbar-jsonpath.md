Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[7:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[1:3]`
  Input:
  ```
  {":": 42, "more": "string", "a": 1, "b": 2, "c": 3}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[2:1]`
  Input:
  ```
  ["first", "second", "third", "forth"]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[0:0]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$..[0]`
  Input:
  ```
  ["first", {"key": ["first nested", {"more": [{"nested": ["deepest", "second"]}, ["more", "values"]]}]}]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near '..[0]''
  ```

- [ ] `$[1]`
  Input:
  ```
  ["one element"]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[']']`
  Input:
  ```
  {"]": 42}
  ```
  Expected output:
  ```
  [42]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near ''''
  ```

- [ ] `$['"']`
  Input:
  ```
  {"\"": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[',']`
  Input:
  ```
  {",": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$..[*]`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near '..[*]''
  ```

- [ ] `$[*]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[*]`
  Input:
  ```
  {}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$.key`
  Input:
  ```
  [0, 1]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$.id`
  Input:
  ```
  [{"id": 2}]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$.key`
  Input:
  ```
  {"key": {}}
  ```
  Expected output:
  ```
  [{}]
  ```
  Actual output:
  ```
  [[]]
  ```

- [ ] `$.missing`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$.屬性`
  Input:
  ```
  {"\u5c6c\u6027": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near '.屬性''
  ```

- [ ] `$.2`
  Input:
  ```
  {"a": "first", "2": "second", "b": "third"}
  ```
  Expected output:
  ```
  ["second"]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near '.2''
  ```

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}, {"another key": {"complex": "string", "primitives": [0, 1]}, "key": "value"}]
  ```

- [ ] `$..*`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [40, 42, null]
  ```
  Actual output:
  ```
  [40, 42, [40, null, 42], null]
  ```

- [ ] `$..*`
  Input:
  ```
  42
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  []
  ```
  Actual output:
  ```
  [42]
  ```

- [ ] `$.*`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$.*`
  Input:
  ```
  {}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[?(@.key==43)]`
  Input:
  ```
  [{"key": 42}]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 0}, {"key": -1}, {"key": 41}, {"key": 41.9999}]
  ```
  Actual output:
  ```
  [{"key": 0}, {"key": -1}, {"key": 41}, {"key": 41.9999}, {"some": "value"}]
  ```

- [ ] `$[ 0 , 1 ]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  Invalid JSONPath error: 'Error in JSONPath near ' 0 , 1 ''
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/PHP_galbar-jsonpath.
