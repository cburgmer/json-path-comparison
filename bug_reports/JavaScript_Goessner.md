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
    "nice"
  ]
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
    42
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
  
  <--- Last few GCs --->
  
  [36972:0x7f84b8100000]     2073 ms: Mark-sweep 24.8 (42.0) -> 9.1 (42.0) MB, 36.2 / 0.0 ms  (average mu = 0.903, current mu = 0.878) allocation failure scavenge might not succeed
  [36972:0x7f84b8100000]     2331 ms: Mark-sweep 34.8 (52.0) -> 12.4 (45.3) MB, 36.3 / 0.0 ms  (average mu = 0.882, current mu = 0.860) allocation failure scavenge might not succeed
  
  
  <--- JS stacktrace --->
  
  FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory
   1: 0x10be74fe4 node::Abort() [/usr/local/bin/node]
   2: 0x10be7515a node::OnFatalError(char const*, char const*) [/usr/local/bin/node]
   3: 0x10bfb26a9 v8::Utils::ReportOOMFailure(v8::internal::Isolate*, char const*, bool) [/usr/local/bin/node]
   4: 0x10bfb2653 v8::internal::V8::FatalProcessOutOfMemory(v8::internal::Isolate*, char const*, bool) [/usr/local/bin/node]
   5: 0x10c10b6a5 v8::internal::Heap::FatalProcessOutOfMemory(char const*) [/usr/local/bin/node]
   6: 0x10c109d2d v8::internal::Heap::CollectGarbage(v8::internal::AllocationSpace, v8::internal::GarbageCollectionReason, v8::GCCallbackFlags) [/usr/local/bin/node]
   7: 0x10c112544 v8::internal::Heap::AllocateRawWithLightRetrySlowPath(int, v8::internal::AllocationType, v8::internal::AllocationOrigin, v8::internal::AllocationAlignment) [/usr/local/bin/node]
   8: 0x10c11259a v8::internal::Heap::AllocateRawWithRetryOrFailSlowPath(int, v8::internal::AllocationType, v8::internal::AllocationOrigin, v8::internal::AllocationAlignment) [/usr/local/bin/node]
   9: 0x10c0eff66 v8::internal::Factory::NewFillerObject(int, bool, v8::internal::AllocationType, v8::internal::AllocationOrigin) [/usr/local/bin/node]
  10: 0x10c3866b9 v8::internal::Runtime_AllocateInYoungGeneration(int, unsigned long*, v8::internal::Isolate*) [/usr/local/bin/node]
  11: 0x10c62e639 Builtins_CEntry_Return1_DontSaveFPRegs_ArgvOnStack_NoBuiltinExit [/usr/local/bin/node]
  12: 0x10c62f5fb Builtins_StringAdd_CheckNone [/usr/local/bin/node]
  13: 0x10c65b4dc Builtins_StringAddConvertLeft [/usr/local/bin/node]
  14: 0x26b9cb706878 
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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

- [ ] `$[""]`
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
  Actual output:
  ```
  [
    222
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
    "more"
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
    1
  ]
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
  undefined
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
  Actual output:
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  jsonPath: dash is not defined: _v.key-dash == 'value'
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
  jsonPath: Unexpected number: _v.2 == 'second'
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
  jsonPath: Unexpected token :: _v[0:1]==[1]
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
  jsonPath: Unexpected token *=: _v.*==[1,2]
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
  jsonPath: Unexpected token :: _v[0:1]==1
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
  jsonPath: Unexpected token *: _v[*]==2
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
  jsonPath: Unexpected token *=: _v.*==2
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  jsonPath: Unexpected token *: _v[*]>=4
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
  jsonPath: Unexpected token *: _v[*]>=$.y[*]
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
  jsonPath: Unexpected token ?: _v.a[?(_v.price>10)
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
  jsonPath: Unexpected token .: _v..child
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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
  jsonPath: key is not defined: (key,more)
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
  jsonPath: Unexpected token ): _v.key<3),?(_v.key>6
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
  NOT_FOUND
  ```
  jsonpath returned false, this might indicate an error
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


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/JavaScript_Goessner.
