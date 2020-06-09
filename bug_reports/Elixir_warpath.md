Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[0:3:0]`
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
  ** (ArithmeticError) bad argument in arithmetic expression: rem(0, 0)
      :erlang.rem(0, 0)
      lib/warpath.ex:380: anonymous fn/2 in Warpath.transform/2
      lib/stream.ex:625: anonymous fn/4 in Stream.reject/2
      lib/enum.ex:3686: Enumerable.List.reduce/3
      lib/stream.ex:1609: Enumerable.Stream.do_each/4
      lib/enum.ex:3383: Enum.map/2
      lib/warpath.ex:256: anonymous fn/3 in Warpath.do_query/2
      lib/enum.ex:3383: anonymous fn/3 in Enum.reduce/3
  ```

- [ ] `$[0]`
  Input:
  ```
  {
    "0": "value"
  }
  ```
  Error:
  ```
  ** (Poison.EncodeError) unable to encode value: {"0", "value"}
      lib/poison/encoder.ex:383: Poison.Encoder.Any.encode/2
      lib/poison.ex:41: Poison.encode!/2
      lib/cli.ex:6: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  Error:
  ```
  ** (Enum.OutOfBoundsError) The query should be resolved to scalar value but the index 1 is out of bounds for emum ["one element"].
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
      lib/warpath.ex:209: Warpath.query/3
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$..[1].key`
  Input:
  ```
  {
    "k": [
      {
        "key": "some value"
      },
      {
        "key": 42
      }
    ],
    "kk": [
      [
        {
          "key": 100
        },
        {
          "key": 200
        },
        {
          "key": 300
        }
      ],
      [
        {
          "key": 400
        },
        {
          "key": 500
        },
        {
          "key": 600
        }
      ]
    ],
    "key": [
      0,
      1
    ]
  }
  ```
  Error:
  ```
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.kk[1].key', that it's not allowed for list type. You can use something like '$.kk[1][*].key' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.key', that it's not allowed for list type. You can use something like '$[*].key' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.id', that it's not allowed for list type. You can use something like '$[*].id' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.in`
  Input:
  ```
  {
    "in": "value"
  }
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  Parser error: Invalid token on line 1, syntax error before: in_op
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
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.length', that it's not allowed for list type. You can use something like '$[*].length' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.true`
  Input:
  ```
  {
    "true": "value"
  }
  ```
  Expected output:
  ```
  "value"
  ```
  Error:
  ```
  Parser error: Invalid token on line 1, syntax error before: true
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
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.2', that it's not allowed for list type. You can use something like '$[*].2' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  ** (Warpath.UnsupportedOperationError) You are trying to traverse a list using dot notation '$.-1', that it's not allowed for list type. You can use something like '$[*].-1' instead.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[?(@[1]=='b')]`
  Input:
  ```
  {
    "1": [
      "a",
      "b"
    ],
    "2": [
      "x",
      "y"
    ]
  }
  ```
  Error:
  ```
  ** (Warpath.UnsupportedOperationError) You are try to access index '[1]' on '%{"1" => ["a", "b"], "2" => ["x", "y"]}' that is not support for this data type.
      lib/cli.ex:10: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_warpath.
