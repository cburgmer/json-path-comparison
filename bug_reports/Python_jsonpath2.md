Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  timeout: sending signal TERM to command ‘implementations/Python_jsonpath2/run.sh’
  ```

- [ ] `$[2:-113667776004:-1]`
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
  timeout: sending signal TERM to command ‘implementations/Python_jsonpath2/run.sh’
  ```

- [ ] `$[113667776004:2:-1]`
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
  timeout: sending signal TERM to command ‘implementations/Python_jsonpath2/run.sh’
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
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  line 1:3 token recognition error at: '''
  ValueError("line 1:3 token recognition error at: '''")
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
  line 1:13 token recognition error at: '&'
  ValueError("line 1:13 token recognition error at: '&'")
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
  line 1:13 token recognition error at: '|'
  ValueError("line 1:13 token recognition error at: '|'")
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
  NOT_SUPPORTED
  ```
  line 1:6 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:6 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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

- [ ] `$[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2
  }
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:9 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  Expected output:
  ```
  [{"key": 42}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:16 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:16 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
  ```

- [ ] `$[?(@.key>"VALUE")]`
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
      "key": "alpha"
    },
    {
      "key": "ALPHA"
    },
    {
      "key": "value"
    },
    {
      "key": "VALUE"
    },
    {
      "some": "value"
    },
    {
      "some": "VALUE"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "alpha"}, {"key": "value"}]
  ```
  Actual output:
  ```
  []
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
  NOT_SUPPORTED
  ```
  line 1:14 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:14 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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

- [ ] `$[?(@.a.b==3)]`
  Input:
  ```
  [
    {
      "a": {
        "b": 3
      }
    },
    {
      "a": {
        "b": 2
      }
    }
  ]
  ```
  Expected output:
  ```
  [{"a": {"b": 3}}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:10 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
  ```

- [ ] `$[?(@.a.b.c==3)]`
  Input:
  ```
  [
    {
      "a": {
        "b": {
          "c": 3
        }
      }
    },
    {
      "a": 3
    },
    {
      "c": 3
    },
    {
      "a": {
        "b": {
          "c": 2
        }
      }
    }
  ]
  ```
  Expected output:
  ```
  [{"a": {"b": {"c": 3}}}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:12 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:12 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
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
  Expected output:
  ```
  [1, 3, "nice", true, null, false, {}, [], -1, 0, ""]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:6 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}
  ValueError("line 1:6 extraneous input '=' expecting {'@', '$', 'true', 'false', 'null', '{', '[', STRING, NUMBER}")
  ```

- [ ] `$.*[?(@.key)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": "value"
    }
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    {
      "key": "value"
    }
  ]
  ```

- [ ] `$['a','a']`
  Input:
  ```
  {
    "a": 1
  }
  ```
  Expected output:
  ```
  [1, 1]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '''
  ValueError("line 1:2 token recognition error at: '''")
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
  NOT_SUPPORTED
  ```
  line 1:4 token recognition error at: '''
  ValueError("line 1:4 token recognition error at: '''")
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
  line 1:4 token recognition error at: '''
  ValueError("line 1:4 token recognition error at: '''")
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


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Python_jsonpath2.
