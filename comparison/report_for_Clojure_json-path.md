Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://github.com/cburgmer/json-path-comparison/tree/master/comparison):

- [ ] `$.book[0,1]`
  Input:
  ```
  { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ] }
  ```
  Expected output
  ```
  [ { "author": "Nigel Rees", "category": "reference", "price": 8.95, "title": "Sayings of the Century" }, { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" } ]
  ```
  Actual output
  ```
  { "author": "Nigel Rees", "category": "reference", "price": 8.95, "title": "Sayings of the Century" }
  ```

- [ ] `$.book[1:3]`
  Input:
  ```
  { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ] }
  ```
  Expected output
  ```
  [ { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }, { "author": "Herman Melville", "category": "fiction", "isbn": "0-553-21311-3", "price": 8.99, "title": "Moby Dick" } ]
  ```
  Actual output
  ```
  { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }
  ```

- [ ] `$.book[1:]`
  Input:
  ```
  { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ] }
  ```
  Expected output
  ```
  [ { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }, { "author": "Herman Melville", "category": "fiction", "isbn": "0-553-21311-3", "price": 8.99, "title": "Moby Dick" }, { "author": "J. R. R. Tolkien", "category": "fiction", "isbn": "0-395-19395-8", "price": 22.99, "title": "The Lord of the Rings" } ]
  ```
  Actual output
  ```
  { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }
  ```

- [ ] `$.book[:2]`
  Input:
  ```
  { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ] }
  ```
  Expected output
  ```
  [ { "author": "Nigel Rees", "category": "reference", "price": 8.95, "title": "Sayings of the Century" }, { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" } ]
  ```
  Actual output
  ```
  { "author": "Herman Melville", "category": "fiction", "isbn": "0-553-21311-3", "price": 8.99, "title": "Moby Dick" }
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
  [ "string", 42, { "key": "value" }, 0, 1 ]
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
  [ "string", 42, { "key": "value" }, 0, 1 ]
  ```

- [ ] `$.store.*`
  Input:
  ```
  { "store": { "book": [ { "category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95 }, { "category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99 }, { "category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99 }, { "category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99 } ], "bicycle": { "color": "red", "price": 19.95 } } }
  ```
  Expected output
  ```
  [ [ { "author": "Nigel Rees", "category": "reference", "price": 8.95, "title": "Sayings of the Century" }, { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }, { "author": "Herman Melville", "category": "fiction", "isbn": "0-553-21311-3", "price": 8.99, "title": "Moby Dick" }, { "author": "J. R. R. Tolkien", "category": "fiction", "isbn": "0-395-19395-8", "price": 22.99, "title": "The Lord of the Rings" } ], { "color": "red", "price": 19.95 } ]
  ```
  Actual output
  ```
  [ { "author": "Nigel Rees", "category": "reference", "price": 8.95, "title": "Sayings of the Century" }, { "author": "Evelyn Waugh", "category": "fiction", "price": 12.99, "title": "Sword of Honour" }, { "author": "Herman Melville", "category": "fiction", "isbn": "0-553-21311-3", "price": 8.99, "title": "Moby Dick" }, { "author": "J. R. R. Tolkien", "category": "fiction", "isbn": "0-395-19395-8", "price": 22.99, "title": "The Lord of the Rings" }, { "color": "red", "price": 19.95 } ]
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

