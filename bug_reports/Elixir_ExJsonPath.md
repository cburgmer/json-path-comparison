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
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Invalid object returned
  ```

- [ ] `$[2:-113667776004:-1]`
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
  FunctionClauseError
  ```

- [ ] `$[-113667776004:2]`
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
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[113667776004:2:-1]`
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
  FunctionClauseError
  ```

- [ ] `$[-4:1]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    4,
    5,
    100,
    "nice"
  ]
  ```

- [ ] `$[-4:2]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    4,
    5,
    100,
    "nice"
  ]
  ```

- [ ] `$[-4:3]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  [4]
  ```
  Actual output:
  ```
  [
    4,
    5,
    100,
    "nice"
  ]
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
  FunctionClauseError
  ```

- [ ] `$[0:3:-2]`
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
  FunctionClauseError
  ```

- [ ] `$[7:3:-1]`
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
  FunctionClauseError
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
  FunctionClauseError
  ```

- [ ] `$[3::-1]`
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
  FunctionClauseError
  ```

- [ ] `$[:]`
  Input:
  ```
  {
    ":": 42,
    "more": "string"
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Invalid object returned
  ```

- [ ] `$[:2:-1]`
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
  FunctionClauseError
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: '*'
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  [200, 42, 500]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: '['
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
  ```
  illegal characters "-d"
  ```

- [ ] `$."key"`
  Input:
  ```
  {
    "key": "value",
    "\"key\"": 42
  }
  ```
  Error:
  ```
  FunctionClauseError
  ```

- [ ] `$.."key"`
  Input:
  ```
  {
    "object": {
      "key": "value",
      "\"key\"": 100,
      "array": [
        {
          "key": "something",
          "\"key\"": 0
        },
        {
          "key": {
            "key": "russian dolls"
          },
          "\"key\"": {
            "\"key\"": 99
          }
        }
      ]
    },
    "key": "top",
    "\"key\"": 42
  }
  ```
  Error:
  ```
  FunctionClauseError
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
  Actual output:
  NOT_SUPPORTED
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
    "key": "value",
    "'key'": 42
  }
  ```
  Error:
  ```
  FunctionClauseError
  ```

- [ ] `$..'key'`
  Input:
  ```
  {
    "object": {
      "key": "value",
      "'key'": 100,
      "array": [
        {
          "key": "something",
          "'key'": 0
        },
        {
          "key": {
            "key": "russian dolls"
          },
          "'key'": {
            "'key'": 99
          }
        }
      ]
    },
    "key": "top",
    "'key'": 42
  }
  ```
  Error:
  ```
  FunctionClauseError
  ```

- [ ] `$.'some.key'`
  Input:
  ```
  {
    "some.key": 42,
    "some": {
      "key": "value"
    },
    "'some.key'": 43
  }
  ```
  Error:
  ```
  FunctionClauseError
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: '*'
  ```

- [ ] `$[?(@.key>42 && @.key<44)]`
  Input:
  ```
  [
    {
      "key": 42
    },
    {
      "key": 43
    },
    {
      "key": 44
    }
  ]
  ```
  Expected output:
  ```
  [{"key": 43}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  illegal characters "&"
  ```

- [ ] `$[?(@[0:1]==1)]`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      1
    ],
    [
      2,
      3
    ],
    1,
    2
  ]
  ```
  Error:
  ```
  Protocol.UndefinedError
  ```

- [ ] `$[?(@.*==2)]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      2,
      3
    ],
    [
      1
    ],
    [
      2
    ],
    [
      1,
      2,
      3
    ],
    1,
    2,
    3
  ]
  ```
  Error:
  ```
  WithClauseError
  ```

- [ ] `$.items[?(@.key1==@.key2)]`
  Input:
  ```
  {
    "items": [
      {
        "key1": 10,
        "key2": 10
      },
      {
        "key1": 42,
        "key2": 50
      }
    ]
  }
  ```
  Expected output:
  ```
  [{"key1": 10, "key2": 10}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: '@'
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
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
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: 
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_ExJsonPath.
