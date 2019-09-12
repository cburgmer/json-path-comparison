Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:10]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Error:
  ```
  panic: index [to] out of range: len: 3, to: 10
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$[:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  ```
  ["first", "second", "third"]
  ```

- [ ] `$[1:3]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  ["second", "third", "forth"]
  ```

- [ ] `$[0:3:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Error:
  ```
  panic: only support one range(from, to): [0 3 2]
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$[0:3:1]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Error:
  ```
  panic: only support one range(from, to): [0 3 1]
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$[0:1]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Actual output:
  ```
  ["first", "second"]
  ```

- [ ] `$[::2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third", "fifth"]
  ```
  Error:
  ```
  panic: only support one range(from, to): [  2]
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$[?(@.key>42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}]
  ```
  Expected output:
  ```
  [{"key": 43}, {"key": 42.0001}, {"key": 100}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 0}, {"key": -1}, {"key": 41}, {"key": 41.9999}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  [{"some": "some value"}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$['key']`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  panic: strconv.Atoi: parsing "'key'": invalid syntax
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['key','another']`
  Input:
  ```
  {"key": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value", "entry"]
  ```
  Error:
  ```
  panic: strconv.Atoi: parsing "'key'": invalid syntax
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$['0']`
  Input:
  ```
  {"0": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  panic: strconv.Atoi: parsing "'0'": invalid syntax
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  panic: strconv.Atoi: parsing "\"chars'": invalid syntax
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  panic: strconv.Atoi: parsing "'*'": invalid syntax
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  Expecting value: line 1 column 1 (char 0)
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["top", "value", "something", {"key": "russian dolls"}, "russian dolls"]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95}, {"category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99}, {"category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99}, {"category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [8.95, 12.99, 8.99, 22.99, 19.95]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["value", {"complex": "string", "primitives": [0, 1]}, "string", [0, 1], 0, 1]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$..*`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, null, 42]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$[*]`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  panic: object is not Slice
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$.*`
  Input:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```

- [ ] `$.*`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Error:
  ```
  panic: expression don't support in filter
  
  goroutine 1 [running]:
  main.main()
  	/json-path-comparison/implementations/Golang_github.com-oliveagle-jsonpath/main.go:24 +0x221
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Golang_github.com-oliveagle-jsonpath.
