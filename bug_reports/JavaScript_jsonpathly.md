Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  Expected "*", ":", "?", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], number, or string but "]" found.
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
  Expected "," or "]" but "q" found.
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
  Expected "," or "]" but "." found.
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
  Expected ",", "-", "]", or [a-zA-Z0-9_] but "." found.
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
  Expected "$" but "@" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "[" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "[" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "[" found.
  ```

- [ ] `$...key`
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
  Error:
  ```
  Expected "*", "[", "false", "null", "true", [\x80-\u{FFFF}_], or [a-zA-Z_] but "." found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "\"" found.
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
  Expected "*", "[", "false", "null", "true", [\x80-\u{FFFF}_], or [a-zA-Z_] but "\"" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but end of input found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "$" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "'" found.
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
  Expected "*", "[", "false", "null", "true", [\x80-\u{FFFF}_], or [a-zA-Z_] but "'" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but "'" found.
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
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], or number but " " found.
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
  Expected ".", "..", or "[" but "a" found.
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
  Expected "$" but "." found.
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
  Expected "$" but "k" found.
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
  Expected "$" but end of input found.
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
  Expected "!", "$", "(", "@", "[", "count", "false", "length", "match", "null", "search", "true", "value", "{", number, or string but ")" found.
  ```

- [ ] `$[?((@.key<44)==false)]`
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
  Expected "&&", ")", or "||" but "=" found.
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  Expected "!=", "&&", ")", "-", ".", "..", "<", "<=", "==", "=~", ">", ">=", "[", "anyof", "empty", "in", "nin", "noneof", "size", "sizeof", "subsetof", "||", [*/], [+\-], or [a-zA-Z0-9_] but "(" found.
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
  Expected "!=", "&&", ")", "-", ".", "..", "<", "<=", "==", "=~", ">", ">=", "[", "anyof", "empty", "in", "nin", "noneof", "size", "sizeof", "subsetof", "||", [*/], [+\-], or [a-zA-Z0-9_] but "=" found.
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
  Expected ".", "..", or "[" but "^" found.
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
  Expected "!=", "&&", ")", "-", ".", "..", "<", "<=", "==", "=~", ">", ">=", "[", "anyof", "empty", "in", "nin", "noneof", "size", "sizeof", "subsetof", "||", [*/], [+\-], or [a-zA-Z0-9_] but "=" found.
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
  Expected "$", "(", "@", "[", "count", "false", "length", "match", "null", "search", "true", "value", "{", number, or string but "=" found.
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  Expected "-", ".", "..", "[", or [a-zA-Z0-9_] but "(" found.
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
  Expected ".", "..", or "[" but "(" found.
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  Expected "*", "[", "false", "null", "true", [\x80-\u{FFFF}_], or [a-zA-Z_] but end of input found.
  ```

- [ ] `$.key..`
  Input:
  ```
  {
    "some key": "value",
    "key": {
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
  NOT_SUPPORTED
  ```
  Error:
  ```
  Expected "*", "[", "false", "null", "true", [\x80-\u{FFFF}_], or [a-zA-Z_] but end of input found.
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
  Expected "*", ":", "?", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], number, or string but "(" found.
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
  Expected "]" but "," found.
  ```

- [ ] `$.*[0,:5]`
  Input:
  ```
  {
    "a": [
      "string",
      null,
      true
    ],
    "b": [
      false,
      "string",
      5.4
    ]
  }
  ```
  Error:
  ```
  Expected "*", "false", "null", "true", [\x80-\u{FFFF}_], [a-zA-Z_], number, or string but ":" found.
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
  Expected ":" or "]" but "," found.
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/JavaScript_jsonpathly.
