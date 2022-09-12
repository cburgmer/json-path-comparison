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
  Actual output:
  ```
  [
    null,
    null
  ]
  ```

- [ ] `$[1:10]`
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
  ["second", "third"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[2:113667776004]`
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
  ["third", "forth", "fifth"]
  ```
  Actual output:
  ```
  [
    "third",
    "forth"
  ]
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
  step can't be negative
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
  [
    "second"
  ]
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
  step can't be negative
  ```

- [ ] `$[-4:-4]`
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
    4
  ]
  ```

- [ ] `$[-4:-3]`
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
    5
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
  step can't be negative
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
  step can't be negative
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
  step can't be negative
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
  step can't be negative
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
  step can't be negative
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
  Actual output:
  ```
  [
    null,
    null
  ]
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
  step can't be negative
  ```

- [ ] `$[3:-3]`
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
    5
  ]
  ```

- [ ] `$[3:-2]`
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
  [5]
  ```
  Actual output:
  ```
  [
    5,
    100
  ]
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
    "first"
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
  [
    "third"
  ]
  ```

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
  step can't be 0
  ```

- [ ] `$[010:024:010]`
  Input:
  ```
  [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ]
  ```
  Expected output:
  ```
  [10, 20]
  ```
  Actual output:
  ```
  [
    8,
    16
  ]
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
  0 is not a symbol nor a string
  ```

- [ ] `$[]`
  Input:
  ```
  {
    "": 42,
    "''": 123,
    "\"\"": 222
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[-2]`
  Input:
  ```
  [
    "one element"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    "one element"
  ]
  ```

- [ ] `$.*[1]`
  Input:
  ```
  [
    [
      1
    ],
    [
      2,
      3
    ]
  ]
  ```
  Expected output:
  ```
  [3]
  ```
  Error:
  ```
  1 is not a symbol nor a string
  ```

- [ ] `$[0]`
  Input:
  ```
  {
    "0": "value"
  }
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    null
  ]
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  unexpected token at 'Hello World'
  ```

- [ ] `$[']']`
  Input:
  ```
  {
    "]": 42
  }
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  unmatched closing bracket
  ```

- [ ] `$[':@."$,*\'\\']`
  Input:
  ```
  {
    ":@.\"$,*'\\": 42
  }
  ```
  Error:
  ```
  invalid value for Integer(): "*\\'\\\\'"
  ```

- [ ] `$['single'quote']`
  Input:
  ```
  {
    "single'quote": "value"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    "value"
  ]
  ```

- [ ] `$[',']`
  Input:
  ```
  {
    ",": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[ 'a' ]`
  Input:
  ```
  {
    " a": 1,
    "a": 2,
    " a ": 3,
    "a ": 4,
    " 'a' ": 5,
    " 'a": 6,
    "a' ": 7,
    " \"a\" ": 8,
    "\"a\"": 9
  }
  ```
  Expected output:
  ```
  [2]
  ```
  Error:
  ```
  invalid value for Integer(): " 'a' "
  ```

- [ ] `$['two'.'some']`
  Input:
  ```
  {
    "one": {
      "key": "value"
    },
    "two": {
      "some": "more",
      "key": "other value"
    },
    "two.some": "42",
    "two'.'some": "43"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    "43"
  ]
  ```

- [ ] `$[two.some]`
  Input:
  ```
  {
    "one": {
      "key": "value"
    },
    "two": {
      "some": "more",
      "key": "other value"
    },
    "two.some": "42"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  invalid value for Integer(): "two.some"
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
  0 is not a symbol nor a string
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
  divided by 0
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
  ```
  [
    null,
    null,
    null,
    null
  ]
  ```

- [ ] `$[key]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  invalid value for Integer(): "key"
  ```

- [ ] `$.[key]`
  Input:
  ```
  {
    "key": "value",
    "other": {
      "key": [
        {
          "key": 42
        }
      ]
    }
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  invalid value for Integer(): "key"
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
  Error:
  ```
  1 is not a symbol nor a string
  ```

- [ ] `$.`
  Input:
  ```
  {
    "key": 42,
    "": 9001,
    "''": "nice"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    {
      "": 9001,
      "''": "nice",
      "key": 42
    }
  ]
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
  ```
  []
  ```

- [ ] `$.*.bar.*`
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
  ```
  [
    [
      42
    ]
  ]
  ```

- [ ] `$.*.*`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      4,
      5,
      6
    ]
  ]
  ```
  Expected output:
  ```
  [1, 2, 3, 4, 5, 6]
  ```
  Actual output:
  ```
  [
    [
      [
        1,
        2,
        3
      ],
      [
        4,
        5,
        6
      ]
    ],
    [
      1,
      2,
      3
    ],
    1,
    2,
    3,
    [
      4,
      5,
      6
    ],
    4,
    5,
    6
  ]
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
  ```
  [
    "string",
    "value",
    0,
    1,
    [
      0,
      1
    ],
    {
      "another key": {
        "complex": "string",
        "primitives": [
          0,
          1
        ]
      },
      "key": "value"
    },
    {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  ]
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
  ```
  [
    40,
    42,
    [
      40,
      null,
      42
    ],
    null
  ]
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
  ```
  [
    42
  ]
  ```

- [ ] `$.*`
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
  ```
  [
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
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    []
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  {}
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    {}
  ]
  ```

- [ ] `$.*`
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
  ```
  [
    {
      "array": [
        0,
        1
      ],
      "int": 42,
      "object": {
        "key": "value"
      },
      "some": "string"
    }
  ]
  ```

- [ ] `$a`
  Input:
  ```
  {
    "a": 1,
    "$a": 2
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    2
  ]
  ```

- [ ] `$[?(@.key+50==100)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key+50": 100
    }
  ]
  ```
  Error:
  ```
  String can't be coerced into Float
  ```

- [ ] `$[?(@.key>0 && false)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  comparison of String with 0.0 failed
  ```

- [ ] `$[?(@.key>0 && true)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  comparison of String with 0.0 failed
  ```

- [ ] `$[?(@.key>0 || false)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  comparison of String with 0.0 failed
  ```

- [ ] `$[?(@.key>0 || true)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  comparison of String with 0.0 failed
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
  Node does not appear to be an array.
  ```

- [ ] `$[?(@.2 == 'third')]`
  Input:
  ```
  [
    [
      "first",
      "second",
      "third",
      "forth",
      "fifth"
    ]
  ]
  ```
  Error:
  ```
  undefined method `2' for ["first", "second", "third", "forth", "fifth"]:Array
  ```

- [ ] `$[?()]`
  Input:
  ```
  [
    1,
    {
      "key": 42
    },
    "value",
    null
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    1,
    {
      "key": 42
    },
    "value"
  ]
  ```

- [ ] `$[?(@.*==[1,2])]`
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
  unmatched parenthesis in expression: (true
  ```

- [ ] `$[?((@.key<44)==false)]`
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
  Error:
  ```
  comparison of Float with String failed
  ```

- [ ] `$[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2
  }
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    {
      "id": 2
    }
  ]
  ```

- [ ] `$[?(@.key>42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  comparison of String with 42.0 failed
  ```

- [ ] `$[?(@.key>=42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  comparison of String with 42.0 failed
  ```

- [ ] `$[?(@.key>"VALUE")]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "alpha"
    },
    {
      "key": "ALPHA"
    },
    {
      "key": "value"
    },
    {
      "key": "VALUE"
    },
    {
      "some": "value"
    },
    {
      "some": "VALUE"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "alpha"}, {"key": "value"}]
  ```
  Error:
  ```
  comparison of Float with String failed
  ```

- [ ] `$[?(@.d in [2, 3])]`
  Input:
  ```
  [
    {
      "d": 1
    },
    {
      "d": 2
    },
    {
      "d": 1
    },
    {
      "d": 3
    },
    {
      "d": 4
    }
  ]
  ```
  Error:
  ```
  invalid value for Integer(): " 3])"
  ```

- [ ] `$[?(length(@) == 4)]`
  Input:
  ```
  [
    [
      1,
      2,
      3,
      4,
      5
    ],
    [
      1,
      2,
      3,
      4
    ],
    [
      1,
      2,
      3
    ]
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    [
      1,
      2,
      3,
      4,
      5
    ],
    [
      1,
      2,
      3,
      4
    ],
    [
      1,
      2,
      3
    ]
  ]
  ```

- [ ] `$[?(@.length == 4)]`
  Input:
  ```
  [
    [
      1,
      2,
      3,
      4,
      5
    ],
    [
      1,
      2,
      3,
      4
    ],
    [
      1,
      2,
      3
    ]
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    [
      1,
      2,
      3,
      4
    ]
  ]
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  comparison of String with 42.0 failed
  ```

- [ ] `$[?(@.key<=42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  comparison of String with 42.0 failed
  ```

- [ ] `$[?(!(@.key==42))]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  wrong number of arguments (given 1, expected 0)
  ```

- [ ] `$[?(!(@.key<42))]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  wrong number of arguments (given 1, expected 0)
  ```

- [ ] `$[?(!@.key)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
    },
    {
      "key": 0
    },
    {
      "key": 1
    },
    {
      "key": -1
    },
    {
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  wrong number of arguments (given 1, expected 0)
  ```

- [ ] `$[*].bookmarks[?(@.page == 45)]^^^`
  Input:
  ```
  [
    {
      "title": "Sayings of the Century",
      "bookmarks": [
        {
          "page": 40
        }
      ]
    },
    {
      "title": "Sword of Honour",
      "bookmarks": [
        {
          "page": 35
        },
        {
          "page": 45
        }
      ]
    },
    {
      "title": "Moby Dick",
      "bookmarks": [
        {
          "page": 3035
        },
        {
          "page": 45
        }
      ]
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    null,
    null,
    null
  ]
  ```

- [ ] `$[?(@.key=42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
    },
    {
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  undefined method `=' for 0.0:Float
  Did you mean?  =~
                 ==
  ```

- [ ] `$[?(@.key-50==-100)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key-50": -100
    }
  ]
  ```
  Error:
  ```
  String can't be coerced into Float
  ```

- [ ] `$[?(@.key===42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
    },
    {
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  undefined method `=' for 0.0:Float
  Did you mean?  =~
                 ==
  ```

- [ ] `$.*[?(@.key)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": "value"
    }
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    {
      "key": "value"
    },
    {
      "key": "value"
    }
  ]
  ```

- [ ] `$[?@.key==42]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
    },
    {
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  invalid value for Integer(): "@.key==42"
  ```

- [ ] `$(key,more)`
  Input:
  ```
  {
    "key": 1,
    "some": 2,
    "more": 3
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    {
      "key": 1,
      "more": 3
    }
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  [
    [
      0
    ],
    [
      1
    ]
  ]
  ```
  Expected output:
  ```
  [[0], [1], 0, 1]
  ```
  Actual output:
  ```
  [
    [
      [
        0
      ],
      [
        1
      ]
    ],
    [
      0
    ],
    0,
    [
      1
    ],
    1
  ]
  ```

- [ ] `$[(@.length-1)]`
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
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    "fifth"
  ]
  ```

- [ ] `$.*[0,:5]`
  Input:
  ```
  {
    "a": [
      "string",
      null,
      true
    ],
    "b": [
      false,
      "string",
      5.4
    ]
  }
  ```
  Error:
  ```
  0 is not a symbol nor a string
  ```

- [ ] `$[*,1]`
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
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third",
    "forth",
    "fifth",
    "second"
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Ruby_jsonpath.
