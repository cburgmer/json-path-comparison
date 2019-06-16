## Errors

<h3 id="Clojure_json-path___array_index_last">
Clojure (json-path), Array index last
</h3>

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

<h3 id="Clojure_json-path___array_index_out_of_bounds">
Clojure (json-path), Array index out of bounds
</h3>

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

<h3 id="Clojure_json-path___array_index_slice_last_no_end">
Clojure (json-path), Array index slice last no end
</h3>

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

<h3 id="Clojure_json-path___array_index_slice_no_start_no_end">
Clojure (json-path), Array index slice no start no end
</h3>

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

<h3 id="Clojure_json-path___key_bracket_notation">
Clojure (json-path), Key bracket notation
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

<h3 id="Clojure_json-path___key_bracket_notation_union">
Clojure (json-path), Key bracket notation union
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

<h3 id="Clojure_json-path___key_bracket_notation_with_double_quotes">
Clojure (json-path), Key bracket notation with double quotes
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

<h3 id="Clojure_json-path___key_bracket_notation_with_number">
Clojure (json-path), Key bracket notation with number
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

<h3 id="Clojure_json-path___key_bracket_notation_with_number_without_quotes">
Clojure (json-path), Key bracket notation with number without quotes
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

<h3 id="Clojure_json-path___key_bracket_notation_with_single_quote">
Clojure (json-path), Key bracket notation with single quote
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

<h3 id="Clojure_json-path___key_bracket_notation_with_single_quote_escaped">
Clojure (json-path), Key bracket notation with single quote escaped
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

<h3 id="Clojure_json-path___key_bracket_notation_with_special_characters">
Clojure (json-path), Key bracket notation with special characters
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

<h3 id="Clojure_json-path___key_bracket_notation_without_quotes">
Clojure (json-path), Key bracket notation without quotes
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

<h3 id="Clojure_json-path___recursive_array_index">
Clojure (json-path), Recursive array index
</h3>

    Exception in thread "main" java.lang.Exception: object must be an array.
    	at json_path.walker$walk_selector.invokeStatic(walker.clj:69)
    	at json_path.walker$walk_selector.invoke(walker.clj:61)
    	at json_path.walker$walk.invokeStatic(walker.clj:82)
    	at json_path.walker$walk.invoke(walker.clj:79)
    	at json_path.walker$walk$fn__1026.invoke(walker.clj:84)
    	at clojure.core$map$fn__5851.invoke(core.clj:2755)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.RT.seq(RT.java:531)
    	at clojure.core$seq__5387.invokeStatic(core.clj:137)
    	at clojure.core$map$fn__5851.invoke(core.clj:2746)
    	at clojure.lang.LazySeq.sval(LazySeq.java:42)
    	at clojure.lang.LazySeq.seq(LazySeq.java:51)
    	at clojure.lang.Cons.next(Cons.java:39)
    	at clojure.lang.RT.boundedLength(RT.java:1788)
    	at clojure.lang.RestFn.applyTo(RestFn.java:130)
    	at clojure.core$apply.invokeStatic(core.clj:665)
    	at clojure.core$mapcat.invokeStatic(core.clj:2783)
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

<h3 id="Clojure_json-path___recursive_wildcard">
Clojure (json-path), Recursive wildcard
</h3>

    Exception in thread "main" java.lang.IllegalArgumentException: Don't know how to create ISeq from: java.lang.Integer
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

<h3 id="Clojure_json-path___recursive_with_nested_object">
Clojure (json-path), Recursive with nested object
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

<h3 id="JavaScript_Goessner___array_index_last">
JavaScript (Goessner), Array index last
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___array_index_out_of_bounds">
JavaScript (Goessner), Array index out of bounds
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___array_index_slice_start_equals_end">
JavaScript (Goessner), Array index slice start equals end
</h3>

    jsonpath returned false, this might indicate an error

<h3 id="JavaScript_Goessner___key_bracket_notation_with_double_quotes">
JavaScript (Goessner), Key bracket notation with double quotes
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___key_bracket_notation_with_single_quote_escaped">
JavaScript (Goessner), Key bracket notation with single quote escaped
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___key_bracket_notation_with_special_characters">
JavaScript (Goessner), Key bracket notation with special characters
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___key_on_array">
JavaScript (Goessner), Key on array
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_Goessner___root">
JavaScript (Goessner), Root
</h3>

    jsonpath returned false, this might indicate an error
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_jsonpath-plus___array_index_last">
JavaScript (jsonpath-plus), Array index last
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath-plus___array_index_out_of_bounds">
JavaScript (jsonpath-plus), Array index out of bounds
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath-plus___key_bracket_notation_with_double_quotes">
JavaScript (jsonpath-plus), Key bracket notation with double quotes
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath-plus___key_bracket_notation_with_single_quote_escaped">
JavaScript (jsonpath-plus), Key bracket notation with single quote escaped
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath-plus___key_bracket_notation_with_special_characters">
JavaScript (jsonpath-plus), Key bracket notation with special characters
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath-plus___key_on_array">
JavaScript (jsonpath-plus), Key on array
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath___array_index_last">
JavaScript (jsonpath), Array index last
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath___array_index_out_of_bounds">
JavaScript (jsonpath), Array index out of bounds
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath___key_bracket_notation_with_number_without_quotes">
JavaScript (jsonpath), Key bracket notation with number without quotes
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath___key_bracket_notation_with_single_quote">
JavaScript (jsonpath), Key bracket notation with single quote
</h3>

    Parse error on line 1:
    $['single'quote']
    ----------^
    Expecting ']', ',', got 'IDENTIFIER'
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_jsonpath___key_bracket_notation_with_single_quote_escaped">
JavaScript (jsonpath), Key bracket notation with single quote escaped
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="JavaScript_jsonpath___key_bracket_notation_with_special_characters">
JavaScript (jsonpath), Key bracket notation with special characters
</h3>

    Lexical error on line 1. Unrecognized text.
    $['special:\"chars']
    --^
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_jsonpath___key_bracket_notation_without_quotes">
JavaScript (jsonpath), Key bracket notation without quotes
</h3>

    Parse error on line 1:
    $[key]
    --^
    Expecting 'STAR', 'SCRIPT_EXPRESSION', 'INTEGER', 'ARRAY_SLICE', 'FILTER_EXPRESSION', 'QQ_STRING', 'Q_STRING', got 'IDENTIFIER'
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="JavaScript_jsonpath___key_on_array">
JavaScript (jsonpath), Key on array
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Java_com.jayway.jsonpath___array_index_dot_notation">
Java (com.jayway.jsonpath), Array index dot notation
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Expected to find an object with property ['2'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'. -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Expected to find an object with property ['2'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Expected to find an object with property ['2'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['2'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at com.jayway.jsonpath.internal.path.PropertyPathToken.evaluate (PropertyPathToken.java:71)
        at com.jayway.jsonpath.internal.path.RootPathToken.evaluate (RootPathToken.java:62)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:53)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:61)
        at com.jayway.jsonpath.JsonPath.read (JsonPath.java:187)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:102)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:89)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___array_index_out_of_bounds">
Java (com.jayway.jsonpath), Array index out of bounds
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. No results for path: $[1] -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. No results for path: $[1]
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. No results for path: $[1]
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.PathNotFoundException: No results for path: $[1]
        at com.jayway.jsonpath.internal.path.EvaluationContextImpl.getValue (EvaluationContextImpl.java:133)
        at com.jayway.jsonpath.JsonPath.read (JsonPath.java:187)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:102)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:89)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___array_index_slice_no_start_no_end">
Java (com.jayway.jsonpath), Array index slice no start no end
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Failed to parse SliceOperation: : -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Failed to parse SliceOperation: :
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Failed to parse SliceOperation: :
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: :
        at com.jayway.jsonpath.internal.path.ArraySliceOperation.parse (ArraySliceOperation.java:70)
        at com.jayway.jsonpath.internal.path.PathCompiler.readArrayToken (PathCompiler.java:537)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:139)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation">
Java (com.jayway.jsonpath), Key bracket notation
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, *  -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at com.jayway.jsonpath.internal.path.PathCompiler.fail (PathCompiler.java:616)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:143)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_union">
Java (com.jayway.jsonpath), Key bracket notation union
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, *  -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at com.jayway.jsonpath.internal.path.PathCompiler.fail (PathCompiler.java:616)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:143)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_double_quotes">
Java (com.jayway.jsonpath), Key bracket notation with double quotes
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, *  -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at com.jayway.jsonpath.internal.path.PathCompiler.fail (PathCompiler.java:616)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:143)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_number">
Java (com.jayway.jsonpath), Key bracket notation with number
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value} -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.PathNotFoundException: Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at com.jayway.jsonpath.internal.path.ArrayPathToken.checkArrayModel (ArrayPathToken.java:184)
        at com.jayway.jsonpath.internal.path.ArrayPathToken.evaluate (ArrayPathToken.java:47)
        at com.jayway.jsonpath.internal.path.RootPathToken.evaluate (RootPathToken.java:62)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:53)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:61)
        at com.jayway.jsonpath.JsonPath.read (JsonPath.java:187)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:102)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:89)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_number_without_quotes">
Java (com.jayway.jsonpath), Key bracket notation with number without quotes
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value} -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.PathNotFoundException: Filter: [0] can only be applied to arrays. Current context is: {0=value}
        at com.jayway.jsonpath.internal.path.ArrayPathToken.checkArrayModel (ArrayPathToken.java:184)
        at com.jayway.jsonpath.internal.path.ArrayPathToken.evaluate (ArrayPathToken.java:47)
        at com.jayway.jsonpath.internal.path.RootPathToken.evaluate (RootPathToken.java:62)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:53)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:61)
        at com.jayway.jsonpath.JsonPath.read (JsonPath.java:187)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:102)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:89)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_single_quote">
Java (com.jayway.jsonpath), Key bracket notation with single quote
</h3>

    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in $['single'quote'] -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in $['single'quote']
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: unbalanced quotes in $['single'quote']
        at org.codehaus.mojo.exec.AbstractExecMojo.parseCommandlineArgs (AbstractExecMojo.java:225)
        at org.codehaus.mojo.exec.ExecJavaMojo.addRelevantPluginDependenciesToClasspath (ExecJavaMojo.java:563)
        at org.codehaus.mojo.exec.ExecJavaMojo.getClassLoader (ExecJavaMojo.java:520)
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:301)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_single_quote_escaped">
Java (com.jayway.jsonpath), Key bracket notation with single quote escaped
</h3>

    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in $['single\'quote'] -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: unbalanced quotes in $['single\'quote']
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: unbalanced quotes in $['single\'quote']
        at org.codehaus.mojo.exec.AbstractExecMojo.parseCommandlineArgs (AbstractExecMojo.java:225)
        at org.codehaus.mojo.exec.ExecJavaMojo.addRelevantPluginDependenciesToClasspath (ExecJavaMojo.java:563)
        at org.codehaus.mojo.exec.ExecJavaMojo.getClassLoader (ExecJavaMojo.java:520)
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:301)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_with_special_characters">
Java (com.jayway.jsonpath), Key bracket notation with special characters
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, *  -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at com.jayway.jsonpath.internal.path.PathCompiler.fail (PathCompiler.java:616)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:143)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_bracket_notation_without_quotes">
Java (com.jayway.jsonpath), Key bracket notation without quotes
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, *  -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.InvalidPathException: Could not parse token starting at position 1. Expected ?, ', 0-9, * 
        at com.jayway.jsonpath.internal.path.PathCompiler.fail (PathCompiler.java:616)
        at com.jayway.jsonpath.internal.path.PathCompiler.readNextToken (PathCompiler.java:143)
        at com.jayway.jsonpath.internal.path.PathCompiler.readContextToken (PathCompiler.java:124)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:58)
        at com.jayway.jsonpath.internal.path.PathCompiler.compile (PathCompiler.java:75)
        at com.jayway.jsonpath.JsonPath.<init> (JsonPath.java:101)
        at com.jayway.jsonpath.JsonPath.compile (JsonPath.java:467)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:87)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Java_com.jayway.jsonpath___key_on_array">
Java (com.jayway.jsonpath), Key on array
</h3>

    SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
    SLF4J: Defaulting to no-operation (NOP) logger implementation
    SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
    [ERROR] Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'. -> [Help 1]
    org.apache.maven.lifecycle.LifecycleExecutionException: Failed to execute goal org.codehaus.mojo:exec-maven-plugin:1.6.0:java (default-cli) on project query: An exception occured while executing the Java class. Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:215)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: org.apache.maven.plugin.MojoExecutionException: An exception occured while executing the Java class. Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at org.codehaus.mojo.exec.ExecJavaMojo.execute (ExecJavaMojo.java:339)
        at org.apache.maven.plugin.DefaultBuildPluginManager.executeMojo (DefaultBuildPluginManager.java:137)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:210)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:156)
        at org.apache.maven.lifecycle.internal.MojoExecutor.execute (MojoExecutor.java:148)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:117)
        at org.apache.maven.lifecycle.internal.LifecycleModuleBuilder.buildProject (LifecycleModuleBuilder.java:81)
        at org.apache.maven.lifecycle.internal.builder.singlethreaded.SingleThreadedBuilder.build (SingleThreadedBuilder.java:56)
        at org.apache.maven.lifecycle.internal.LifecycleStarter.execute (LifecycleStarter.java:128)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:305)
        at org.apache.maven.DefaultMaven.doExecute (DefaultMaven.java:192)
        at org.apache.maven.DefaultMaven.execute (DefaultMaven.java:105)
        at org.apache.maven.cli.MavenCli.execute (MavenCli.java:956)
        at org.apache.maven.cli.MavenCli.doMain (MavenCli.java:288)
        at org.apache.maven.cli.MavenCli.main (MavenCli.java:192)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launchEnhanced (Launcher.java:282)
        at org.codehaus.plexus.classworlds.launcher.Launcher.launch (Launcher.java:225)
        at org.codehaus.plexus.classworlds.launcher.Launcher.mainWithExitCode (Launcher.java:406)
        at org.codehaus.plexus.classworlds.launcher.Launcher.main (Launcher.java:347)
    Caused by: com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
        at com.jayway.jsonpath.internal.path.PropertyPathToken.evaluate (PropertyPathToken.java:71)
        at com.jayway.jsonpath.internal.path.RootPathToken.evaluate (RootPathToken.java:62)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:53)
        at com.jayway.jsonpath.internal.path.CompiledPath.evaluate (CompiledPath.java:61)
        at com.jayway.jsonpath.JsonPath.read (JsonPath.java:187)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:102)
        at com.jayway.jsonpath.internal.JsonContext.read (JsonContext.java:89)
        at query.App.main (App.java:23)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke0 (Native Method)
        at jdk.internal.reflect.NativeMethodAccessorImpl.invoke (NativeMethodAccessorImpl.java:62)
        at jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke (DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke (Method.java:566)
        at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:282)
        at java.lang.Thread.run (Thread.java:834)
    [ERROR] 
    [ERROR] Re-run Maven using the -X switch to enable full debug logging.
    [ERROR] 
    [ERROR] For more information about the errors and possible solutions, please read the following articles:
    [ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException

<h3 id="Python_jsonpath-ng___array_index_dot_notation">
Python (jsonpath-ng), Array index dot notation
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 8, in main
        query = parse(selector)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 14, in parse
        return JsonPathParser().parse(string)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 32, in parse
        return self.parse_token_stream(lexer.tokenize(string))
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 55, in parse_token_stream
        return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
        return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
        tok = call_errorfunc(self.errorfunc, errtoken, self)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
        r = errorfunc(token)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 69, in p_error
        raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type))
    Exception: Parse error at 1:2 near token 2 (NUMBER)
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="Python_jsonpath-ng___array_index_out_of_bounds">
Python (jsonpath-ng), Array index out of bounds
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Python_jsonpath-ng___array_index_slice_start_end_step">
Python (jsonpath-ng), Array index slice start end step
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 8, in main
        query = parse(selector)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 14, in parse
        return JsonPathParser().parse(string)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 32, in parse
        return self.parse_token_stream(lexer.tokenize(string))
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 55, in parse_token_stream
        return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
        return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
        tok = call_errorfunc(self.errorfunc, errtoken, self)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
        r = errorfunc(token)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 69, in p_error
        raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type))
    Exception: Parse error at 1:5 near token : (:)

<h3 id="Python_jsonpath-ng___array_index_union">
Python (jsonpath-ng), Array index union
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 8, in main
        query = parse(selector)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 14, in parse
        return JsonPathParser().parse(string)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 32, in parse
        return self.parse_token_stream(lexer.tokenize(string))
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 55, in parse_token_stream
        return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
        return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
        tok = call_errorfunc(self.errorfunc, errtoken, self)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
        r = errorfunc(token)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 69, in p_error
        raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type))
    Exception: Parse error at 1:3 near token , (,)

<h3 id="Python_jsonpath-ng___key_bracket_notation_with_number_without_quotes">
Python (jsonpath-ng), Key bracket notation with number without quotes
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 11, in main
        results = [match.value for match in query.find(j)]
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 257, in find
        for submatch in self.right.find(subdata)]
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 565, in find
        return [DatumInContext(datum.value[self.index], path=self, context=datum)]
    KeyError: 0
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="Python_jsonpath-ng___key_bracket_notation_with_single_quote">
Python (jsonpath-ng), Key bracket notation with single quote
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 8, in main
        query = parse(selector)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 14, in parse
        return JsonPathParser().parse(string)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 32, in parse
        return self.parse_token_stream(lexer.tokenize(string))
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 55, in parse_token_stream
        return new_parser.parse(lexer = IteratorToTokenStream(token_iterator))
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 333, in parse
        return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 1201, in parseopt_notrack
        tok = call_errorfunc(self.errorfunc, errtoken, self)
      File "/usr/local/lib/python2.7/site-packages/ply/yacc.py", line 192, in call_errorfunc
        r = errorfunc(token)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/parser.py", line 69, in p_error
        raise Exception('Parse error at %s:%s near token %s (%s)' % (t.lineno, t.col, t.value, t.type))
    Exception: Parse error at 1:10 near token quote (ID)
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="Python_jsonpath-ng___key_on_array">
Python (jsonpath-ng), Key on array
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Python_jsonpath-ng___recursive_array_index">
Python (jsonpath-ng), Recursive array index
</h3>

    Traceback (most recent call last):
      File "main.py", line 16, in <module>
        sys.exit(main())
      File "main.py", line 11, in main
        results = [match.value for match in query.find(j)]
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 377, in find
        for submatch in match_recursively(left_match)]
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 362, in match_recursively
        for submatch in match_recursively(DatumInContext(datum.value[i], context=datum, path=Index(i)))]
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 356, in match_recursively
        right_matches = self.right.find(datum)
      File "/usr/local/lib/python2.7/site-packages/jsonpath_ng/jsonpath.py", line 565, in find
        return [DatumInContext(datum.value[self.index], path=self, context=datum)]
    KeyError: 0

<h3 id="Ruby_jsonpath___array_index_dot_notation">
Ruby (jsonpath), Array index dot notation
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Ruby_jsonpath___array_index_out_of_bounds">
Ruby (jsonpath), Array index out of bounds
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Ruby_jsonpath___key_bracket_notation_with_single_quote_escaped">
Ruby (jsonpath), Key bracket notation with single quote escaped
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Ruby_jsonpath___key_bracket_notation_with_special_characters">
Ruby (jsonpath), Key bracket notation with special characters
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Ruby_jsonpath___key_bracket_notation_without_quotes">
Ruby (jsonpath), Key bracket notation without quotes
</h3>

    /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:156:in `Integer': invalid value for Integer(): "key" (ArgumentError)
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:156:in `process_function_or_literal'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:80:in `block in handle_wildecard'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:60:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:60:in `handle_wildecard'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:30:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:28:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath.rb:73:in `to_a'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath.rb:73:in `on'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/bin/jsonpath:20:in `<top (required)>'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/bin/jsonpath:23:in `load'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/bin/jsonpath:23:in `<main>'
    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 6, in main
        j = json.loads(sys.stdin.read())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/__init__.py", line 339, in loads
        return _default_decoder.decode(s)
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 364, in decode
        obj, end = self.raw_decode(s, idx=_w(s, 0).end())
      File "/usr/local/Cellar/python@2/2.7.16/Frameworks/Python.framework/Versions/2.7/lib/python2.7/json/decoder.py", line 382, in raw_decode
        raise ValueError("No JSON object could be decoded")
    ValueError: No JSON object could be decoded

<h3 id="Ruby_jsonpath___key_on_array">
Ruby (jsonpath), Key on array
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Ruby_jsonpath___recursive_array_index">
Ruby (jsonpath), Recursive array index
</h3>

    /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:17:in `each': 0 is not a symbol nor a string (TypeError)
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:100:in `block (2 levels) in handle_wildecard'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:100:in `step'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:100:in `block in handle_wildecard'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:60:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:60:in `handle_wildecard'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:30:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:40:in `block in each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:40:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:40:in `each_with_index'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:40:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:26:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath/enumerable.rb:28:in `each'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath.rb:73:in `to_a'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/lib/jsonpath.rb:73:in `on'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/jsonpath-1.0.4/bin/jsonpath:20:in `<top (required)>'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/bin/jsonpath:23:in `load'
    	from /Users/cburgmer/.rbenv/versions/2.3.0/bin/jsonpath:23:in `<main>'

<h3 id="Rust_jsonpath_lib___array_index_slice_no_start_no_end">
Rust (jsonpath_lib), Array index slice no start no end
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[:]\n^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___array_index_slice_start_end_step">
Rust (jsonpath_lib), Array index slice start end step
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[0:3:2]\n^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___key_bracket_notation_union">
Rust (jsonpath_lib), Key bracket notation union
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[\'key\',\'another\']\n^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___key_bracket_notation_with_single_quote">
Rust (jsonpath_lib), Key bracket notation with single quote
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[\'single\'quote\']\n^^^^^^^^^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___key_bracket_notation_with_single_quote_escaped">
Rust (jsonpath_lib), Key bracket notation with single quote escaped
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[\'single\\\'quote\']\n^^^^^^^^^^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___key_bracket_notation_without_quotes">
Rust (jsonpath_lib), Key bracket notation without quotes
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[key]\n^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

