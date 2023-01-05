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
  Error Parsing JSON Path:
  $[0:3:0]
  panic occurred
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
  Error Parsing JSON Path:
  $[]
  panic occurred
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
  Error Parsing JSON Path:
  $['\'']
  panic occurred
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
  Error Parsing JSON Path:
  $[':@."$,*\'\\']
  panic occurred
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
  Error Parsing JSON Path:
  $['single'quote']
  panic occurred
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
  Error:
  ```
  Error Parsing JSON Path:
  $['two'.'some']
  panic occurred
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
  Error Parsing JSON Path:
  $[two.some]
  panic occurred
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
  Error Parsing JSON Path:
  $[key]
  panic occurred
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
  Error Parsing JSON Path:
  @.a
  panic occurred
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
  Error Parsing JSON Path:
  $.['key']
  panic occurred
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
  Error Parsing JSON Path:
  $.["key"]
  panic occurred
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
  Error Parsing JSON Path:
  $.[key]
  panic occurred
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
  Error Parsing JSON Path:
  $."key"
  panic occurred
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
  Error Parsing JSON Path:
  $.."key"
  panic occurred
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
  Error Parsing JSON Path:
  $.
  panic occurred
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
  Error Parsing JSON Path:
  $.$
  panic occurred
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
  Error Parsing JSON Path:
  $.'key'
  panic occurred
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
  Error Parsing JSON Path:
  $..'key'
  panic occurred
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
  Error Parsing JSON Path:
  $.'some.key'
  panic occurred
  ```

- [ ] `$. a `
  Input:
  ```
  {
    " a": 1,
    "a": 2,
    " a ": 3,
    "": 4
  }
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $. a 
  panic occurred
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
  Error:
  ```
  Error Parsing JSON Path:
  $a
  panic occurred
  ```

- [ ] `.key`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  Error Parsing JSON Path:
  .key
  panic occurred
  ```

- [ ] `key`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  Error Parsing JSON Path:
  key
  panic occurred
  ```

- [ ] ``
  Input:
  ```
  {
    "a": 42,
    "": 21
  }
  ```
  Error:
  ```
  Error Parsing JSON Path:
  
  panic occurred
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
  Error Parsing JSON Path:
  $[?()]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.d==["v1","v2"])]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@[0:1]==[1])]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.*==[1,2])]
  panic occurred
  ```

- [ ] `$[?(@.d==["v1","v2"] || (@.d == true))]`
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
      "d": true
    }
  ]
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $[?(@.d==["v1","v2"] || (@.d == true))]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.d==['v1','v2'])]
  panic occurred
  ```

- [ ] `$[?(@.key==-0.123e2)]`
  Input:
  ```
  [
    {
      "key": -12.3
    },
    {
      "key": -0.123
    },
    {
      "key": -12
    },
    {
      "key": 12.3
    },
    {
      "key": 2
    },
    {
      "key": "-0.123e2"
    }
  ]
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $[?(@.key==-0.123e2)]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.d=={"k":"v"})]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.d in [2, 3])]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(2 in @.d)]
  panic occurred
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
  Error:
  ```
  Error Parsing JSON Path:
  $[?(length(@) == 4)]
  panic occurred
  ```

- [ ] `$[?(@.length() == 4)]`
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
  Error:
  ```
  Error Parsing JSON Path:
  $[?(@.length() == 4)]
  panic occurred
  ```

- [ ] `$[?(@.key='value')]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": "value"
    },
    null,
    {
      "key": 42
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
  Error Parsing JSON Path:
  $[?(@.key='value')]
  panic occurred
  ```

- [ ] `$[?(!(@.d==["v1","v2"]) || (@.d == true))]`
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
      "d": true
    }
  ]
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $[?(!(@.d==["v1","v2"]) || (@.d == true))]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.key!=42)]
  panic occurred
  ```

- [ ] `$[?((@.d!=["v1","v2"]) || (@.d == true))]`
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
      "d": true
    }
  ]
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $[?((@.d!=["v1","v2"]) || (@.d == true))]
  panic occurred
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
  Error:
  ```
  Error Parsing JSON Path:
  $[*].bookmarks[?(@.page == 45)]^^^
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.name=~/hello.*/)]
  panic occurred
  ```

- [ ] `$[?(@.name=~/@.pattern/)]`
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
    },
    {
      "pattern": "hello.*"
    }
  ]
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $[?(@.name=~/@.pattern/)]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.key=42)]
  panic occurred
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
  Error Parsing JSON Path:
  $[?(@.key===42)]
  panic occurred
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
  Error Parsing JSON Path:
  $[?@.key==42]
  panic occurred
  ```

- [ ] `$.data.sum()`
  Input:
  ```
  {
    "data": [
      1,
      2,
      3,
      4
    ]
  }
  ```
  Error:
  ```
  Error Parsing JSON Path:
  $.data.sum()
  panic occurred
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
  Error Parsing JSON Path:
  $(key,more)
  panic occurred
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
  Error:
  ```
  Error Parsing JSON Path:
  $[(@.length-1)]
  panic occurred
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
  [
    "cc1",
    "cc2",
    "dd1",
    "dd2"
  ]
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
  [
    "cc1",
    "cc2",
    "dd1",
    "dd2"
  ]
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
  Error Parsing JSON Path:
  $[*,1]
  panic occurred
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Rust_jsonpath_plus.
