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
  ** (Jaxon.ParseError) Expected an integer at `1:3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:5]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `7:10]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `1:3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `1:10]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `1:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `::]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `2:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:0]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `-1:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `-2:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `-4:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:3:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:3:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:4:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `1:3:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `::2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['key']`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'key']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  ["first"]
  ```

- [ ] `$['two.some']`
  Input:
  ```
  {"one": {"key": "value"}, "two": {"some": "more", "key": "other value"}, "two.some": "42"}
  ```
  Expected output:
  ```
  ["42"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'two.some'`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$["key"]`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `"key"]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-1]`
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
  []
  ```

- [ ] `$[':']`
  Input:
  ```
  {":": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `':']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['@']`
  Input:
  ```
  {"@": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'@']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['.']`
  Input:
  ```
  {".": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'.']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `'"']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['0']`
  Input:
  ```
  {"0": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'0']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['$']`
  Input:
  ```
  {"$": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'$']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `',']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'*']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:2][*]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Unexpected a closing bracket, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  []
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
  ** (Jaxon.ParseError) Expected an integer at `?(@.id==42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  ["top"]
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0,2].key`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `'one','thr`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  []
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
  ** (Jaxon.ParseError) Unexpected number, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Unexpected a closing bracket, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  []
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
  ** (Jaxon.ParseError) Expected an integer at `?(@['key']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `?(@[1]=='b`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=="`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `?(@.key<42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0,1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  []
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `4,1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_jaxon.
