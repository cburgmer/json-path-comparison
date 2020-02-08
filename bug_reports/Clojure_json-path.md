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
  Actual output:
  ```
  "third"
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
  	at java.base/java.lang.Integer.parseInt(Integer.java:620)
  	at java.base/java.lang.Integer.parseInt(Integer.java:776)
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:70)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
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

- [ ] `$[0:5]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Actual output:
  ```
  "first"
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

- [ ] `$[0:3:1]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Actual output:
  ```
  "first"
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
  "first"
  ```

- [ ] `$[0:0]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  []
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
  "third"
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

- [ ] `$[4,1]`
  Input:
  ```
  [1, 2, 3, 4, 5]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Actual output:
  ```
  5
  ```

- [ ] `$[?(@.key==42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 42}]
  ```
  Actual output:
  ```
  [{"some": "value"}]
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
  Actual output:
  ```
  []
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
  Error:
  ```
  Exception in thread "main" java.lang.NullPointerException
  	at clojure.lang.Numbers.ops(Numbers.java:1068)
  	at clojure.lang.Numbers.lt(Numbers.java:251)
  	at clojure.core$_LT_.invokeStatic(core.clj:907)
  	at clojure.core$_LT_.invoke(core.clj:900)
  	at clojure.lang.AFn.applyToHelper(AFn.java:156)
  	at clojure.lang.RestFn.applyTo(RestFn.java:132)
  	at clojure.core$apply.invokeStatic(core.clj:665)
  	at clojure.core$apply.invoke(core.clj:660)
  	at json_path.walker$eval_eq_expr.invokeStatic(walker.clj:7)
  	at json_path.walker$eval_eq_expr.invoke(walker.clj:6)
  	at json_path.walker$eval_expr.invokeStatic(walker.clj:12)
  	at json_path.walker$eval_expr.invoke(walker.clj:9)
  	at json_path.walker$walk_selector$fn__1015.invoke(walker.clj:81)
  	at clojure.core$filter$fn__5878.invoke(core.clj:2817)
  	at clojure.lang.LazySeq.sval(LazySeq.java:42)
  	at clojure.lang.LazySeq.seq(LazySeq.java:51)
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
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:20)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
  ```

- [ ] `$['key']`
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
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
  "value"
  ```
  Error:
  ```
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Exception in thread "main" java.lang.Exception: object must be an array.
  	at json_path.walker$walk_selector.invokeStatic(walker.clj:74)
  	at json_path.walker$walk_selector.invoke(walker.clj:63)
  	at json_path.walker$walk.invokeStatic(walker.clj:87)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path.walker$walk$fn__1026.invoke(walker.clj:89)
  	at json_path.walker$map_SHARP_.invokeStatic(walker.clj:22)
  	at json_path.walker$map_SHARP_.invoke(walker.clj:17)
  	at json_path.walker$walk.invokeStatic(walker.clj:89)
  	at json_path.walker$walk.invoke(walker.clj:84)
  	at json_path$query.invokeStatic(json_path.clj:7)
  	at json_path$query.invoke(json_path.clj:6)
  	at json_path$at_path.invokeStatic(json_path.clj:10)
  	at json_path$at_path.invoke(json_path.clj:9)
  	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
  	at json_path_comparison.core$_main.doInvoke(core.clj:6)
  	at clojure.lang.RestFn.applyTo(RestFn.java:137)
  	at json_path_comparison.core.main(Unknown Source)
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
  Actual output:
  ```
  ["value", "entry"]
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
  [40, 42]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Clojure_json-path.
