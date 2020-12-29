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
  Actual output:
  ```
  [
    "second",
    "third",
    "forth"
  ]
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
  Actual output:
  NOT_FOUND
  ```
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
  NOT_FOUND
  ```
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
  NOT_FOUND
  ```
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
  NOT_FOUND
  ```
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
    5
  ]
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
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
  NOT_FOUND
  ```
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third",
    "forth"
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
  NOT_SUPPORTED
  ```
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
    "third",
    "fifth"
  ]
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
  Actual output:
  NOT_SUPPORTED
  ```
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
  [
    {
      "": 42,
      "\"\"": 222,
      "''": 123
    }
  ]
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
  ```
  [
    1,
    2,
    "a",
    "b",
    0,
    0
  ]
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
  Actual output:
  ```
  [
    "ey",
    "bee",
    "see"
  ]
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
  Actual output:
  ```
  [
    "something",
    "top",
    "value",
    {
      "key": "russian dolls"
    }
  ]
  ```

- [ ] `$.store..price`
  Input:
  ```
  {
    "store": {
      "book": [
        {
          "category": "reference",
          "author": "Nigel Rees",
          "title": "Sayings of the Century",
          "price": 8.95
        },
        {
          "category": "fiction",
          "author": "Evelyn Waugh",
          "title": "Sword of Honour",
          "price": 12.99
        },
        {
          "category": "fiction",
          "author": "Herman Melville",
          "title": "Moby Dick",
          "isbn": "0-553-21311-3",
          "price": 8.99
        },
        {
          "category": "fiction",
          "author": "J. R. R. Tolkien",
          "title": "The Lord of the Rings",
          "isbn": "0-395-19395-8",
          "price": 22.99
        }
      ],
      "bicycle": {
        "color": "red",
        "price": 19.95
      }
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [12.99, 19.95, 22.99, 8.95, 8.99]
  ```
  Actual output:
  ```
  [
    19.95
  ]
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
  unexpected character ']' at 1:40
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
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-ohler55-ojg.
