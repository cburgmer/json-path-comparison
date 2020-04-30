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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  Exception in thread "main" com.jayway.jsonpath.PathNotFoundException: Filter: [1:3] can only be applied to arrays. Current context is: {:=42, more=string, a=1, b=2, c=3}
  	at com.jayway.jsonpath.internal.path.ArrayPathToken.checkArrayModel(ArrayPathToken.java:184)
  	at com.jayway.jsonpath.internal.path.ArrayPathToken.evaluate(ArrayPathToken.java:47)
  	at com.jayway.jsonpath.internal.path.RootPathToken.evaluate(RootPathToken.java:62)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:53)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:61)
  	at com.jayway.jsonpath.JsonPath.read(JsonPath.java:187)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:102)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:89)
  	at query.App.main(App.java:25)
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  Exception in thread "main" com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: :
  	at com.jayway.jsonpath.internal.path.ArraySliceOperation.parse(ArraySliceOperation.java:70)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readArrayToken(PathCompiler.java:537)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken(PathCompiler.java:139)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken(PathCompiler.java:124)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:58)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:75)
  	at com.jayway.jsonpath.JsonPath.<init>(JsonPath.java:101)
  	at com.jayway.jsonpath.JsonPath.compile(JsonPath.java:467)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:87)
  	at query.App.main(App.java:25)
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  Exception in thread "main" com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: ::
  	at com.jayway.jsonpath.internal.path.ArraySliceOperation.parse(ArraySliceOperation.java:70)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readArrayToken(PathCompiler.java:537)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken(PathCompiler.java:139)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken(PathCompiler.java:124)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:58)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:75)
  	at com.jayway.jsonpath.JsonPath.<init>(JsonPath.java:101)
  	at com.jayway.jsonpath.JsonPath.compile(JsonPath.java:467)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:87)
  	at query.App.main(App.java:25)
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
  ["first", "second", "third"]
  ```

- [ ] `$[010:024:010]`
  Input:
  ```
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
  ```
  Expected output:
  ```
  [10, 20]
  ```
  Actual output:
  ```
  [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
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
  ["first", "second", "third", "forth"]
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  Exception in thread "main" com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: ::2
  	at com.jayway.jsonpath.internal.path.ArraySliceOperation.parse(ArraySliceOperation.java:70)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readArrayToken(PathCompiler.java:537)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken(PathCompiler.java:139)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken(PathCompiler.java:124)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:58)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:75)
  	at com.jayway.jsonpath.JsonPath.<init>(JsonPath.java:101)
  	at com.jayway.jsonpath.JsonPath.compile(JsonPath.java:467)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:87)
  	at query.App.main(App.java:25)
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  Exception in thread "main" com.jayway.jsonpath.InvalidPathException: Found empty property at index 5
  	at com.jayway.jsonpath.internal.path.PathCompiler.fail(PathCompiler.java:616)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readBracketPropertyToken(PathCompiler.java:579)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken(PathCompiler.java:138)
  	at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken(PathCompiler.java:124)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:58)
  	at com.jayway.jsonpath.internal.path.PathCompiler.compile(PathCompiler.java:75)
  	at com.jayway.jsonpath.JsonPath.<init>(JsonPath.java:101)
  	at com.jayway.jsonpath.JsonPath.compile(JsonPath.java:467)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:87)
  	at query.App.main(App.java:25)
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
  Actual output:
  ```
  {"another": "entry", "key": "value"}
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
  {"c": "cc1", "d": "dd1"}
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
  Actual output:
  ```
  {"key": "value"}
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.jayway.jsonpath.
