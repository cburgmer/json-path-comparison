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
  Exception in thread "main" java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
  	at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:64)
  	at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:70)
  	at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:248)
  	at java.base/java.util.Objects.checkIndex(Objects.java:372)
  	at java.base/java.util.ArrayList.get(ArrayList.java:458)
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:232)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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

- [ ] `$[::2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third", "fifth"]
  ```
  Actual output:
  ```
  ["first", "second"]
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
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=?, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=?, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, null, 42]
  ```
  Actual output:
  ```
  []
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
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonObject.read(JsonResult.kt:7)
  	at query.AppKt.main(App.kt:10)
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
  Error:
  ```
  Exception in thread "main" java.lang.IllegalArgumentException: Unexpected char, char=*, index=2
  	at com.nfeld.jsonpathlite.PathCompiler.compileBracket$json_path_lite(PathCompiler.kt:198)
  	at com.nfeld.jsonpathlite.PathCompiler.compile$json_path_lite(PathCompiler.kt:59)
  	at com.nfeld.jsonpathlite.JsonPath.<init>(JsonPath.kt:24)
  	at com.nfeld.jsonpathlite.JsonArray.read(JsonResult.kt:11)
  	at query.AppKt.main(App.kt:10)
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
  Actual output:
  ```
  null
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
  null
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Kotlin_com.nfeld.jsonpathlite.
