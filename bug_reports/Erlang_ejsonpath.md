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
  init terminating in do_boot (not_implemented)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",not_implemented}
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
  syntax error before: ':'
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
  init terminating in do_boot (not_implemented)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",not_implemented}
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
  syntax error before: ']'
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
  syntax error before: ':'
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
  init terminating in do_boot (not_implemented)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",not_implemented}
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
  Timeout
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
  Timeout
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
  Timeout
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

- [ ] `$.key-dash`
  Input:
  ```
  {
    "key": 42,
    "key-": 43,
    "-": 44,
    "dash": 45,
    "-dash": 46,
    "": 47,
    "key-dash": "value",
    "something": "else"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  syntax error before: '-'
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
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",function_clause}
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
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",function_clause}
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
  Error:
  ```
  Timeout
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
  NOT_SUPPORTED
  ```
  syntax error before: 2
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
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",function_clause}
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
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",function_clause}
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
  init terminating in do_boot (function_clause)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",function_clause}
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
  init terminating in do_boot ({not_implemented,bin_op,+})
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",{not_implemented,bin_op,'+'}}
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
  Error:
  ```
  init terminating in do_boot ({badarg,42})
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",{badarg,42}}
  ```

- [ ] `$[?(@.key>43 || @.key<43)]`
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
  [{"key": 42}, {"key": 44}]
  ```
  Error:
  ```
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
  ```

- [ ] `$[?(@.a && @.b || @.c)]`
  Input:
  ```
  [
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
      "a": true
    },
    {
      "b": true
    },
    {
      "c": true
    },
    {
      "d": true
    },
    {}
  ]
  ```
  Error:
  ```
  Timeout
  ```

- [ ] `$[?(@.key/10==5)]`
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
      "key/10": 5
    }
  ]
  ```
  Error:
  ```
  init terminating in do_boot ({not_implemented,bin_op,/})
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",{not_implemented,bin_op,'/'}}
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
  Timeout
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
  init terminating in do_boot (not_implemented)
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",not_implemented}
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
  Timeout
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
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key=="Motörhead")]`
  Input:
  ```
  [
    {
      "key": "something"
    },
    {
      "key": "Mot\u00f6rhead"
    },
    {
      "key": "mot\u00f6rhead"
    },
    {
      "key": "Motorhead"
    },
    {
      "key": "Motoo\u0308rhead"
    },
    {
      "key": "motoo\u0308rhead"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "Mot\u00f6rhead"}]
  ```
  Actual output:
  ```
  []
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
  Timeout
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
  Timeout
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
  Timeout
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
  init terminating in do_boot ({not_implemented,bin_op,*})
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",{not_implemented,bin_op,'*'}}
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  Timeout
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
  init terminating in do_boot ({not_implemented,bin_op,-})
  
  Crash dump is being written to: /dev/null...done
  {"init terminating in do_boot",{not_implemented,bin_op,'-'}}
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
  syntax error before: '['
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Erlang_ejsonpath.
