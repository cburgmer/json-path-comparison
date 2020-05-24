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

- [ ] `$['missing']`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: expected key missing in object {"key":"value"}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $["key"]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['']
   Error: searchBeginningWithSlice: string
  ```

- [ ] `$[-1]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: index -1 invalid for array []
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  json-path-comparison: index 1 invalid for array [1]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
  ```

- [ ] `$[1]`
  Input:
  ```
  ["one element"]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: index 1 invalid for array ["one element"]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[']']
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['.*']
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['ni.*']
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

- [ ] `$.key`
  Input:
  ```
  [0, 1]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: expected object, found [0,1]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
  ```

- [ ] `$.id`
  Input:
  ```
  [{"id": 2}]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: expected object, found [{"id":2}]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
  ```

- [ ] `$.missing`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: expected key missing in object {"key":"value"}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  []
  ```
  Error:
  ```
  json-path-comparison: Search failed
  CallStack (from HasCallStack):
    error, called at app/Main.hs:18:22 in main:Main
  ```

- [ ] `$[?(@['@key']==42)]`
  Input:
  ```
  [{"@key": 0}, {"@key": 42}, {"key": 42}, {"@key": 43}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"@key": 42}]
  ```
  Error:
  ```
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[?(@['@key']==42)]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[?(@.key=='value')]
   Error: searchBeginningWithSlice: string
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

- [ ] `$`
  Input:
  ```
  false
  ```
  Expected output:
  ```
  false
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
  true
  ```
  Expected output:
  ```
  true
  ```
  Error:
  ```
  json-path-comparison: searchBeginningWithSlice: not enough input
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
  ```

- [ ] `$['key','another']`
  Input:
  ```
  {"key": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value", "entry"]
  ```
  Error:
  ```
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['key','another']
   Error: searchBeginningWithSlice: string
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

- [ ] `$['missing','key']`
  Input:
  ```
  {"key": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $['missing','key']
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: searchBeginningWithSlice: string
  CallStack (from HasCallStack):
    error, called at app/Main.hs:36:7 in main:Main
  Invalid JSONPath: $[ 0 , 1 ]
   Error: searchBeginningWithSlice: string
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Haskell_jsonpath.
