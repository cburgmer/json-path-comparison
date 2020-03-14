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
  Error:
  ```
  json-path-comparison: expected array, found {":":42,"more":"string","a":1,"b":2,"c":3}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[:]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[::]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[1:3:]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[':']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['@']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['.']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['"']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['$']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[',']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['*']
   Error: searchBeginningWithSlice: string
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
  Actual output:
  ```
  1
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
  json-path-comparison: expected key a in object {"b":1}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  "forty-two"
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['one','three'].key
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $.屬性
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[?(@[1]=='b')]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: not enough input
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
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
  json-path-comparison: searchBeginningWithSlice: not enough input
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
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
