Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://github.com/cburgmer/json-path-comparison/tree/master/comparison):

- [ ] `$[1:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output
  ```
  [ "second", "third" ]
  ```
  Actual output
  ```
  "second"
  ```

- [ ] `$[:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output
  ```
  [ "first", "second" ]
  ```
  Actual output
  ```
  "third"
  ```

- [ ] `$[1:]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output
  ```
  [ "second", "third", "forth", "fifth" ]
  ```
  Actual output
  ```
  "second"
  ```

- [ ] `$[1:3]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output
  ```
  [ "second", "third" ]
  ```
  Actual output
  ```
  "second"
  ```

- [ ] `$[0:1]`
  Input:
  ```
  [ "first", "second" ]
  ```
  Expected output
  ```
  [ "first" ]
  ```
  Actual output
  ```
  "first"
  ```

- [ ] `$[0,1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output
  ```
  [ "first", "second" ]
  ```
  Actual output
  ```
  "first"
  ```

- [ ] `$[*]`
  Input:
  ```
  [ "string", 42, { "key": "value" }, [0, 1] ]
  ```
  Expected output
  ```
  [ "string", 42, { "key": "value" }, [ 0, 1 ] ]
  ```
  Actual output
  ```
  [ "string", 42, { "key": "value" }, 0, 1 ]
  ```

- [ ] `$.*`
  Input:
  ```
  [ "string", 42, { "key": "value" }, [0, 1] ]
  ```
  Expected output
  ```
  [ "string", 42, { "key": "value" }, [ 0, 1 ] ]
  ```
  Actual output
  ```
  [ "string", 42, { "key": "value" }, 0, 1 ]
  ```

- [ ] `$.*`
  Input:
  ```
  { "some": "string", "int": 42, "object": { "key": "value" }, "array": [0, 1] }
  ```
  Expected output
  ```
  [ "string", 42, { "key": "value" }, [ 0, 1 ] ]
  ```
  Actual output
  ```
  [ "string", 42, { "key": "value" }, 0, 1 ]
  ```

