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
  	at java.base/java.lang.Integer.parseInt(Integer.java:614)
  	at java.base/java.lang.Integer.parseInt(Integer.java:770)
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
  {"@": "value"}
  ```
  Expected output:
  ```
  ["value"]
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
  {"$": "value"}
  ```
  Expected output:
  ```
  ["value"]
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
  ["value"]
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
  ["value"]
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
  ["value"]
  ```
  Actual output:
  ```
  [["value", "entry"]]
  ```

- [ ] `$.['key']`
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
