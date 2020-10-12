Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  []
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  parsing error: $['key']	:1:3 - 1:8 could not parse string: invalid syntax
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
  Actual output:
  NOT_SUPPORTED
  ```
  parsing error: $['missing']	:1:3 - 1:12 could not parse string: invalid syntax
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
  Error:
  ```
  unknown key ü
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
  Actual output:
  NOT_SUPPORTED
  ```
  parsing error: $['two.some']	:1:3 - 1:13 could not parse string: invalid syntax
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
  index -2 out of bounds
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
  "third"
  ```
  Error:
  ```
  index -1 out of bounds
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
  index -1 out of bounds
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
  index 1 out of bounds
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Error:
  ```
  unsupported value type string for select, expected map[string]interface{} or []interface{}
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
  parsing error: $['.*']	:1:3 - 1:7 could not parse string: invalid syntax
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "another": "entry"
  }
  ```
  Error:
  ```
  unknown key *
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
  parsing error: $['ni.*']	:1:3 - 1:9 could not parse string: invalid syntax
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
  unknown key more
  ```

- [ ] `$[key]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  unknown key value
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
  parsing error: $['one','three'].key	:1:3 - 1:8 could not parse string: invalid syntax
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
  could not select value, invalid key: expected number but got key (string)
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
  could not select value, invalid key: expected number but got id (string)
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
  unknown key missing
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
  "value"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  parsing error: $.key-dash	:1:6 - 1:7 unexpected "-" while scanning operator
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
  could not select value, invalid key: expected number but got length (string)
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
  "second"
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  parsing error: $.2	:1:2 - 1:4 unexpected Float while scanning operator
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
  parsing error: $[?(@.key>42 && @.key<44)]	:1:10 - 1:11 unexpected ">" while scanning parentheses expected ")"
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
  parsing error: $[?(@['key']==42)]	:1:7 - 1:12 could not parse string: invalid syntax
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
  parsing error: $[?(@['@key']==42)]	:1:7 - 1:13 could not parse string: invalid syntax
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
  parsing error: $[?(@.key=='value')]	:1:12 - 1:19 could not parse string: invalid syntax
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
  parsing error: $[?(@.address.city=='Berlin')]	:1:21 - 1:29 could not parse string: invalid syntax
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
  parsing error: $['key','another']	:1:3 - 1:8 could not parse string: invalid syntax
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
  parsing error: $['missing','key']	:1:3 - 1:12 could not parse string: invalid syntax
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-PaesslerAG-jsonpath.
