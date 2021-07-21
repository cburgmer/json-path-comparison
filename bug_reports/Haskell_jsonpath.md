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
  json-path-comparison: expected array, found {"c":3,"1:3":"nice","b":2,"a":1,"more":"string",":":42}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  timeout: sending signal TERM to command ‘./build/json-path-comparison’
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
  timeout: sending signal TERM to command ‘./build/json-path-comparison’
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
  timeout: sending signal TERM to command ‘./build/json-path-comparison’
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
  timeout: sending signal TERM to command ‘./build/json-path-comparison’
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
  Invalid JSONPath: $[:]
   Error: searchBeginningWithSlice: string
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
  Invalid JSONPath: $[::]
   Error: searchBeginningWithSlice: string
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
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[:]
   Error: searchBeginningWithSlice: string
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
  timeout: sending signal TERM to command ‘./build/json-path-comparison’
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
  Invalid JSONPath: $[1:3:]
   Error: searchBeginningWithSlice: string
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected key missing in object {"key":"value"}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['ü']
   Error: searchBeginningWithSlice: string
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
  "42"
  ```
  Error:
  ```
  json-path-comparison: src/Data/JSONPath/Execute.hs:(29,1)-(63,29): Non-exhaustive patterns in function executeJSONPathElement
  
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $["key"]
   Error: searchBeginningWithSlice: string
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
  42
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['']
   Error: searchBeginningWithSlice: string
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
  42
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[""]
   Error: searchBeginningWithSlice: string
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
  null
  ```
  Error:
  ```
  json-path-comparison: index -2 invalid for array ["one element"]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
  ```

- [ ] `$[-1]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: index -1 invalid for array []
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  json-path-comparison: index 1 invalid for array [1]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected array, found {"0":"value"}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Error:
  ```
  json-path-comparison: index 1 invalid for array ["one element"]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Expected output:
  ```
  null
  ```
  Error:
  ```
  json-path-comparison: expected array, found "Hello World"
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[':']
   Error: searchBeginningWithSlice: string
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
  42
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[']']
   Error: searchBeginningWithSlice: string
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['@']
   Error: searchBeginningWithSlice: string
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['.']
   Error: searchBeginningWithSlice: string
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
  1
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['.*']
   Error: searchBeginningWithSlice: string
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['"']
   Error: searchBeginningWithSlice: string
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['$']
   Error: searchBeginningWithSlice: string
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
  Invalid JSONPath: $[',']
   Error: searchBeginningWithSlice: string
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['*']
   Error: searchBeginningWithSlice: string
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
  null
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['*']
   Error: searchBeginningWithSlice: string
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
  2
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[ 'a' ]
   Error: searchBeginningWithSlice: string
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
  1
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['ni.*']
   Error: searchBeginningWithSlice: string
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
  1
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
  Error:
  ```
  json-path-comparison: expected key a in object {"b":1}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  "forty-two"
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
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['one','three'].key
   Error: searchBeginningWithSlice: string
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected object, found [0,1]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected object, found [{"id":2}]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected key missing in object {"key":"value"}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  null
  ```
  Error:
  ```
  json-path-comparison: expected object, found [4,5,6]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $.屬性
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: expected object, found ["first","second","third","forth","fifth"]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  json-path-comparison: expected object, found ["first","second","third","forth","fifth"]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  json-path-comparison: Search failed
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
  ```

- [ ] `$..*[?(@.id>2)]`
  Input:
  ```
  [
    {
      "complext": {
        "one": [
          {
            "name": "first",
            "id": 1
          },
          {
            "name": "next",
            "id": 2
          },
          {
            "name": "another",
            "id": 3
          },
          {
            "name": "more",
            "id": 4
          }
        ],
        "more": {
          "name": "next to last",
          "id": 5
        }
      }
    },
    {
      "name": "last",
      "id": 6
    }
  ]
  ```
  Error:
  ```
  json-path-comparison: Search failed
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@.key>42 && @.key<44)]
   Error: searchBeginningWithSlice: string
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@.key>43 || @.key<43)]
   Error: searchBeginningWithSlice: string
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
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@['@key']==42)]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@[1]=='b')]
   Error: searchBeginningWithSlice: string
  ```

- [ ] `$[?(@.key==42)]`
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
  ```

- [ ] `$[?(@.key==010)]`
  Input:
  ```
  [
    {
      "key": "010"
    },
    {
      "key": "10"
    },
    {
      "key": 10
    },
    {
      "key": 0
    },
    {
      "key": 8
    }
  ]
  ```
  Error:
  ```
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  json-path-comparison: expected array, found {"d":{"key":41},"i":{"some":"value"},"c":{"key":-1},"h":{"key":100},"b":{"key":42},"g":{"key":41.9999},"a":{"key":0},"f":{"key":42.0001},"e":{"key":43}}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  json-path-comparison: expected array, found {"id":2}
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
  ```

- [ ] `$[?(@.key=="value")]`
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
      "key": null
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
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": "valuemore"
    },
    {
      "key": "morevalue"
    },
    {
      "key": [
        "value"
      ]
    },
    {
      "key": {
        "some": "value"
      }
    },
    {
      "key": {
        "key": "value"
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@.key=='value')]
   Error: searchBeginningWithSlice: string
  ```

- [ ] `$.items[?(@.key1==@.key2)]`
  Input:
  ```
  {
    "items": [
      {
        "key1": 10,
        "key2": 10
      },
      {
        "key1": 42,
        "key2": 50
      }
    ]
  }
  ```
  Expected output:
  ```
  [{"key1": 10, "key2": 10}]
  ```
  Actual output:
  ```
  [
    {
      "key1": 10,
      "key2": 10
    },
    {
      "key1": 42,
      "key2": 50
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
  json-path-comparison: src/Data/JSONPath/Execute.hs:(71,1)-(72,60): Non-exhaustive patterns in function executeCondition
  
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
      "page": 45
    },
    {
      "page": 45
    }
  ]
  ```

- [ ] `$[?(@.address.city=='Berlin')]`
  Input:
  ```
  [
    {
      "address": {
        "city": "Berlin"
      }
    },
    {
      "address": {
        "city": "London"
      }
    }
  ]
  ```
  Expected output:
  ```
  [{"address": {"city": "Berlin"}}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $[?(@.address.city=='Berlin')]
   Error: searchBeginningWithSlice: string
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
  json-path-comparison: expected object, found [1,2,3,4]
  CallStack (from HasCallStack):
    error, called at app/Main.hs:19:22 in main:Main
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
  {"another key": {"complex": ["a", 1]}, "key": "value"}
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
  ```

- [ ] `$`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  42
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
  ```

- [ ] `$`
  Input:
  ```
  false
  ```
  Expected output:
  ```
  false
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
  ```

- [ ] `$`
  Input:
  ```
  true
  ```
  Expected output:
  ```
  true
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $
   Error: searchBeginningWithSlice: not enough input
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
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['key','another']
   Error: searchBeginningWithSlice: string
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
  Invalid JSONPath: $[:]['c','d']
   Error: searchBeginningWithSlice: string
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
    "d": "dd1",
    "e": "ee1"
  }
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
  NOT_SUPPORTED
  ```
  Invalid JSONPath: $['missing','key']
   Error: searchBeginningWithSlice: string
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
  Invalid JSONPath: $[ 0 , 1 ]
   Error: searchBeginningWithSlice: string
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Haskell_jsonpath.
