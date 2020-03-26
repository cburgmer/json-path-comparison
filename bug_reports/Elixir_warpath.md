Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:3]`
  Input:
  ```
  {":": 42, "more": "string", "a": 1, "b": 2, "c": 3}
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [1, 2]
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, missing slice params, start or end index must be supplied
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, missing slice params, start or end index must be supplied
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  []
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
  Actual output:
  ```
  ["deepest", "first nested", "more", {"nested": ["deepest", "second"]}]
  ```

- [ ] `$[2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  "third"
  ```
  Actual output:
  ```
  ["third"]
  ```

- [ ] `$[0]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  "first"
  ```
  Actual output:
  ```
  ["first"]
  ```

- [ ] `$[-1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  "third"
  ```
  Error:
  ```
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: ']'
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  [[null], [3]]
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
  [[1, 2], ["a", "b"]]
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: ','
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.key-dash`
  Input:
  ```
  {"key-dash": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: '-'
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Warpath.ExpressionError) Invalid syntax on line 1, {:illegal, [23660]}
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: 2
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  Actual output:
  ```
  [[42]]
  ```

- [ ] `$.*.*`
  Input:
  ```
  [[1, 2, 3], [4, 5, 6]]
  ```
  Expected output:
  ```
  [1, 2, 3, 4, 5, 6]
  ```
  Actual output:
  ```
  [[1, 2, 3], [4, 5, 6]]
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
  42
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: '['
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: '['
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  ** (Warpath.ExpressionError) Invalid syntax on line 1, {:illegal, '"'}
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
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
  ** (Warpath.ExpressionError) Parser error: Invalid token on line 1, syntax error before: ','
      lib/jsonpath.ex:9: Mix.Tasks.Execute.run/1
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_warpath.
