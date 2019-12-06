Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$.2`
  Input:
  ```
  {"a": "first", "2": "second", "b": "third"}
  ```
  Expected output:
  ```
  ["second"]
  ```
  Error:
  ```
  init terminating in do_boot ({badmatch,{error,{1,ejsonpath_parse,syntax error before: 2}}})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{badmatch,{error,{1,ejsonpath_parse,["syntax error before: ",["2"]]}}}}
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
  init terminating in do_boot ({badmatch,{error,{1,ejsonpath_parse,syntax error before: ':'}}})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{badmatch,{error,{1,ejsonpath_parse,["syntax error before: ","':'"]}}}}
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
  init terminating in do_boot ({badmatch,{error,{1,ejsonpath_parse,syntax error before: ']'}}})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{badmatch,{error,{1,ejsonpath_parse,["syntax error before: ","']'"]}}}}
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
  ["second", "third", "forth", "fifth"]
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
  init terminating in do_boot ({not_implemented,slice})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{not_implemented,slice}}
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
  init terminating in do_boot ({not_implemented,slice})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{not_implemented,slice}}
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
  Error:
  ```
  init terminating in do_boot ({badmatch,{error,{1,ejsonpath_parse,syntax error before: ':'}}})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{badmatch,{error,{1,ejsonpath_parse,["syntax error before: ","':'"]}}}}
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Error:
  ```
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",function_clause}
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95}, {"category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99}, {"category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99}, {"category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [12.99, 19.95, 22.99, 8.95, 8.99]
  ```
  Error:
  ```
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",function_clause}
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
  Error:
  ```
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",function_clause}
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
  Error:
  ```
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",function_clause}
  ```

- [ ] `$`
  Input:
  ```
  {"key": "value", "another key": {"complex": ["a", 1]}}
  ```
  Expected output:
  ```
  [{"another key": {"complex": ["a", 1]}, "key": "value"}]
  ```
  Error:
  ```
  init terminating in do_boot ({badmatch,{error,{1,ejsonpath_parse,syntax error before: }}})
  
  Crash dump is being written to: erl_crash.dump...done
  {"init terminating in do_boot",{badmatch,{error,{1,ejsonpath_parse,["syntax error before: ",[]]}}}}
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Erlang_ejsonpath.
