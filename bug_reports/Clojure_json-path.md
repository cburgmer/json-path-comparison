Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:3]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[0:5]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Actual output:
  ```
  "first"
  ```

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
  java.lang.IndexOutOfBoundsException nil
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
  java.lang.Exception object must be an array.
  ```

- [ ] `$[1:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[1:]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third", "forth", "fifth"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  "third"
  ```

- [ ] `$[:]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  java.lang.NumberFormatException null
  ```

- [ ] `$[::]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  java.lang.NumberFormatException null
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
  Actual output:
  ```
  "third"
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
  Actual output:
  ```
  "first"
  ```

- [ ] `$[0:1]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[-1:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Actual output:
  ```
  "third"
  ```

- [ ] `$[-2:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[-4:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Error:
  ```
  java.lang.IndexOutOfBoundsException nil
  ```

- [ ] `$[0:3:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[0:3:1]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[0:4:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[1:3:]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[::2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third", "fifth"]
  ```
  Actual output:
  ```
  "third"
  ```

- [ ] `$['key']`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
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
  java.lang.Exception object must be an array.
  ```

- [ ] `$['two.some']`
  Input:
  ```
  {"one": {"key": "value"}, "two": {"some": "more", "key": "other value"}, "two.some": "42"}
  ```
  Expected output:
  ```
  "42"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$["key"]`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['']`
  Input:
  ```
  {"": 42, "''": 123, "\"\"": 222}
  ```
  Expected output:
  ```
  42
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$.*[1]`
  Input:
  ```
  [[1], [2, 3]]
  ```
  Expected output:
  ```
  [3]
  ```
  Error:
  ```
  java.lang.IndexOutOfBoundsException nil
  ```

- [ ] `$[':']`
  Input:
  ```
  {":": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$[']']`
  Input:
  ```
  {"]": 42}
  ```
  Expected output:
  ```
  42
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['@']`
  Input:
  ```
  {"@": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['.']`
  Input:
  ```
  {".": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['.*']`
  Input:
  ```
  {"key": 42, ".*": 1, "": 10}
  ```
  Expected output:
  ```
  1
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['"']`
  Input:
  ```
  {"\"": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['0']`
  Input:
  ```
  {"0": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['$']`
  Input:
  ```
  {"$": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$[',']`
  Input:
  ```
  {",": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value", "another": "entry"}
  ```
  Expected output:
  ```
  "value"
  ```
  Actual output:
  ```
  ["value", "entry"]
  ```

- [ ] `$['ni.*']`
  Input:
  ```
  {"nice": 42, "ni.*": 1, "mice": 100}
  ```
  Expected output:
  ```
  1
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$[0:2][*]`
  Input:
  ```
  [[1, 2], ["a", "b"], [0, 0]]
  ```
  Expected output:
  ```
  [1, 2, "a", "b"]
  ```
  Actual output:
  ```
  [1, 2]
  ```

- [ ] `$[*].a`
  Input:
  ```
  [{"a": 1}, {"b": 1}]
  ```
  Expected output:
  ```
  [1]
  ```
  Actual output:
  ```
  [1, null]
  ```

- [ ] `$[?(@.id==42)].name`
  Input:
  ```
  [{"id": 42, "name": "forty-two"}, {"id": 1, "name": "one"}]
  ```
  Expected output:
  ```
  ["forty-two"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[0,2].key`
  Input:
  ```
  [{"key": "ey"}, {"key": "bee"}, {"key": "see"}]
  ```
  Expected output:
  ```
  ["ey", "see"]
  ```
  Actual output:
  ```
  "ey"
  ```

- [ ] `$['one','three'].key`
  Input:
  ```
  {"one": {"key": "value"}, "two": {"k": "v"}, "three": {"some": "more", "key": "other value"}}
  ```
  Expected output:
  ```
  ["value", "other value"]
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$.屬性`
  Input:
  ```
  {"\u5c6c\u6027": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Actual output:
  ```
  {"\u5c6c\u6027": "value"}
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
  [40, 42]
  ```

- [ ] `$[?(@['key']==42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 42}]
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$[?(@[1]=='b')]`
  Input:
  ```
  [["a", "b"], ["x", "y"]]
  ```
  Expected output:
  ```
  [["a", "b"]]
  ```
  Actual output:
  ```
  [null, null]
  ```

- [ ] `$[?(@.key=="some.value")]`
  Input:
  ```
  [{"key": "some"}, {"key": "value"}, {"key": "some.value"}]
  ```
  Expected output:
  ```
  [{"key": "some.value"}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key=='value')]`
  Input:
  ```
  [{"key": "some"}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[0,1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[0]['c','d']`
  Input:
  ```
  [{"c": "cc1", "d": "dd1", "e": "ee1"}, {"c": "cc2", "d": "dd2", "e": "ee2"}]
  ```
  Expected output:
  ```
  ["cc1", "dd1"]
  ```
  Error:
  ```
  java.lang.Exception object must be an array.
  ```

- [ ] `$[4,1]`
  Input:
  ```
  [1, 2, 3, 4, 5]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Actual output:
  ```
  5
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
  Actual output:
  ```
  "first"
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Clojure_json-path.
