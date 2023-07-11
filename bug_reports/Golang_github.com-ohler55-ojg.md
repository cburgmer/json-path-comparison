Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  Expected output:
  ```
  []
  ```
  Actual output:
  NOT_SUPPORTED
  ```
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
  Exception: runtime error: comparing uncomparable type []interface {}
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
  Exception: runtime error: comparing uncomparable type []interface {}
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
  Exception: runtime error: comparing uncomparable type []interface {}
  ```

- [ ] `$[?(@.key1==@.key2)]`
  Input:
  ```
  [
    {
      "key1": 10,
      "key2": 10
    },
    {
      "key1": 42,
      "key2": 50
    },
    {
      "key1": 10
    },
    {
      "key2": 10
    },
    {},
    {
      "key1": null,
      "key2": null
    },
    {
      "key1": null
    },
    {
      "key2": null
    },
    {
      "key1": 0,
      "key2": 0
    },
    {
      "key1": 0
    },
    {
      "key2": 0
    },
    {
      "key1": -1,
      "key2": -1
    },
    {
      "key1": "",
      "key2": ""
    },
    {
      "key1": false,
      "key2": false
    },
    {
      "key1": false
    },
    {
      "key2": false
    },
    {
      "key1": true,
      "key2": true
    },
    {
      "key1": [],
      "key2": []
    },
    {
      "key1": {},
      "key2": {}
    },
    {
      "key1": {
        "a": 1,
        "b": 2
      },
      "key2": {
        "b": 2,
        "a": 1
      }
    }
  ]
  ```
  Error:
  ```
  Exception: runtime error: comparing uncomparable type map[string]interface {}
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
  Exception: runtime error: comparing uncomparable type []interface {}
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
  NOT_SUPPORTED
  ```
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
  [
    {
      "key": 42
    }
  ]
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
  Actual output:
  ```
  [
    "string",
    0,
    1,
    [
      0,
      1
    ],
    {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  [
    [
      0
    ],
    [
      1
    ]
  ]
  ```
  Expected output:
  ```
  [[0], [1], 0, 1]
  ```
  Actual output:
  ```
  [
    0,
    1,
    [
      0
    ],
    [
      1
    ]
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-ohler55-ojg.
