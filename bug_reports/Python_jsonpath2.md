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
  ValueError('range() arg 3 must not be zero')
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
  line 1:3 mismatched input '10' expecting {']', ','}
  ValueError("line 1:3 mismatched input '10' expecting {']', ','}")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:5 token recognition error at: '-d'
  ValueError("line 1:5 token recognition error at: '-d'")
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
  NOT_SUPPORTED
  ```
  line 1:2 mismatched input 'null' expecting {'*', ID}
  ValueError("line 1:2 mismatched input 'null' expecting {'*', ID}")
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
  NOT_SUPPORTED
  ```
  line 1:2 mismatched input 'true' expecting {'*', ID}
  ValueError("line 1:2 mismatched input 'true' expecting {'*', ID}")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '屬'
  ValueError("line 1:2 token recognition error at: '屬'")
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
  line 1:2 mismatched input '2' expecting {'*', ID}
  ValueError("line 1:2 mismatched input '2' expecting {'*', ID}")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:6 token recognition error at: '''
  ValueError("line 1:6 token recognition error at: '''")
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
  line 1:6 token recognition error at: '''
  ValueError("line 1:6 token recognition error at: '''")
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
  line 1:10 token recognition error at: '''
  ValueError("line 1:10 token recognition error at: '''")
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
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  NOT_SUPPORTED
  ```
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  NOT_SUPPORTED
  ```
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  line 1:11 token recognition error at: '''
  ValueError("line 1:11 token recognition error at: '''")
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
  []
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
  line 1:20 token recognition error at: '''
  ValueError("line 1:20 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:5 token recognition error at: '''
  ValueError("line 1:5 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:5 token recognition error at: '''
  ValueError("line 1:5 token recognition error at: '''")
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
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Python_jsonpath2.
