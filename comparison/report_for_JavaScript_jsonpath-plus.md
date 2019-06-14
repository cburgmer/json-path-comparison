Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://github.com/cburgmer/json-path-comparison/tree/master/comparison):

- [ ] `$.array`
  Input:
  ```
  { "array": ["first", "second"] }
  ```
  Expected output
  ```
  [ "first", "second" ]
  ```
  Actual output
  ```
  [ [ "first", "second" ] ]
  ```

- [ ] `$.book[-1:]`
  Input:
  ```
  { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ] }
  ```
  Expected output
  ```
  [ { "author": "J. R. R. Tolkien", "category": "fiction", "isbn": "0-395-19395-8", "price": 22.99, "title": "The Lord of the Rings" } ]
  ```
  Actual output
  ```
  { "author": "J. R. R. Tolkien", "category": "fiction", "isbn": "0-395-19395-8", "price": 22.99, "title": "The Lord of the Rings" }
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

