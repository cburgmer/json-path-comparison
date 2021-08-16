Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
    42
  ]
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
  Actual output:
  ```
  []
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

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    "H"
  ]
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
  Actual output:
  ```
  []
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
  ```
  []
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
  Unknown value type 
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
  Actual output:
  ```
  [
    {
      "$": "value",
      "another": "entry"
    }
  ]
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
  Actual output:
  ```
  [
    "entry",
    "value"
  ]
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "another": "entry"
  }
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    "entry"
  ]
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
  ```
  [
    5
  ]
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
  Actual output:
  ```
  [
    "42"
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
  Actual output:
  ```
  [
    "value"
  ]
  ```

- [ ] `@.a`
  Input:
  ```
  {
    "a": 1
  }
  ```
  Error:
  ```
  Unknown value type 
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
  [
    "value",
    [
      {
        "key": 42
      }
    ],
    42
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
  []
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
  evalmachine.<anonymous>:1
  ```

- [ ] `$[?(@.key-dash == 'value')]`
  Input:
  ```
  [
    {
      "key-dash": "value"
    }
  ]
  ```
  Error:
  ```
  evalmachine.<anonymous>:1
      at evalmachine.<anonymous>:1:10
  ```

- [ ] `$[?(@.2 == 'second')]`
  Input:
  ```
  [
    {
      "a": "first",
      "2": "second",
      "b": "third"
    }
  ]
  ```
  Error:
  ```
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
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
  []
  ```

- [ ] `$[?(@[0:1]==[1])]`
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
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
  ```

- [ ] `$[?(@[*]==2)]`
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
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
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
  evalmachine.<anonymous>:1
      at evalmachine.<anonymous>:1:11
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    {
      "d": 1
    },
    {
      "d": 1
    }
  ]
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    {
      "d": [
        1,
        2,
        3
      ]
    }
  ]
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
    {
      "bookmarks": [
        {
          "page": 35
        },
        {
          "page": 45
        }
      ],
      "title": "Sword of Honour"
    },
    {
      "bookmarks": [
        {
          "page": 3035
        },
        {
          "page": 45
        }
      ],
      "title": "Moby Dick"
    }
  ]
  ```

- [ ] `$[?(@[*]>=4)]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      3,
      4
    ],
    [
      5,
      6
    ]
  ]
  ```
  Error:
  ```
  evalmachine.<anonymous>:1
  ```

- [ ] `$.x[?(@[*]>=$.y[*])]`
  Input:
  ```
  {
    "x": [
      [
        1,
        2
      ],
      [
        3,
        4
      ],
      [
        5,
        6
      ]
    ],
    "y": [
      3,
      4,
      5
    ]
  }
  ```
  Error:
  ```
  evalmachine.<anonymous>:1
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
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42
    },
    {
      "key": 42,
      "some": "value"
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
  evalmachine.<anonymous>:1
  ```

- [ ] `$[?(@..child)]`
  Input:
  ```
  [
    {
      "key": [
        {
          "child": 1
        },
        {
          "child": 2
        }
      ]
    },
    {
      "key": [
        {
          "child": 2
        }
      ]
    },
    {
      "key": [
        {}
      ]
    },
    {
      "key": [
        {
          "something": 42
        }
      ]
    },
    {}
  ]
  ```
  Error:
  ```
  evalmachine.<anonymous>:1
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
  Actual output:
  ```
  []
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
  []
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
  undefined
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
  evalmachine.<anonymous>:1
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
  []
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
  ```
  []
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
  []
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
  Expected output:
  ```
  ["cc1", "dd1", "cc2", "dd2"]
  ```
  Actual output:
  ```
  []
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
  []
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
  ```
  []
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


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/JavaScript_jsonpath-plus.
