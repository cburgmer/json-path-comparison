Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1]`
  Input:
  ```
  ["one element"]
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
  Exception in thread "main" com.jayway.jsonpath.PathNotFoundException: No results for path: $[1]
  	at com.jayway.jsonpath.internal.path.EvaluationContextImpl.getValue(EvaluationContextImpl.java:133)
  	at com.jayway.jsonpath.JsonPath.read(JsonPath.java:187)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:102)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:89)
  	at query.App.main(App.java:28)
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
  	at query.App.main(App.java:28)
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
  [{"another": "entry", "key": "value"}]
  ```

- [ ] `$.missing`
  Input:
  ```
  {"key": "value"}
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
  Exception in thread "main" com.jayway.jsonpath.PathNotFoundException: No results for path: $['missing']
  	at com.jayway.jsonpath.internal.path.EvaluationContextImpl.getValue(EvaluationContextImpl.java:133)
  	at com.jayway.jsonpath.JsonPath.read(JsonPath.java:187)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:102)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:89)
  	at query.App.main(App.java:28)
  ```

- [ ] `$.key`
  Input:
  ```
  [0, 1]
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
  Exception in thread "main" com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
  	at com.jayway.jsonpath.internal.path.PropertyPathToken.evaluate(PropertyPathToken.java:71)
  	at com.jayway.jsonpath.internal.path.RootPathToken.evaluate(RootPathToken.java:62)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:53)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:61)
  	at com.jayway.jsonpath.JsonPath.read(JsonPath.java:187)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:102)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:89)
  	at query.App.main(App.java:28)
  ```

- [ ] `$.key`
  Input:
  ```
  [{"key": "value"}]
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
  Exception in thread "main" com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
  	at com.jayway.jsonpath.internal.path.PropertyPathToken.evaluate(PropertyPathToken.java:71)
  	at com.jayway.jsonpath.internal.path.RootPathToken.evaluate(RootPathToken.java:62)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:53)
  	at com.jayway.jsonpath.internal.path.CompiledPath.evaluate(CompiledPath.java:61)
  	at com.jayway.jsonpath.JsonPath.read(JsonPath.java:187)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:102)
  	at com.jayway.jsonpath.internal.JsonContext.read(JsonContext.java:89)
  	at query.App.main(App.java:28)
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.jayway.jsonpath.
