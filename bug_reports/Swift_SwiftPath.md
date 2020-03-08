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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  indexOutOfBounds
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```

- [ ] `$[*]`
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```

- [ ] `$[*]`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, null, 42]
  ```
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```

- [ ] `$[*].a`
  Input:
  ```
  [{"a": 1}, {"a": 1}]
  ```
  Expected output:
  ```
  [1, 1]
  ```
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```

- [ ] `$[*].a`
  Input:
  ```
  [{"a": 1}]
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Can't execute query
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
  Can't execute query
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```

- [ ] `$.2`
  Input:
  ```
  {"a": "first", "2": "second", "b": "third"}
  ```
  Expected output:
  ```
  "second"
  ```
  Error:
  ```
  Can't parse selector
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
  expectingAnObject
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
  Can't execute query
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
  expectingAnObject
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
  expectingAnObject
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
  expectingAnObject
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
  expectingAnObject
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  Error:
  ```
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
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
  timeout: sending signal TERM to command './build/Swift_SwiftPath'
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Swift_SwiftPath.
