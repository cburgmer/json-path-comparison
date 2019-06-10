## Errors

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

<h3 id="Clojure_json-path___bracket_for_object_multiple_keys">
Clojure (json-path), Bracket for object multiple keys
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

<h3 id="Clojure_json-path___last_array_index_open_end">
Clojure (json-path), Last array index open end
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

<h3 id="JavaScript_Goessner___bracket_for_object_with_double_quotes">
JavaScript (Goessner), Bracket for object with double quotes
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

<h3 id="JavaScript_Goessner___last_array_index">
JavaScript (Goessner), Last array index
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

<h3 id="JavaScript_jsonpath-plus___bracket_for_object_multiple_keys">
JavaScript (jsonpath-plus), Bracket for object multiple keys
</h3>

    events.js:177
          throw er; // Unhandled 'error' event
          ^
    
    TypeError [ERR_INVALID_ARG_TYPE]: The "chunk" argument must be one of type string or Buffer. Received type undefined
        at validChunk (_stream_writable.js:265:10)
        at Socket.Writable.write (_stream_writable.js:299:21)
        at ReadStream.<anonymous> (/Users/cburgmer/projekte/json-path-comparison/tools/JavaScript_jsonpath-plus/index.js:24:12)
        at ReadStream.emit (events.js:205:15)
        at endReadableNT (_stream_readable.js:1137:12)
        at processTicksAndRejections (internal/process/task_queues.js:84:9)
    Emitted 'error' event at:
        at errorOrDestroy (internal/streams/destroy.js:107:12)
        at validChunk (_stream_writable.js:268:5)
        at Socket.Writable.write (_stream_writable.js:299:21)
        [... lines matching original stack trace ...]
        at processTicksAndRejections (internal/process/task_queues.js:84:9)

<h3 id="JavaScript_jsonpath-plus___bracket_for_object_with_double_quotes">
JavaScript (jsonpath-plus), Bracket for object with double quotes
</h3>

    events.js:177
          throw er; // Unhandled 'error' event
          ^
    
    TypeError [ERR_INVALID_ARG_TYPE]: The "chunk" argument must be one of type string or Buffer. Received type undefined
        at validChunk (_stream_writable.js:265:10)
        at Socket.Writable.write (_stream_writable.js:299:21)
        at ReadStream.<anonymous> (/Users/cburgmer/projekte/json-path-comparison/tools/JavaScript_jsonpath-plus/index.js:24:12)
        at ReadStream.emit (events.js:205:15)
        at endReadableNT (_stream_readable.js:1137:12)
        at processTicksAndRejections (internal/process/task_queues.js:84:9)
    Emitted 'error' event at:
        at errorOrDestroy (internal/streams/destroy.js:107:12)
        at validChunk (_stream_writable.js:268:5)
        at Socket.Writable.write (_stream_writable.js:299:21)
        [... lines matching original stack trace ...]
        at processTicksAndRejections (internal/process/task_queues.js:84:9)

<h3 id="JavaScript_jsonpath-plus___last_array_index">
JavaScript (jsonpath-plus), Last array index
</h3>

    events.js:177
          throw er; // Unhandled 'error' event
          ^
    
    TypeError [ERR_INVALID_ARG_TYPE]: The "chunk" argument must be one of type string or Buffer. Received type undefined
        at validChunk (_stream_writable.js:265:10)
        at Socket.Writable.write (_stream_writable.js:299:21)
        at ReadStream.<anonymous> (/Users/cburgmer/projekte/json-path-comparison/tools/JavaScript_jsonpath-plus/index.js:24:12)
        at ReadStream.emit (events.js:205:15)
        at endReadableNT (_stream_readable.js:1137:12)
        at processTicksAndRejections (internal/process/task_queues.js:84:9)
    Emitted 'error' event at:
        at errorOrDestroy (internal/streams/destroy.js:107:12)
        at validChunk (_stream_writable.js:268:5)
        at Socket.Writable.write (_stream_writable.js:299:21)
        [... lines matching original stack trace ...]
        at processTicksAndRejections (internal/process/task_queues.js:84:9)

<h3 id="JavaScript_jsonpath___last_array_index">
JavaScript (jsonpath), Last array index
</h3>

    Traceback (most recent call last):
      File "./src/unwrap_scalar.py", line 15, in <module>
        sys.exit(main())
      File "./src/unwrap_scalar.py", line 9, in main
        assert len(j) == 1
    AssertionError

<h3 id="Python_jsonpath___array_index_step_start_end_step">
Python (jsonpath), Array index step start end step
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
    Exception: Parse error at 1:10 near token : (:)

<h3 id="Python_jsonpath___array_index_union">
Python (jsonpath), Array index union
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
    Exception: Parse error at 1:8 near token , (,)

<h3 id="Rust_jsonpath_lib___array_index_step_start_end_step">
Rust (jsonpath_lib), Array index step start end step
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$.book[0:3:2]\n^^^^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

<h3 id="Rust_jsonpath_lib___bracket_for_object_multiple_keys">
Rust (jsonpath_lib), Bracket for object multiple keys
</h3>

    thread 'main' panicked at 'called `Result::unwrap()` on an `Err` value: "$[\'key\',\'another\']\n^^^^^^^^\n"', src/libcore/result.rs:997:5
    note: Run with `RUST_BACKTRACE=1` environment variable to display a backtrace.

