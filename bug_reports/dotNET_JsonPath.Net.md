Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:3]`
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
  ["second", "third"]
  ```
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[0:5]`
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
  ["first", "second", "third", "forth", "fifth"]
  ```
  Error:
  ```
  'first,second,third,forth,fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'third,forth,fifth]' is an invalid JSON literal. Expected the literal 'true'. LineNumber: 0 | BytePositionInLine: 2.
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
  timeout: sending signal TERM to command ‘build/Dotnet_JsonPath.Net’
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
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  timeout: sending signal TERM to command ‘build/Dotnet_JsonPath.Net’
  ```

- [ ] `$[-4:-5]`
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
  Error:
  ```
  'a' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'a' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
    4
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
  'first,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  'first,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  'forth,fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  'first,third,fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[1:]`
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
  ["second", "third", "forth", "fifth"]
  ```
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'forth,fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[:2]`
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
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[:]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[::]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
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
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[3:-4]`
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

- [ ] `$[2:1]`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'first]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0:1]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Error:
  ```
  'first]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[-1:]`
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
  ["third"]
  ```
  Error:
  ```
  'third]' is an invalid JSON literal. Expected the literal 'true'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[-2:]`
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
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'first,second,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0:3:2]`
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
  ["first", "third"]
  ```
  Error:
  ```
  'first,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0:3:1]`
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
  ["first", "second", "third"]
  ```
  Error:
  ```
  'first,second,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0:4:2]`
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
  ["first", "third"]
  ```
  Error:
  ```
  'first,third]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[1:3:]`
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
  ["second", "third"]
  ```
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[::2]`
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
  ["first", "third", "fifth"]
  ```
  Error:
  ```
  'first,third,fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$['key']`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'first,first nested,{                        "nested": ["deepest", "second"]                    },deepest,more,first nested,{                        "nested": ["deepest", "second"]                    },deepest,more,first nested,{                        "nested": ["deepest", "second"]                    },deepest,more,{                        "nested": ["deepest", "second"]                    },deepest,more,{                        "nested": ["deepest", "second"]                    },deepest,more,deepest,deepest,more]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$['two.some']`
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
  ["42"]
  ```
  Actual output:
  ```
  [
    42
  ]
  ```

- [ ] `$["key"]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[2]`
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
  ["third"]
  ```
  Error:
  ```
  'third]' is an invalid JSON literal. Expected the literal 'true'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[-1]`
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
  ["third"]
  ```
  Error:
  ```
  'third]' is an invalid JSON literal. Expected the literal 'true'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0]`
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
  ["first"]
  ```
  Error:
  ```
  'first]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[':']`
  Input:
  ```
  {
    ":": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['@']`
  Input:
  ```
  {
    "@": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['.']`
  Input:
  ```
  {
    ".": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['"']`
  Input:
  ```
  {
    "\"": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['\\']`
  Input:
  ```
  {
    "\\": "value"
  }
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['\'']`
  Input:
  ```
  {
    "'": "value"
  }
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['0']`
  Input:
  ```
  {
    "0": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['$']`
  Input:
  ```
  {
    "$": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "*": "value",
    "another": "entry"
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'a' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 5.
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
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  ',' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 4.
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
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.['key']`
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
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.["key"]`
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
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.key`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[0:2].key`
  Input:
  ```
  [
    {
      "key": "ey"
    },
    {
      "key": "bee"
    },
    {
      "key": "see"
    }
  ]
  ```
  Expected output:
  ```
  ["ey", "bee"]
  ```
  Error:
  ```
  'e' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  ```
  [
    200,
    200,
    200,
    42,
    42,
    500,
    500,
    500
  ]
  ```

- [ ] `$[?(@.id==42)].name`
  Input:
  ```
  [
    {
      "id": 42,
      "name": "forty-two"
    },
    {
      "id": 1,
      "name": "one"
    }
  ]
  ```
  Expected output:
  ```
  ["forty-two"]
  ```
  Error:
  ```
  'forty-two]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$..key`
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Error:
  ```
  'top,value,something,{"key": "russian dolls"},russian dolls]' is an invalid JSON literal. Expected the literal 'true'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0,2].key`
  Input:
  ```
  [
    {
      "key": "ey"
    },
    {
      "key": "bee"
    },
    {
      "key": "see"
    }
  ]
  ```
  Expected output:
  ```
  ["ey", "see"]
  ```
  Error:
  ```
  'e' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['one','three'].key`
  Input:
  ```
  {
    "one": {
      "key": "value"
    },
    "two": {
      "k": "v"
    },
    "three": {
      "some": "more",
      "key": "other value"
    }
  }
  ```
  Expected output:
  ```
  ["value", "other value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.key`
  Input:
  ```
  {
    "key": null
  }
  ```
  Expected output:
  ```
  [null]
  ```
  Actual output:
  ```
  []
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
  Could not identify selector
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
    9001
  ]
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
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.length`
  Input:
  ```
  {
    "length": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  [
    1
  ]
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
  []
  ```
  Actual output:
  ```
  [
    3
  ]
  ```

- [ ] `$.null`
  Input:
  ```
  {
    "null": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  ',' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 4.
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
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[?(@)]`
  Input:
  ```
  [
    "some value",
    null,
    "value",
    0,
    1,
    -1,
    "",
    [],
    {},
    false,
    true
  ]
  ```
  Error:
  ```
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[?(1==1)]`
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
  'nice,True,,False,{},[],-1,0,]' is an invalid JSON literal. Expected the literal 'null'. LineNumber: 0 | BytePositionInLine: 6.
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
  'nice,True,,False,{},[],-1,0,]' is an invalid JSON literal. Expected the literal 'null'. LineNumber: 0 | BytePositionInLine: 6.
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
  'nice,True,,False,{},[],-1,0,]' is an invalid JSON literal. Expected the literal 'null'. LineNumber: 0 | BytePositionInLine: 6.
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
  'F' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  'T' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
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
  Error:
  ```
  'fifth]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$[0,1]`
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
  ["first", "second"]
  ```
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```

- [ ] `$['key','another']`
  Input:
  ```
  {
    "key": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value", "entry"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[:]['c','d']`
  Input:
  ```
  [
    {
      "c": "cc1",
      "d": "dd1",
      "e": "ee1"
    },
    {
      "c": "cc2",
      "d": "dd2",
      "e": "ee2"
    }
  ]
  ```
  Expected output:
  ```
  ["cc1", "dd1", "cc2", "dd2"]
  ```
  Error:
  ```
  'c' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[0]['c','d']`
  Input:
  ```
  [
    {
      "c": "cc1",
      "d": "dd1",
      "e": "ee1"
    },
    {
      "c": "cc2",
      "d": "dd2",
      "e": "ee2"
    }
  ]
  ```
  Expected output:
  ```
  ["cc1", "dd1"]
  ```
  Error:
  ```
  'c' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$.*['c','d']`
  Input:
  ```
  [
    {
      "c": "cc1",
      "d": "dd1",
      "e": "ee1"
    },
    {
      "c": "cc2",
      "d": "dd2",
      "e": "ee2"
    }
  ]
  ```
  Error:
  ```
  'c' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$..['c','d']`
  Input:
  ```
  [
    {
      "c": "cc1",
      "d": "dd1",
      "e": "ee1"
    },
    {
      "c": "cc2",
      "child": {
        "d": "dd2"
      }
    },
    {
      "c": "cc3"
    },
    {
      "d": "dd4"
    },
    {
      "child": {
        "c": "cc5"
      }
    }
  ]
  ```
  Error:
  ```
  'c' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$['missing','key']`
  Input:
  ```
  {
    "key": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  'v' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[4,1]`
  Input:
  ```
  [
    1,
    2,
    3,
    4,
    5
  ]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Actual output:
  ```
  [
    2,
    5
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
  's' is an invalid start of a value. LineNumber: 0 | BytePositionInLine: 1.
  ```

- [ ] `$[ 0 , 1 ]`
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
  ["first", "second"]
  ```
  Error:
  ```
  'first,second]' is an invalid JSON literal. Expected the literal 'false'. LineNumber: 0 | BytePositionInLine: 2.
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/dotNET_JsonPath.Net.
