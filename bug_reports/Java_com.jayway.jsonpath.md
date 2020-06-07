Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  Error:
  ```
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: :
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
  Error:
  ```
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: ::
  ```

- [ ] `$[0:3:2]`
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
  ["first", "third"]
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
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
  ```
  [
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
    23
  ]
  ```

- [ ] `$[0:4:2]`
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
  ["first", "third"]
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third",
    "forth"
  ]
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
  Error:
  ```
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.InvalidPathException: Failed to parse SliceOperation: ::2
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: No results for path: $['missing']
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: No results for path: $[-1]
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: No results for path: $[1]
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
  Error:
  ```
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.InvalidPathException: Found empty property at index 5
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['key'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['id'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: No results for path: $['missing']
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
  SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
  SLF4J: Defaulting to no-operation (NOP) logger implementation
  SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
  com.jayway.jsonpath.PathNotFoundException: Expected to find an object with property ['length'] in path $ but found 'net.minidev.json.JSONArray'. This is not a json object according to the JsonProvider: 'com.jayway.jsonpath.spi.json.JsonSmartJsonProvider'.
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
  ```
  {
    "another": "entry",
    "key": "value"
  }
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
    "d": "dd1"
  }
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
  ```
  {
    "key": "value"
  }
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.jayway.jsonpath.
