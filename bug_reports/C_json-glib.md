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
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
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
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  ```

- [ ] `$[-4:1]`
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
    4,
    5,
    100,
    "nice"
  ]
  ```

- [ ] `$[-4:2]`
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
    4,
    5,
    100,
    "nice"
  ]
  ```

- [ ] `$[-4:3]`
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
    5,
    100,
    "nice"
  ]
  ```

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
  Error:
  ```
  timeout: sending signal TERM to command ‘build/main’
  ```

- [ ] `$[1:]`
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
  ["second", "third", "forth", "fifth"]
  ```
  Actual output:
  ```
  []
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
  ```
  []
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
  ```
  []
  ```

- [ ] `$[:2:-1]`
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
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
  json_array_get_element: assertion 'index_ < array->elements->len' failed
  json_node_copy: assertion 'JSON_NODE_IS_VALID (node)' failed
  json_array_add_element: assertion 'node != NULL' failed
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
  []
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
  Error:
  ```
  timeout: sending signal TERM to command ‘build/main’
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
  timeout: sending signal TERM to command ‘build/main’
  ```

- [ ] `$[0:3:1]`
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
  ["first", "second", "third"]
  ```
  Error:
  ```
  timeout: sending signal TERM to command ‘build/main’
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
  Error:
  ```
  timeout: sending signal TERM to command ‘build/main’
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
  Unable to compile selector `$[1:3:]': Invalid slice definition “ 1:3:]”
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
  Actual output:
  ```
  []
  ```

- [ ] `$..[0]`
  Input:
  ```
  [
    "first",
    {
      "key": [
        "first nested",
        {
          "more": [
            {
              "nested": [
                "deepest",
                "second"
              ]
            },
            [
              "more",
              "values"
            ]
          ]
        }
      ]
    }
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Unable to compile selector `$..[0]': Missing member name or wildcard after . character
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
  ["value"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Unable to compile selector `$["key"]': Invalid array index definition “"key"]”
  ```

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
  NOT_SUPPORTED
  ```
  Unable to compile selector `$[""]': Invalid array index definition “""]”
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
  ["third"]
  ```
  Actual output:
  ```
  []
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
  Actual output:
  ```
  [
    [
      [
        1
      ],
      [
        2,
        3
      ]
    ]
  ]
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
  Actual output:
  ```
  []
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
  ```
  [
    "entry",
    "value"
  ]
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
  ```
  [
    "entry"
  ]
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
  Unable to compile selector `$[ 'a' ]': Invalid array index definition “ 'a' ]”
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
  Actual output:
  ```
  [
    {
      "key": "other value",
      "some": "more"
    }
  ]
  ```

- [ ] `$..[*]`
  Input:
  ```
  {
    "key": "value",
    "another key": {
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
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Unable to compile selector `$..[*]': Missing member name or wildcard after . character
  ```

- [ ] `$[*]`
  Input:
  ```
  {}
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    {}
  ]
  ```

- [ ] `$[*]`
  Input:
  ```
  {
    "some": "string",
    "int": 42,
    "object": {
      "key": "value"
    },
    "array": [
      0,
      1
    ]
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Actual output:
  ```
  [
    {
      "array": [
        0,
        1
      ],
      "int": 42,
      "object": {
        "key": "value"
      },
      "some": "string"
    }
  ]
  ```

- [ ] `$..[1].key`
  Input:
  ```
  {
    "k": [
      {
        "key": "some value"
      },
      {
        "key": 42
      }
    ],
    "kk": [
      [
        {
          "key": 100
        },
        {
          "key": 200
        },
        {
          "key": 300
        }
      ],
      [
        {
          "key": 400
        },
        {
          "key": 500
        },
        {
          "key": 600
        }
      ]
    ],
    "key": [
      0,
      1
    ]
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [200, 42, 500]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Unable to compile selector `$..[1].key': Missing member name or wildcard after . character
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
  Unable to compile selector `$[?(@.id==42)].name': Invalid array index definition “?(@.id==42)].name”
  ```

- [ ] `$..key`
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
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Actual output:
  ```
  [
    "something",
    "top",
    "value",
    {
      "key": "russian dolls"
    }
  ]
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
  ```
  [
    "value"
  ]
  ```

- [ ] `$.*.bar.*`
  Input:
  ```
  [
    {
      "bar": [
        42
      ]
    }
  ]
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  [
    [
      {
        "bar": [
          42
        ]
      }
    ]
  ]
  ```

- [ ] `$.*.*`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      4,
      5,
      6
    ]
  ]
  ```
  Expected output:
  ```
  [1, 2, 3, 4, 5, 6]
  ```
  Actual output:
  ```
  [
    [
      [
        1,
        2,
        3
      ],
      [
        4,
        5,
        6
      ]
    ]
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  {
    "key": "value",
    "another key": {
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
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$..*`
  Input:
  ```
  [
    40,
    null,
    42
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [40, 42, null]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$.*`
  Input:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0,
      1
    ]
  ]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  [
    [
      "string",
      42,
      {
        "key": "value"
      },
      [
        0,
        1
      ]
    ]
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    []
  ]
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
  json_path_match: assertion 'path->is_compiled' failed
  Expecting value: line 2 column 1 (char 1)
  
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
  Unable to compile selector `$[?(@.key>42 && @.key<44)]': Invalid array index definition “?(@.key>42 && @.key<44)]”
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
  Unable to compile selector `$[?(@.key>43 || @.key<43)]': Invalid array index definition “?(@.key>43 || @.key<43)]”
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
  Unable to compile selector `$[?(@['key']==42)]': Invalid array index definition “?(@['key']==42)]”
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
  Unable to compile selector `$[?(@['@key']==42)]': Invalid array index definition “?(@['@key']==42)]”
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
  Unable to compile selector `$[?(@[1]=='b')]': Invalid array index definition “?(@[1]=='b')]”
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
  Unable to compile selector `$[?(@==42)]': Invalid array index definition “?(@==42)]”
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
  Unable to compile selector `$[?(@.key==43)]': Invalid array index definition “?(@.key==43)]”
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
  Unable to compile selector `$[?(@.id==2)]': Invalid array index definition “?(@.id==2)]”
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
  Unable to compile selector `$[?(@.key=="value")]': Invalid array index definition “?(@.key=="value")]”
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
  Unable to compile selector `$[?(@.key=="Motörhead")]': Invalid array index definition “?(@.key=="Motörhead")]”
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
  Unable to compile selector `$[?(@.key=="hi@example.com")]': Invalid array index definition “?(@.key=="hi@example.com")]”
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
  Unable to compile selector `$[?(@.key=="some.value")]': Invalid array index definition “?(@.key=="some.value")]”
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
  Unable to compile selector `$[?(@.key=='value')]': Invalid array index definition “?(@.key=='value')]”
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
  NOT_SUPPORTED
  ```
  Unable to compile selector `$[?(@.key>"VALUE")]': Invalid array index definition “?(@.key>"VALUE")]”
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
  Unable to compile selector `$[?(@.length == 4)]': Invalid array index definition “?(@.length == 4)]”
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
  Unable to compile selector `$[?(@.a.b==3)]': Invalid array index definition “?(@.a.b==3)]”
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
  Unable to compile selector `$[?(@.a.b.c==3)]': Invalid array index definition “?(@.a.b.c==3)]”
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
  Unable to compile selector `$[?(1==1)]': Invalid array index definition “?(1==1)]”
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
  Unable to compile selector `$.*[?(@.key)]': Invalid array index definition “?(@.key)]”
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
  []
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
  []
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
  ```
  [
    1
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
  ```
  [
    "value"
  ]
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
  ```
  []
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
  [
    "cc1"
  ]
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
  ]
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
  Unable to compile selector `$..['c','d']': Missing member name or wildcard after . character
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
  []
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
  Unable to compile selector `$[ 0 , 1 ]': Invalid array index definition “ 0 , 1 ]”
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/C_json-glib.
