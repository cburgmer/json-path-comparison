Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:3]`
  Input:
  ```
  {
    ":": 42,
    "more": "string",
    "a": 1,
    "b": 2,
    "c": 3
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Poison.EncodeError) unable to encode value: {"b", 2}
      lib/poison/encoder.ex:383: Poison.Encoder.Any.encode/2
      lib/poison/encoder.ex:259: anonymous fn/3 in Poison.Encoder.List.encode/3
      lib/poison/encoder.ex:260: Poison.Encoder.List."-encode/3-lists^foldr/2-1-"/3
      lib/poison/encoder.ex:260: Poison.Encoder.List.encode/3
      lib/poison.ex:41: Poison.encode!/2
      lib/cli.ex:6: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[0:0]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    "first",
    "second"
  ]
  ```

- [ ] `$[-4:]`
  Input:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$..[0]`
  Input:
  ```
  [
    "first",
    {
      "key": [
        "first nested",
        {
          "more": [
            {
              "nested": [
                "deepest",
                "second"
              ]
            },
            [
              "more",
              "values"
            ]
          ]
        }
      ]
    }
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '['"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[0:2][*]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      "a",
      "b"
    ],
    [
      0,
      0
    ]
  ]
  ```
  Expected output:
  ```
  [1, 2, "a", "b"]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*].bar[*]`
  Input:
  ```
  [
    {
      "bar": [
        42
      ]
    }
  ]
  ```
  Expected output:
  ```
  [42]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$..[*]`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '['"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*]`
  Input:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0,
      1
    ]
  ]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*]`
  Input:
  ```
  {}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*]`
  Input:
  ```
  [
    40,
    null,
    42
  ]
  ```
  Expected output:
  ```
  [40, null, 42]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*]`
  Input:
  ```
  {
    "some": "string",
    "int": 42,
    "object": {
      "key": "value"
    },
    "array": [
      0,
      1
    ]
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*].a`
  Input:
  ```
  [
    {
      "a": 1
    },
    {
      "a": 1
    }
  ]
  ```
  Expected output:
  ```
  [1, 1]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*].a`
  Input:
  ```
  [
    {
      "a": 1
    }
  ]
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[*].a`
  Input:
  ```
  [
    {
      "a": 1
    },
    {
      "b": 1
    }
  ]
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.key-dash`
  Input:
  ```
  {
    "key-dash": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "illegal characters \"-d\""}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.屬性`
  Input:
  ```
  {
    "\u5c6c\u6027": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "illegal characters \"屬\""}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.2`
  Input:
  ```
  {
    "a": "first",
    "2": "second",
    "b": "third"
  }
  ```
  Expected output:
  ```
  ["second"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$..*`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$..*`
  Input:
  ```
  [
    40,
    null,
    42
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [40, 42, null]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$..*`
  Input:
  ```
  42
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  []
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: '*'"}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": [
        "a",
        1
      ]
    }
  }
  ```
  Expected output:
  ```
  [{"another key": {"complex": ["a", 1]}, "key": "value"}]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: "}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  [42]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: "}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$`
  Input:
  ```
  false
  ```
  Expected output:
  ```
  [false]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: "}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$`
  Input:
  ```
  true
  ```
  Expected output:
  ```
  [true]
  ```
  Error:
  ```
  ** (MatchError) no match of right hand side value: {:error, %ExJSONPath.ParsingError{message: "syntax error before: "}}
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:121: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_ExJsonPath.
