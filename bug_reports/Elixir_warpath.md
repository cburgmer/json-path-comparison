Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[-1]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  null
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[1]`
  Input:
  ```
  [
    "one element"
  ]
  ```
  Expected output:
  ```
  null
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Error:
  ```
  ** (Jason.DecodeError) unexpected byte at position 0: 0x48 ('H')
      lib/jason.ex:78: Jason.decode!/2
      lib/warpath.ex:215: Warpath.query/3
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.key`
  Input:
  ```
  [
    0,
    1
  ]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  ** (ArgumentError) raise/1 and reraise/2 expect a module name, string or exception as the first argument, got: {:unsupported_operation, "You are trying to traverse a list using dot notation '$.key', that it's not allowed for list type. You can use something like '$[*].key' instead."}
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.id`
  Input:
  ```
  [
    {
      "id": 2
    }
  ]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  ** (ArgumentError) raise/1 and reraise/2 expect a module name, string or exception as the first argument, got: {:unsupported_operation, "You are trying to traverse a list using dot notation '$.id', that it's not allowed for list type. You can use something like '$[*].id' instead."}
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.length`
  Input:
  ```
  [
    4,
    5,
    6
  ]
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  ** (ArgumentError) raise/1 and reraise/2 expect a module name, string or exception as the first argument, got: {:unsupported_operation, "You are trying to traverse a list using dot notation '$.length', that it's not allowed for list type. You can use something like '$[*].length' instead."}
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.2`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth",
    "fifth"
  ]
  ```
  Error:
  ```
  ** (ArgumentError) raise/1 and reraise/2 expect a module name, string or exception as the first argument, got: {:unsupported_operation, "You are trying to traverse a list using dot notation '$.2', that it's not allowed for list type. You can use something like '$[*].2' instead."}
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.-1`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth",
    "fifth"
  ]
  ```
  Error:
  ```
  ** (ArgumentError) raise/1 and reraise/2 expect a module name, string or exception as the first argument, got: {:unsupported_operation, "You are trying to traverse a list using dot notation '$.-1', that it's not allowed for list type. You can use something like '$[*].-1' instead."}
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[?(false)]`
  Input:
  ```
  [
    1,
    3,
    "nice",
    true,
    null,
    false,
    {},
    [],
    -1,
    0,
    ""
  ]
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in Warpath.Filter.Predicate.eval/2    
      
      The following arguments were given to Warpath.Filter.Predicate.eval/2:
      
          # 1
          false
      
          # 2
          1
      
      lib/warpath/filter/predicate.ex:32: Warpath.Filter.Predicate.eval/2
      lib/enum.ex:2942: Enum.filter_list/2
      lib/warpath.ex:264: Warpath.dispatch/2
      lib/enum.ex:3325: Enumerable.List.reduce/3
      lib/enum.ex:1998: Enum.reduce_while/3
      lib/warpath.ex:232: Warpath.query/3
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[?(true)]`
  Input:
  ```
  [
    1,
    3,
    "nice",
    true,
    null,
    false,
    {},
    [],
    -1,
    0,
    ""
  ]
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in Warpath.Filter.Predicate.eval/2    
      
      The following arguments were given to Warpath.Filter.Predicate.eval/2:
      
          # 1
          true
      
          # 2
          1
      
      lib/warpath/filter/predicate.ex:32: Warpath.Filter.Predicate.eval/2
      lib/enum.ex:2942: Enum.filter_list/2
      lib/warpath.ex:264: Warpath.dispatch/2
      lib/enum.ex:3325: Enumerable.List.reduce/3
      lib/enum.ex:1998: Enum.reduce_while/3
      lib/warpath.ex:232: Warpath.query/3
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_warpath.
