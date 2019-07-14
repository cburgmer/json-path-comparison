Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[-1:]`
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
  ["first", "second", "third"]
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
  Exception in thread "main" org.antlr.v4.runtime.misc.ParseCancellationException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:66)
  	at org.antlr.v4.runtime.Parser.match(Parser.java:206)
  	at org.jsfr.json.compiler.JsonPathParser.slicing(JsonPathParser.java:636)
  	at org.jsfr.json.compiler.JsonPathParser.relativePath(JsonPathParser.java:265)
  	at org.jsfr.json.compiler.JsonPathParser.path(JsonPathParser.java:159)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:283)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:262)
  	at query.App.main(App.java:27)
  Caused by: org.antlr.v4.runtime.InputMismatchException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:61)
  	... 8 more
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
  Exception in thread "main" org.antlr.v4.runtime.misc.ParseCancellationException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:66)
  	at org.antlr.v4.runtime.Parser.match(Parser.java:206)
  	at org.jsfr.json.compiler.JsonPathParser.slicing(JsonPathParser.java:636)
  	at org.jsfr.json.compiler.JsonPathParser.relativePath(JsonPathParser.java:265)
  	at org.jsfr.json.compiler.JsonPathParser.path(JsonPathParser.java:159)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:283)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:262)
  	at query.App.main(App.java:27)
  Caused by: org.antlr.v4.runtime.InputMismatchException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:61)
  	... 8 more
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
  Exception in thread "main" org.antlr.v4.runtime.misc.ParseCancellationException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:66)
  	at org.antlr.v4.runtime.Parser.match(Parser.java:206)
  	at org.jsfr.json.compiler.JsonPathParser.slicing(JsonPathParser.java:636)
  	at org.jsfr.json.compiler.JsonPathParser.relativePath(JsonPathParser.java:265)
  	at org.jsfr.json.compiler.JsonPathParser.path(JsonPathParser.java:159)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:283)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:262)
  	at query.App.main(App.java:27)
  Caused by: org.antlr.v4.runtime.InputMismatchException
  	at org.antlr.v4.runtime.BailErrorStrategy.recoverInline(BailErrorStrategy.java:61)
  	... 8 more
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["top", "value", "something", {"key": "russian dolls"}, "russian dolls"]
  ```
  Actual output:
  ```
  ["value", "something", "russian dolls", {"key": "russian dolls"}, "top"]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.github.jsurfer.