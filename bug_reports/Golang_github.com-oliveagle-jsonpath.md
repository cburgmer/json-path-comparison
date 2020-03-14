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
  ["second", "third", "forth"]
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
  Error:
  ```
  index [to] out of range: len: 5, to: 5
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
  index [from] out of range: len: 3, from: 7
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
  object is not Slice
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
  Error:
  ```
  index [to] out of range: len: 3, to: 10
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
  ["first", "second", "third"]
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
  only support one range(from, to): [  ]
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
  ["first"]
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
  ["first", "second"]
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
  index [from] out of range: len: 3, from: -4
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
  Error:
  ```
  only support one range(from, to): [0 3 2]
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
  Error:
  ```
  only support one range(from, to): [0 3 1]
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
  Error:
  ```
  only support one range(from, to): [0 4 2]
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
  Error:
  ```
  only support one range(from, to): [1 3 ]
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
  Error:
  ```
  only support one range(from, to): [  2]
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
  strconv.Atoi: parsing "'key'": invalid syntax
  ```

- [ ] `$..[0]`
  Input:
  ```
  ["first", {"key": ["first nested", {"more": [{"nested": ["deepest", "second"]}, ["more", "values"]]}]}]
  ```
  Expected output:
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Error:
  ```
  expression don't support in filter
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
  strconv.Atoi: parsing "'two.some'": invalid syntax
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
  strconv.Atoi: parsing "'": invalid syntax
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
  strconv.Atoi: parsing "'@'": invalid syntax
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
  strconv.Atoi: parsing "'.'": invalid syntax
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
  strconv.Atoi: parsing "'\"'": invalid syntax
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
  strconv.Atoi: parsing "'0'": invalid syntax
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
  strconv.Atoi: parsing "'$'": invalid syntax
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
  strconv.Atoi: parsing "'": invalid syntax
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
  Error:
  ```
  strconv.Atoi: parsing "'*'": invalid syntax
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
  [[1, 2], ["a", "b"], [0, 0]]
  ```

- [ ] `$[*].bar[*]`
  Input:
  ```
  [{"bar": [42]}]
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  [[42]]
  ```

- [ ] `$..[*]`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Error:
  ```
  expression don't support in filter
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
  index [from] out of range: len: 0, from: 0
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
  object is not Slice
  ```

- [ ] `$[*]`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Error:
  ```
  object is not Slice
  ```

- [ ] `$.['key']`
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
  strconv.Atoi: parsing "'key'": invalid syntax
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

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95}, {"category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99}, {"category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99}, {"category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [12.99, 19.95, 22.99, 8.95, 8.99]
  ```
  Error:
  ```
  expression don't support in filter
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
  strconv.Atoi: parsing "'one'": invalid syntax
  ```

- [ ] `$.*.bar.*`
  Input:
  ```
  [{"bar": [42]}]
  ```
  Expected output:
  ```
  [42]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$..*`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, 42, null]
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$..*`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  expression don't support in filter
  ```

- [ ] `$.*`
  Input:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  expression don't support in filter
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
  expression don't support in filter
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
  expression don't support in filter
  ```

- [ ] `$.*`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Error:
  ```
  expression don't support in filter
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
  interface conversion: interface {} is nil, not string
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
  Error:
  ```
  interface conversion: interface {} is nil, not string
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

- [ ] `$[?(@.key>42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}]
  ```
  Expected output:
  ```
  [{"key": 43}, {"key": 42.0001}, {"key": 100}]
  ```
  Actual output:
  ```
  []
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
  []
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
  strconv.Atoi: parsing "'c'": invalid syntax
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-oliveagle-jsonpath.
