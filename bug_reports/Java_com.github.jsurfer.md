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

- [ ] `$[?(@.key>=42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 42}, {"key": 43}, {"key": 42.0001}, {"key": 100}]
  ```
  Actual output:
  ```
  [{"key": 42}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}]
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [{"key": 0}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": 0}]
  ```
  Error:
  ```
  Exception in thread "main" org.jsfr.json.exception.JsonSurfingException: Parser is stopped
  	at org.jsfr.json.DefaultErrorHandlingStrategy.handleParsingException(DefaultErrorHandlingStrategy.java:35)
  	at org.jsfr.json.JacksonParser$JacksonResumableParser.parse(JacksonParser.java:143)
  	at org.jsfr.json.JacksonParser.parse(JacksonParser.java:228)
  	at org.jsfr.json.JsonSurfer.surf(JsonSurfer.java:180)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:289)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:262)
  	at query.App.main(App.java:27)
  Caused by: java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  	at java.base/java.math.BigDecimal.<init>(BigDecimal.java:518)
  	at java.base/java.math.BigDecimal.<init>(BigDecimal.java:401)
  	at java.base/java.math.BigDecimal.<init>(BigDecimal.java:834)
  	at org.jsfr.json.filter.LessThanNumPredicate.apply(LessThanNumPredicate.java:49)
  	at org.jsfr.json.JsonFilterVerifier.primitive(JsonFilterVerifier.java:116)
  	at org.jsfr.json.ContentDispatcher.primitive(ContentDispatcher.java:147)
  	at org.jsfr.json.ContentDispatcher.primitive(ContentDispatcher.java:147)
  	at org.jsfr.json.SurfingContext.primitive(SurfingContext.java:299)
  	at org.jsfr.json.JacksonParser$JacksonResumableParser.doPare(JacksonParser.java:176)
  	at org.jsfr.json.JacksonParser$JacksonResumableParser.parse(JacksonParser.java:141)
  	... 6 more
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

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["value", {"complex": "string", "primitives": [0, 1]}, "string", [0, 1], 0, 1]
  ```
  Actual output:
  ```
  ["value", "string", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.github.jsurfer.
