Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[-1:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.IndexOutOfBoundsException
  	at clojure.lang.RT.nthFrom(RT.java:924)
  	at clojure.lang.RT.nth(RT.java:893)
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.NumberFormatException: null
  	at java.base/java.lang.Integer.parseInt(Integer.java:614)
  	at java.base/java.lang.Integer.parseInt(Integer.java:770)
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:68)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
  ```

- [ ] `$[:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  "third"
  ```

- [ ] `$[1:]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third", "forth", "fifth"]
  ```
  Actual output:
  ```
  "second"
  ```

- [ ] `$[1:3]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  "second"
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
  "first"
  ```

- [ ] `$[0:1]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Actual output:
  ```
  "first"
  ```

- [ ] `$[0,1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  "first"
  ```

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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
  No JSON object could be decoded
  ```

- [ ] `$['key','another']`
  Input:
  ```
  {"another": "entry", "key": "value"}
  ```
  Expected output:
  ```
  ["value", "entry"]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
  No JSON object could be decoded
  ```

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
  	at json_path.walker$walk_selector.invoke(walker.clj:61)
  	at json_path.walker$walk.invokeStatic(walker.clj:82)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:84)
  	at json_path.walker$walk.invoke(walker.clj:79)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
  No JSON object could be decoded
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  [["value"]]
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "price": 8.95, "title": "Sayings of the Century", "author": "Nigel Rees"}, {"category": "fiction", "price": 12.99, "title": "Sword of Honour", "author": "Evelyn Waugh"}, {"category": "fiction", "price": 8.99, "title": "Moby Dick", "isbn": "0-553-21311-3", "author": "Herman Melville"}, {"category": "fiction", "price": 22.99, "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "author": "J. R. R. Tolkien"}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [8.95, 12.99, 8.99, 22.99, 19.95]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.IllegalArgumentException: Don't know how to create ISeq from: java.lang.Double
  	at clojure.lang.RT.seqFrom(RT.java:553)
  	at clojure.lang.RT.seq(RT.java:533)
  	at clojure.core$seq__5387.invokeStatic(core.clj:137)
  	at clojure.core$empty_QMARK_.invokeStatic(core.clj:6206)
  	at clojure.core$empty_QMARK_.invoke(core.clj:6206)
  	at json_path.walker$walk_path$fn__999.invoke(walker.clj:58)
  	at clojure.core$complement$fn__5654.invoke(core.clj:1441)
  	at clojure.core$filter$fn__5878.invoke(core.clj:2821)
  	at clojure.lang.LazySeq.sval(LazySeq.java:42)
  	at clojure.lang.LazySeq.seq(LazySeq.java:58)
  	at clojure.lang.RT.seq(RT.java:531)
  	at clojure.core$seq__5387.invokeStatic(core.clj:137)
  	at clojure.core$map$fn__5851.invoke(core.clj:2746)
  	at clojure.lang.LazySeq.sval(LazySeq.java:42)
  	at clojure.lang.LazySeq.seq(LazySeq.java:51)
  	at clojure.lang.RT.seq(RT.java:531)
  	at clojure.core$seq__5387.invokeStatic(core.clj:137)
  	at clojure.core$seq__5387.invoke(core.clj:137)
  	at clojure.core$tree_seq$walk__6372$fn__6373.invoke(core.clj:4945)
  	at clojure.lang.LazySeq.sval(LazySeq.java:42)
  	at clojure.lang.LazySeq.seq(LazySeq.java:51)
  	at clojure.lang.LazySeq.more(LazySeq.java:87)
  	at clojure.lang.RT.more(RT.java:718)
  	at clojure.core$rest__5373.invokeStatic(core.clj:73)
  	at clojure.core$flatten.invokeStatic(core.clj:7136)
  	at clojure.core$flatten.invoke(core.clj:7136)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:19)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Actual output:
  ```
  ["string", 42, {"key": "value"}, 0, 1]
  ```

- [ ] `$[*]`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  ["string", 42, {"key": "value"}, 0, 1]
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
  ["string", 42, {"key": "value"}, 0, 1]
  ```

- [ ] `$.*`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  ["string", 42, {"key": "value"}, 0, 1]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Clojure_json-path.
