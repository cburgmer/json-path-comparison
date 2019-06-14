Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://github.com/cburgmer/json-path-comparison/tree/master/comparison):

- [ ] `$..*`
  Input:
  ```
  { "key": "value", "another key": { "complex": "string", "primitives": [0, 1] } }
  ```
  Expected output
  ```
  [ "value", { "complex": "string", "primitives": [ 0, 1 ] }, "string", [ 0, 1 ], 0, 1 ]
  ```
  Actual output
  ```
  [ { "complex": "string", "primitives": [ 0, 1 ] }, "value", [ 0, 1 ], "string" ]
  ```

- [ ] `$.key.*`
  Input:
  ```
  { "key": [ "string", 42, { "key": "value" }, [0, 1] ] }
  ```
  Expected output
  ```
  [ "string", 42, { "key": "value" }, [ 0, 1 ] ]
  ```
  Actual output
  ```
  []
  ```

- [ ] `$.key.*`
  Input:
  ```
  { "key": { "some": "string", "int": 42, "object": { "key": "value" }, "array": [0, 1] } }
  ```
  Expected output
  ```
  [ "string", 42, { "key": "value" }, [ 0, 1 ] ]
  ```
  Actual output
  ```
  [ 42, [ 0, 1 ], { "key": "value" }, "string" ]
  ```

