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
  Error: 'Step cannot be 0'
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
  Invalid JSONPath error: 'Error in JSONPath near '..[0]''
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

- [ ] `$[-1]`
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
  Error: 'Modulo by zero'
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
    "value"
  ]
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
  Invalid JSONPath error: 'Error in JSONPath near ''''
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
  Actual output:
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath error: 'Error in JSONPath near ' 'a' ''
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
  Invalid JSONPath error: 'Error in JSONPath near '..[*]''
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
  Actual output:
  ```
  [
    "value"
  ]
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
  Invalid JSONPath error: 'Error in JSONPath near '..[1].key''
  ```

- [ ] `$.key`
  Input:
  ```
  {
    "key": {}
  }
  ```
  Expected output:
  ```
  [{}]
  ```
  Actual output:
  ```
  [
    []
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
  Expected output:
  ```
  []
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath error: 'Error in JSONPath near '.-1''
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["cc1", "cc2", "cc3", "cc5", "dd1", "dd2", "dd4"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath error: 'Error in JSONPath near '..['c','d']''
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath error: 'Error in JSONPath near ' 0 , 1 ''
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/PHP_galbar-jsonpath.
