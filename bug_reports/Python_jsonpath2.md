Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
  ```

- [ ] `$.['key']`
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
  line 1:3 token recognition error at: '''
  ValueError("line 1:3 token recognition error at: '''")
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
  line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
  ```

- [ ] `$.key-dash`
  Input:
  ```
  {"key-dash": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  line 1:5 token recognition error at: '-d'
  ValueError("line 1:5 token recognition error at: '-d'")
  ```

- [ ] `$.null`
  Input:
  ```
  {"null": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  line 1:2 mismatched input 'null' expecting {'*', ID}
  ValueError("line 1:2 mismatched input 'null' expecting {'*', ID}")
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
  line 1:2 token recognition error at: '屬'
  ValueError("line 1:2 token recognition error at: '屬'")
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
  line 1:2 mismatched input '2' expecting {'*', ID}
  ValueError("line 1:2 mismatched input '2' expecting {'*', ID}")
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
  line 1:6 token recognition error at: '''
  ValueError("line 1:6 token recognition error at: '''")
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
  line 1:10 token recognition error at: '''
  ValueError("line 1:10 token recognition error at: '''")
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
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  line 1:5 token recognition error at: '''
  ValueError("line 1:5 token recognition error at: '''")
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Python_jsonpath2.
