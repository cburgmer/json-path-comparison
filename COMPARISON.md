# Comparison of different implementations of JSONPath

<table>
<thead>
<tr>
<th></th>
<th></th>
<th>Clojure (json-path)</th>
<th>Rust (jsonpath_lib)</th>
</tr>
</thead>
<tbody>
<tr>
<td>Array index step end</td>
<td><code>$.book[:2]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Recursive attribute</td>
<td><code>$..author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Last array index</td>
<td><code>$.book[-1:]</code></td>
<td>
<a href="#last_array_index___Clojure_json-path">✗</a>
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All elements</td>
<td><code>$..*</code></td>
<td>
<a href="#all_elements___Clojure_json-path">✗</a>
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start end</td>
<td><code>$.book[1:3]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start end step</td>
<td><code>$.book[0:3:2]</code></td>
<td>
✓
</td>
<td>
<a href="#array_index_step_start_end_step___Rust_jsonpath_lib">✗</a>
</td>
</tr>
<tr>
<td>Array index</td>
<td><code>$.book[2]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Deep attribute</td>
<td><code>$.store.book[*].author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Bracket for object with double quotes</td>
<td><code>$["key"]</code></td>
<td>
<a href="#bracket_for_object_with_double_quotes___Clojure_json-path">✗</a>
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Root</td>
<td><code>$</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All children</td>
<td><code>$..author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start</td>
<td><code>$.book[1:]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index union</td>
<td><code>$.book[0,1]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Nested recursive</td>
<td><code>$.store..price</code></td>
<td>
<a href="#nested_recursive___Clojure_json-path">✗</a>
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Bracket for object</td>
<td><code>$['key']</code></td>
<td>
<a href="#bracket_for_object___Clojure_json-path">✗</a>
</td>
<td>
✓
</td>
</tr>
</tbody>
</table>

## Explanation

- ✓ means the tool successfully returns a query
- ✗ says the tool failed producing output

## Error output

<h3 id="all_elements___Clojure_json-path">
Clojure (json-path), All elements
</h3>
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
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.RT.seq(RT.java:531)
    	at clojure.core$seq__5387.invokeStatic(core.clj:137)
    	at clojure.core$map$fn__5851.invoke(core.clj:2746)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.RT.seq(RT.java:531)
    	at clojure.core$seq__5387.invokeStatic(core.clj:137)
    	at clojure.core$map$fn__5851.invoke(core.clj:2746)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.Cons.next(Cons.java:39)
    	at clojure.lang.RT.next(RT.java:709)
    	at clojure.core$next__5371.invokeStatic(core.clj:64)
    	at clojure.core$concat$cat__5480$fn__5481.invoke(core.clj:742)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.RT.seq(RT.java:531)
    	at clojure.core$seq__5387.invokeStatic(core.clj:137)
    	at clojure.core$filter$fn__5878.invoke(core.clj:2809)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.Cons.next(Cons.java:39)
    	at clojure.lang.RT.next(RT.java:709)
    	at clojure.core$next__5371.invokeStatic(core.clj:64)
    	at clojure.core$next__5371.invoke(core.clj:64)
    	at cheshire.generate$generate.invokeStatic(generate.clj:130)
    	at cheshire.generate$generate.invoke(generate.clj:116)
    	at cheshire.core$generate_string.invokeStatic(core.clj:74)
    	at cheshire.core$generate_string.invoke(core.clj:49)
    	at cheshire.core$generate_string.invokeStatic(core.clj:55)
    	at cheshire.core$generate_string.invoke(core.clj:49)
    	at json_path_comparison.core$_main.invokeStatic(core.clj:10)
    	at json_path_comparison.core$_main.doInvoke(core.clj:6)
    	at clojure.lang.RestFn.applyTo(RestFn.java:137)
    	at json_path_comparison.core.main(Unknown Source)

<h3 id="array_index_step_start_end_step___Rust_jsonpath_lib">
Rust (jsonpath_lib), Array index step start end step
</h3>
    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$.book[0:3:2]\n^^^^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="bracket_for_object___Clojure_json-path">
Clojure (json-path), Bracket for object
</h3>
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

<h3 id="bracket_for_object_with_double_quotes___Clojure_json-path">
Clojure (json-path), Bracket for object with double quotes
</h3>
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

<h3 id="last_array_index___Clojure_json-path">
Clojure (json-path), Last array index
</h3>
    Exception in thread "main" java.lang.IndexOutOfBoundsException
    	at clojure.lang.PersistentVector.arrayFor(PersistentVector.java:158)
    	at clojure.lang.PersistentVector.nth(PersistentVector.java:162)
    	at clojure.lang.RT.nth(RT.java:892)
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

<h3 id="nested_recursive___Clojure_json-path">
Clojure (json-path), Nested recursive
</h3>
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

