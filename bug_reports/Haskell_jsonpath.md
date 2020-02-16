Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[:]
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(29,1)-(63,29): Non-exhaustive patterns in function executeJSONPathElement
  
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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['@']
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['.']
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['$']
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['*']
   Error: serachBegingingWithSlice: string
  ```

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['special:"chars']
   Error: serachBegingingWithSlice: string
  ```

- [ ] `$[*].a`
  Input:
  ```
  [{"a": 1}, {"b": 1}, {"a": 1}]
  ```
  Expected output:
  ```
  [1, 1]
  ```
  Error:
  ```
  json-path-comparison: expected key a in object {"b":1}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
  ```

- [ ] `$[*].bar[*].baz`
  Input:
  ```
  [{"bar": [{"baz": "hello"}]}]
  ```
  Expected output:
  ```
  ["hello"]
  ```
  Actual output:
  ```
  "hello"
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
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['one','three'].key
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: Search failed
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  Error:
  ```
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[?(@.key=='value')]
   Error: serachBegingingWithSlice: string
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  [{"some": "some value"}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Error:
  ```
  json-path-comparison: serachBegingingWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[?(@.key)]
   Error: serachBegingingWithSlice: string
  ```

- [ ] `$`
  Input:
  ```
  {"key": "value", "another key": {"complex": ["a", 1]}}
  ```
  Expected output:
  ```
  {"another key": {"complex": ["a", 1]}, "key": "value"}
  ```
  Error:
  ```
  json-path-comparison: serachBegingingWithSlice: not enough input
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $
   Error: serachBegingingWithSlice: not enough input
  ```

- [ ] `$`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  42
  ```
  Error:
  ```
  json-path-comparison: serachBegingingWithSlice: not enough input
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $
   Error: serachBegingingWithSlice: not enough input
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
  {"c": "cc1", "d": "dd1", "e": "ee1"}
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Haskell_jsonpath.
