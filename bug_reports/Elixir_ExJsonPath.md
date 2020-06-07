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
    "c": 3,
    "1:3": "nice"
  }
  ```
  Error:
  ```
  ** (Poison.EncodeError) unable to encode value: {"a", 1}
      lib/poison/encoder.ex:383: Poison.Encoder.Any.encode/2
      lib/poison/encoder.ex:259: anonymous fn/3 in Poison.Encoder.List.encode/3
      lib/poison/encoder.ex:260: Poison.Encoder.List."-encode/3-lists^foldr/2-1-"/3
      lib/poison/encoder.ex:260: Poison.Encoder.List.encode/3
      lib/poison.ex:41: Poison.encode!/2
      lib/cli.ex:6: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[3:0:-2]`
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
  ** (FunctionClauseError) no function clause matching in Enum.take_every/2    
      
      The following arguments were given to Enum.take_every/2:
      
          # 1
          ["forth", "fifth"]
      
          # 2
          -2
      
      lib/enum.ex:2829: Enum.take_every/2
      lib/ex_json_path.ex:167: ExJSONPath.recurse/2
      lib/ex_json_path.ex:65: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[::-2]`
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
  ** (FunctionClauseError) no function clause matching in Enum.take_every/2    
      
      The following arguments were given to Enum.take_every/2:
      
          # 1
          ["first", "second", "third", "forth", "fifth"]
      
          # 2
          -2
      
      lib/enum.ex:2829: Enum.take_every/2
      lib/ex_json_path.ex:167: ExJSONPath.recurse/2
      lib/ex_json_path.ex:65: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$[:]`
  Input:
  ```
  {
    ":": 42,
    "more": "string"
  }
  ```
  Error:
  ```
  ** (Poison.EncodeError) unable to encode value: {"more", "string"}
      lib/poison/encoder.ex:383: Poison.Encoder.Any.encode/2
      lib/poison/encoder.ex:259: anonymous fn/3 in Poison.Encoder.List.encode/3
      lib/poison/encoder.ex:260: Poison.Encoder.List."-encode/3-lists^foldr/2-1-"/3
      lib/poison/encoder.ex:260: Poison.Encoder.List.encode/3
      lib/poison.ex:41: Poison.encode!/2
      lib/cli.ex:6: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  syntax error before: '['
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '['
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  illegal characters "-d"
  ```

- [ ] `$."key"`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in :io_lib.write_string1/3    
      
      The following arguments were given to :io_lib.write_string1/3:
      
          # 1
          :unicode_as_unicode
      
          # 2
          "key"
      
          # 3
          34
      
      io_lib.erl:581: :io_lib.write_string1/3
      io_lib.erl:553: :io_lib.write_string/2
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:135: :jsonpath_parser.yeccerror/1
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:57: :jsonpath_parser.yeccpars0/5
      lib/ex_json_path.ex:77: ExJSONPath.compile/1
      lib/ex_json_path.ex:59: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.."key"`
  Input:
  ```
  {
    "object": {
      "key": "value",
      "array": [
        {
          "key": "something"
        },
        {
          "key": {
            "key": "russian dolls"
          }
        }
      ]
    },
    "key": "top"
  }
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in :io_lib.write_string1/3    
      
      The following arguments were given to :io_lib.write_string1/3:
      
          # 1
          :unicode_as_unicode
      
          # 2
          "key"
      
          # 3
          34
      
      io_lib.erl:581: :io_lib.write_string1/3
      io_lib.erl:553: :io_lib.write_string/2
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:135: :jsonpath_parser.yeccerror/1
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:57: :jsonpath_parser.yeccpars0/5
      lib/ex_json_path.ex:77: ExJSONPath.compile/1
      lib/ex_json_path.ex:59: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  illegal characters "屬"
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

- [ ] `$.'key'`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in :io_lib.write_string1/3    
      
      The following arguments were given to :io_lib.write_string1/3:
      
          # 1
          :unicode_as_unicode
      
          # 2
          "key"
      
          # 3
          34
      
      io_lib.erl:581: :io_lib.write_string1/3
      io_lib.erl:553: :io_lib.write_string/2
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:135: :jsonpath_parser.yeccerror/1
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:57: :jsonpath_parser.yeccpars0/5
      lib/ex_json_path.ex:77: ExJSONPath.compile/1
      lib/ex_json_path.ex:59: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$..'key'`
  Input:
  ```
  {
    "object": {
      "key": "value",
      "array": [
        {
          "key": "something"
        },
        {
          "key": {
            "key": "russian dolls"
          }
        }
      ]
    },
    "key": "top"
  }
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in :io_lib.write_string1/3    
      
      The following arguments were given to :io_lib.write_string1/3:
      
          # 1
          :unicode_as_unicode
      
          # 2
          "key"
      
          # 3
          34
      
      io_lib.erl:581: :io_lib.write_string1/3
      io_lib.erl:553: :io_lib.write_string/2
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:135: :jsonpath_parser.yeccerror/1
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:57: :jsonpath_parser.yeccpars0/5
      lib/ex_json_path.ex:77: ExJSONPath.compile/1
      lib/ex_json_path.ex:59: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
  ```

- [ ] `$.'some.key'`
  Input:
  ```
  {
    "some.key": 42,
    "some": {
      "key": "value"
    }
  }
  ```
  Error:
  ```
  ** (FunctionClauseError) no function clause matching in :io_lib.write_string1/3    
      
      The following arguments were given to :io_lib.write_string1/3:
      
          # 1
          :unicode_as_unicode
      
          # 2
          "some.key"
      
          # 3
          34
      
      io_lib.erl:581: :io_lib.write_string1/3
      io_lib.erl:553: :io_lib.write_string/2
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:135: :jsonpath_parser.yeccerror/1
      /usr/local/Cellar/erlang/22.3.4/lib/erlang/lib/parsetools-2.1.8/include/yeccpre.hrl:57: :jsonpath_parser.yeccpars0/5
      lib/ex_json_path.ex:77: ExJSONPath.compile/1
      lib/ex_json_path.ex:59: ExJSONPath.eval/2
      lib/cli.ex:5: Jsonpath.CLI.main/1
      lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: '*'
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
  syntax error before: 
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
  syntax error before: 
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
  syntax error before: 
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
  syntax error before: 
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_ExJsonPath.
