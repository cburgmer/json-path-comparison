Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[0:3:-2]`
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
  []
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
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
  []
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
  []
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
  Expected output:
  ```
  [{"key": 42}]
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
  ```
  [
    {
      "id": 2
    }
  ]
  ```

- [ ] `$[?(@.key==true)]`
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
  Expected output:
  ```
  [{"key": true}]
  ```
  Actual output:
  ```
  [
    {
      "key": true
    },
    {
      "key": 1
    }
  ]
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
  [
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": "alpha"
    },
    {
      "key": "value"
    }
  ]
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
  Actual output:
  ```
  [
    [
      1,
      2,
      3,
      4
    ]
  ]
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
  Expected output:
  ```
  [{"key": 0}, {"key": -1}, {"key": 41}, {"key": 41.9999}]
  ```
  Actual output:
  ```
  [
    {
      "key": 0
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 41.9999
    },
    {
      "key": "41"
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
  []
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
  Actual output:
  ```
  [
    10
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Swift_Sextant.
