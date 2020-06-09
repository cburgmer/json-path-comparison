Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[7:10]`
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
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  [
    100,
    "nice"
  ]
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
    100,
    "nice"
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
    100,
    "nice"
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
  ggrep: Invalid range end
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  ggrep: Invalid range end
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  ggrep: Invalid range end
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
    5,
    100,
    "nice"
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
    5,
    100,
    "nice"
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
    100,
    "nice"
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
  ggrep: Invalid range end
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
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
    8,
    16
  ]
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
  Actual output:
  ```
  {
    "key": "value"
  }
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
  Extra data: line 3 column 6 (char 26)
  [
      "first nested"
      ],
      {
          "more":
          [
              {
                  "nested":
                  [
                      "deepest",
                      "second"
                  ]
              },
                  "more"
              }
          ]
      }
  ]
  ```

- [ ] `$['missing']`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['ü']`
  Input:
  ```
  {
    "u\u0308": 42
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  {
    "two.some": "42"
  }
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
  Actual output:
  ```
  {
    "key": "value"
  }
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['']`
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
  [42]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['.*']`
  Input:
  ```
  {
    "key": 42,
    ".*": 1,
    "": 10
  }
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "*": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "another": "entry"
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['ni.*']`
  Input:
  ```
  {
    "nice": 42,
    "ni.*": 1,
    "mice": 100
  }
  ```
  Expected output:
  ```
  [1]
  ```
  Actual output:
  ```
  {
    "ni.*": 1,
    "nice": 42
  }
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
  Actual output:
  ```
  {
    "some": "more"
  }
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
  Extra data: line 4 column 6 (char 28)
  [
          1,
          2
      ],
          "a",
          "b"
      
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
  ```
  {
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    },
    "key": "value"
  }
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
  Extra data: line 4 column 6 (char 28)
  [
      "string",
      42
      ],
      {
          "key":"value"
      },
          0,
          1
      }
  ]
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  {
    "key": "value"
  }
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
  Actual output:
  ```
  {
    "key": "value"
  }
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
  Expecting ',' delimiter: line 14 column 9 (char 153)
  {
      "k":
      [
          {
              "key":42
          }
      ],
      "kk":
      [
          [
              {
                  "key":200
              }
          }        [
              {
                  "key":500
              }
          ]
      ]
  }
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
  ```
  {
    "a": 1
  }
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
  ```
  {
    "a": 1
  }
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
  Actual output:
  ```
  {
    "name": "forty-two"
  }
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
  {
    "key": "top",
    "object": {
      "array": [
        {
          "key": "something"
        },
        {
          "key": {
            "key": "russian dolls"
          }
        }
      ],
      "key": "value"
    }
  }
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
  {
    "bicycle": {
      "price": 19.95
    },
    "book": [
      {
        "price": 8.95
      },
      {
        "price": 12.99
      },
      {
        "price": 8.99
      },
      {
        "price": 22.99
      }
    ]
  }
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
  Actual output:
  ```
  [
    {
      "key": "ey"
    },
    {
      "key": "see"
    }
  ]
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
  Actual output:
  ```
  {
    "one": {
      "key": "value"
    },
    "three": {
      "key": "other value"
    }
  }
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
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$.key`
  Input:
  ```
  {
    "key": [
      "first",
      "second"
    ]
  }
  ```
  Expected output:
  ```
  [["first", "second"]]
  ```
  Actual output:
  ```
  [
    "first",
    "second"
  ]
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
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  {
    "key": null
  }
  ```

- [ ] `$.missing`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ```
  {
    "key-dash": "value"
  }
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  {
    "in": "value"
  }
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
  {
    "length": "value"
  }
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  {
    "null": "value"
  }
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
  Actual output:
  ```
  {
    "true": "value"
  }
  ```

- [ ] `$.$`
  Input:
  ```
  {
    "$": "value"
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  {
    "2": "second"
  }
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
  Error:
  ```
  Extra data: line 5 column 6 (char 39)
  [
          1,
          2,
          3
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
  {
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    },
    "key": "value"
  }
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Extra data: line 4 column 6 (char 28)
  [
      "string",
      42
      ],
      {
          "key":"value"
      },
          0,
          1
      }
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ```

- [ ] `$..[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2,
    "more": [
      {
        "id": 2
      },
      {
        "more": {
          "id": 2
        }
      },
      {
        "id": {
          "id": 2
        }
      },
      [
        {
          "id": 2
        }
      ]
    ]
  }
  ```
  Error:
  ```
  Expecting ',' delimiter: line 4 column 10 (char 32)
  [
      {
          "id":2
      }    [
          {
              "id":2
          }
      ]
  ]
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  {
    "key": 42,
    "another": {
      "key": 1
    }
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@['key']==42)]`
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
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": 42}]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@['@key']==42)]`
  Input:
  ```
  [
    {
      "@key": 0
    },
    {
      "@key": 42
    },
    {
      "key": 42
    },
    {
      "@key": 43
    },
    {
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  [{"@key": 42}]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@[-1]==2)]`
  Input:
  ```
  [
    [
      2,
      3
    ],
    [
      "a"
    ],
    [
      0,
      2
    ],
    [
      2
    ]
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@[1]=='b')]`
  Input:
  ```
  [
    [
      "a",
      "b"
    ],
    [
      "x",
      "y"
    ]
  ]
  ```
  Expected output:
  ```
  [["a", "b"]]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
    {}
  ]
  ```
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.a && (@.b || @.c))]`
  Input:
  ```
  [
    {
      "a": true
    },
    {
      "a": true,
      "b": true
    },
    {
      "a": true,
      "b": true,
      "c": true
    },
    {
      "b": true,
      "c": true
    },
    {
      "a": true,
      "c": true
    },
    {
      "c": true
    },
    {
      "b": true
    }
  ]
  ```
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.d==["v1","v2"])]`
  Input:
  ```
  [
    {
      "d": [
        "v1",
        "v2"
      ]
    },
    {
      "d": [
        "a",
        "b"
      ]
    },
    {
      "d": "v1"
    },
    {
      "d": "v2"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "['v1','v2']"
    },
    {
      "d": "['v1', 'v2']"
    },
    {
      "d": "v1,v2"
    },
    {
      "d": "[\"v1\", \"v2\"]"
    },
    {
      "d": "[\"v1\",\"v2\"]"
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.d==['v1','v2'])]`
  Input:
  ```
  [
    {
      "d": [
        "v1",
        "v2"
      ]
    },
    {
      "d": [
        "a",
        "b"
      ]
    },
    {
      "d": "v1"
    },
    {
      "d": "v2"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "['v1','v2']"
    },
    {
      "d": "['v1', 'v2']"
    },
    {
      "d": "v1,v2"
    },
    {
      "d": "[\"v1\", \"v2\"]"
    },
    {
      "d": "[\"v1\",\"v2\"]"
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.d=={"k":"v"})]`
  Input:
  ```
  [
    {
      "d": {
        "k": "v"
      }
    },
    {
      "d": {
        "a": "b"
      }
    },
    {
      "d": "k"
    },
    {
      "d": "v"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "[object Object]"
    },
    {
      "d": "{\"k\": \"v\"}"
    },
    {
      "d": "{\"k\":\"v\"}"
    },
    "v"
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@==42)]`
  Input:
  ```
  [
    0,
    42,
    -1,
    41,
    43,
    42.0001,
    41.9999,
    null,
    100
  ]
  ```
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key==43)]`
  Input:
  ```
  [
    {
      "key": 42
    }
  ]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key==42)]`
  Input:
  ```
  {
    "a": {
      "key": 0
    },
    "b": {
      "key": 42
    },
    "c": {
      "key": -1
    },
    "d": {
      "key": 41
    },
    "e": {
      "key": 43
    },
    "f": {
      "key": 42.0001
    },
    "g": {
      "key": 41.9999
    },
    "h": {
      "key": 100
    },
    "i": {
      "some": "value"
    }
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key=="hi@example.com")]`
  Input:
  ```
  [
    {
      "key": "some"
    },
    {
      "key": "value"
    },
    {
      "key": "hi@example.com"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "hi@example.com"}]
  ```
  Actual output:
  ```
  {
    "key": "hi@example.com"
  }
  ```

- [ ] `$[?(@.key=="some.value")]`
  Input:
  ```
  [
    {
      "key": "some"
    },
    {
      "key": "value"
    },
    {
      "key": "some.value"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "some.value"}]
  ```
  Actual output:
  ```
  {
    "key": "some.value"
  }
  ```

- [ ] `$[?(@.key=='value')]`
  Input:
  ```
  [
    {
      "key": "some"
    },
    {
      "key": "value"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$.items[?(@.key==$.value)]`
  Input:
  ```
  {
    "value": 42,
    "items": [
      {
        "key": 10
      },
      {
        "key": 42
      },
      {
        "key": 50
      }
    ]
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(2 in @.d)]`
  Input:
  ```
  [
    {
      "d": [
        1,
        2,
        3
      ]
    },
    {
      "d": [
        2
      ]
    },
    {
      "d": [
        1
      ]
    },
    {
      "d": [
        3,
        4
      ]
    },
    {
      "d": [
        4,
        2
      ]
    }
  ]
  ```
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key*2==100)]`
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
      "key*2": 100
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key!=42)]`
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.name=~/hello.*/)]`
  Input:
  ```
  [
    {
      "name": "hullo world"
    },
    {
      "name": "hello world"
    },
    {
      "name": "yes hello world"
    },
    {
      "name": "HELLO WORLD"
    },
    {
      "name": "good bye"
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  [
    {
      "key": 42
    },
    {
      "key": "42"
    }
  ]
  ```

- [ ] `$[?(@.a[?(@.price>10)])]`
  Input:
  ```
  [
    {
      "a": [
        {
          "price": 1
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": [
        {
          "price": 11
        }
      ]
    },
    {
      "a": [
        {
          "price": 8
        },
        {
          "price": 12
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": []
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key)]`
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$..[?(@.id)]`
  Input:
  ```
  {
    "id": 2,
    "more": [
      {
        "id": 2
      },
      {
        "more": {
          "id": 2
        }
      },
      {
        "id": {
          "id": 2
        }
      },
      [
        {
          "id": 2
        }
      ]
    ]
  }
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$..`
  Input:
  ```
  [
    {
      "a": {
        "b": "c"
      }
    },
    [
      0,
      1
    ]
  ]
  ```
  Error:
  ```
  Expecting ',' delimiter: line 10 column 5 (char 93)
  [
      {
          "a":
          {
              "b":"c"
          }
      },
          0,
          1
      }
  ]
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  ./node_modules/jsonpath.sh/JSONPath.sh: line 761: path: bad array subscript
  ./node_modules/jsonpath.sh/JSONPath.sh: line 778: closers[pathlen]: bad array subscript
  Expecting value: line 2 column 1 (char 6)
      [
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
  ./node_modules/jsonpath.sh/JSONPath.sh: line 761: path: bad array subscript
  ./node_modules/jsonpath.sh/JSONPath.sh: line 778: closers[pathlen]: bad array subscript
  Expecting value: line 2 column 1 (char 6)
      [
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
  ./node_modules/jsonpath.sh/JSONPath.sh: line 761: path: bad array subscript
  ./node_modules/jsonpath.sh/JSONPath.sh: line 778: closers[pathlen]: bad array subscript
  Expecting value: line 2 column 1 (char 6)
      [
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
  ggrep: Unmatched ( or \(
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[?(@.key<3),?(@.key>6)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 8
    },
    {
      "key": 3
    },
    {
      "key": 10
    },
    {
      "key": 7
    },
    {
      "key": 2
    },
    {
      "key": 6
    },
    {
      "key": 4
    }
  ]
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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

- [ ] `$[1:3,4]`
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Bash_JSONPath.sh.
