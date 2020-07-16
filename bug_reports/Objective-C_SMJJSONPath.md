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
  NOT_FOUND
  ```
  Filter: [1:3] can only be applied to arrays. Current context is: {"1:3" = nice; ":" = 42; a = 1; b = 2; c = 3; more = string; }
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
  Error:
  ```
  timeout: sending signal TERM to command ‘build/main’
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
    "nice",
    2
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
    "nice",
    2,
    "a"
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
    "nice",
    2,
    "a",
    4
  ]
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
  Actual output:
  NOT_SUPPORTED
  ```
  Failed to parse SliceOperation: :
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
  Actual output:
  NOT_SUPPORTED
  ```
  Failed to parse SliceOperation: ::
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
  []
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
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
    23
  ]
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third",
    "forth"
  ]
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
  Actual output:
  NOT_SUPPORTED
  ```
  Failed to parse SliceOperation: ::2
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Found empty property at index 5
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
    "some value",
    100,
    200,
    300,
    400,
    42,
    500,
    600
  ]
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
  Actual output:
  ```
  {
    "another": "entry",
    "key": "value"
  }
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
  Actual output:
  NOT_SUPPORTED
  ```
  Failed to parse SliceOperation: :
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
  Actual output:
  ```
  {
    "c": "cc1",
    "d": "dd1"
  }
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
  Actual output:
  ```
  {
    "key": "value"
  }
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Objective-C_SMJJSONPath.
