# Comparison of different implementations of JSONPath

This sheet makes no statement on the correctness of any of the tools, it merely believes in what the majority says.

<table>
<thead>
<tr>
<th></th>
<th></th>
<th>Clojure (json-path)</th>
<th>JavaScript (Goessner-jsonpath)</th>
<th>JavaScript (jsonpath)</th>
<th>JavaScript (jsonpath-plus)</th>
<th>Rust (jsonpath_lib)</th>
</tr>
</thead>
<tbody>
<tr>
<td>Root</td>
<td><code>$</code></td>
<td>
✓
</td>
<td>
<a href="#JavaScript_Goessner-jsonpath___root">e</a>
</td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All elements</td>
<td><code>$..*</code></td>
<td>
<a href="#Clojure_json-path___all_elements">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
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
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>List result</td>
<td><code>$.book</code></td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
</tr>
<tr>
<td>All children</td>
<td><code>$.book.*</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
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
<a href="#Clojure_json-path___last_array_index">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index union</td>
<td><code>$.book[0,1]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
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
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
<a href="#Rust_jsonpath_lib___array_index_step_start_end_step">e</a>
</td>
</tr>
<tr>
<td>Array index step start end</td>
<td><code>$.book[1:3]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
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
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index</td>
<td><code>$.book[2]</code></td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
</tr>
<tr>
<td>Array index step end</td>
<td><code>$.book[:2]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All children with nested</td>
<td><code>$.store.*</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
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
<a href="#Clojure_json-path___nested_recursive">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
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
<td>
✓
</td>
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
<a href="#Clojure_json-path___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
<a href="#JavaScript_Goessner-jsonpath___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="#JavaScript_jsonpath-plus___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
?
</td>
</tr>
<tr>
<td>Bracket for object</td>
<td><code>$['key']</code></td>
<td>
<a href="#Clojure_json-path___bracket_for_object">e</a>
</td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✗
</td>
</tr>
</tbody>
</table>

## Explanation

- ✓, the result of this tool matches what the majority says
- ✗, a result is different to multiple others
- ?, the results disagree, but there are not enough samples to be conclusive on which one is probably correct
- (✓), there are not enough candidates available to check for correctness
- `e`, the tool failed executing the query and probably does not support this type of query

## Error output

<h3 id="Clojure_json-path___all_elements">
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

<h3 id="Clojure_json-path___bracket_for_object">
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

<h3 id="Clojure_json-path___bracket_for_object_with_double_quotes">
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

<h3 id="Clojure_json-path___last_array_index">
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

<h3 id="Clojure_json-path___nested_recursive">
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

<h3 id="JavaScript_Goessner-jsonpath___bracket_for_object_with_double_quotes">
JavaScript (Goessner-jsonpath), Bracket for object with double quotes
</h3>

    jsonpath returned false, this might indicate an error

<h3 id="JavaScript_Goessner-jsonpath___root">
JavaScript (Goessner-jsonpath), Root
</h3>

    jsonpath returned false, this might indicate an error

<h3 id="JavaScript_jsonpath-plus___bracket_for_object_with_double_quotes">
JavaScript (jsonpath-plus), Bracket for object with double quotes
</h3>

    events.js:177
          throw er; // Unhandled 'error' event
          ^
    
    TypeError [ERR_INVALID_ARG_TYPE]: The "chunk" argument must be one of type string or Buffer. Received type undefined
        at validChunk (_stream_writable.js:265:10)
        at SyncWriteStream.Writable.write (_stream_writable.js:299:21)
        at ReadStream.<anonymous> (/Users/cburgmer/projekte/json-path-comparison/tools/JavaScript_jsonpath-plus/index.js:24:12)
        at ReadStream.emit (events.js:205:15)
        at endReadableNT (_stream_readable.js:1137:12)
        at processTicksAndRejections (internal/process/task_queues.js:84:9)
    Emitted 'error' event at:
        at emitErrorNT (internal/streams/destroy.js:91:8)
        at emitErrorAndCloseNT (internal/streams/destroy.js:59:3)
        at processTicksAndRejections (internal/process/task_queues.js:84:9)

<h3 id="Rust_jsonpath_lib___array_index_step_start_end_step">
Rust (jsonpath_lib), Array index step start end step
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$.book[0:3:2]\n^^^^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

