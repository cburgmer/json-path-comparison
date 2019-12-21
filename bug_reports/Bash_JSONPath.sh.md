Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$.2`
  Input:
  ```
  {"a": "first", "2": "second", "b": "third"}
  ```
  Expected output:
  ```
  ["second"]
  ```
  Actual output:
  ```
  {"2": "second"}
  ```

- [ ] `$[-1]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

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
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[-1:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Actual output:
  ```
  ["first", "second", "third"]
  ```

- [ ] `$[1:]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["second", "third", "forth", "fifth"]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  ["first", "second", "third", "forth", "fifth"]
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
  Actual output:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```

- [ ] `$[0:4:2]`
  Input:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```
  Expected output:
  ```
  ["first", "third"]
  ```
  Actual output:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```

- [ ] `$[0:0]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  []
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
  Actual output:
  ```
  ["first", "second", "third", "forth", "fifth"]
  ```

- [ ] `$[?(@.key==42)]`
  Input:
  ```
  [{"key": 0}, {"key": 42}, {"key": -1}, {"key": 41}, {"key": 43}, {"key": 42.0001}, {"key": 41.9999}, {"key": 100}, {"some": "value"}]
  ```
  Expected output:
  ```
  [{"key": 42}]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Actual output:
  ```
  {"key": "value"}
  ```

- [ ] `$['@']`
  Input:
  ```
  {"@": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['$']`
  Input:
  ```
  {"$": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['two.some']`
  Input:
  ```
  {"one": {"key": "value"}, "two": {"some": "more", "key": "other value"}, "two.some": "42"}
  ```
  Expected output:
  ```
  ["42"]
  ```
  Actual output:
  ```
  {"two.some": "42"}
  ```

- [ ] `$["key"]`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  {"key": "value"}
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
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
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
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$['*']`
  Input:
  ```
  {"*": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$.key`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  {"key": "value"}
  ```

- [ ] `$.key`
  Input:
  ```
  {"key": ["first", "second"]}
  ```
  Expected output:
  ```
  [["first", "second"]]
  ```
  Actual output:
  ```
  ["first", "second"]
  ```

- [ ] `$.key`
  Input:
  ```
  {"key": null}
  ```
  Expected output:
  ```
  [null]
  ```
  Actual output:
  ```
  {"key": null}
  ```

- [ ] `$..key`
  Input:
  ```
  {"object": {"key": "value", "array": [{"key": "something"}, {"key": {"key": "russian dolls"}}]}, "key": "top"}
  ```
  Expected output:
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Actual output:
  ```
  {"key": "top", "object": {"array": [{"key": "something"}, {"key": {"key": "russian dolls"}}], "key": "value"}}
  ```

- [ ] `$.store..price`
  Input:
  ```
  {"store": {"book": [{"category": "reference", "author": "Nigel Rees", "title": "Sayings of the Century", "price": 8.95}, {"category": "fiction", "author": "Evelyn Waugh", "title": "Sword of Honour", "price": 12.99}, {"category": "fiction", "author": "Herman Melville", "title": "Moby Dick", "isbn": "0-553-21311-3", "price": 8.99}, {"category": "fiction", "author": "J. R. R. Tolkien", "title": "The Lord of the Rings", "isbn": "0-395-19395-8", "price": 22.99}], "bicycle": {"color": "red", "price": 19.95}}}
  ```
  Expected output:
  ```
  [12.99, 19.95, 22.99, 8.95, 8.99]
  ```
  Actual output:
  ```
  {"bicycle": {"price": 19.95}, "book": [{"price": 8.95}, {"price": 12.99}, {"price": 8.99}, {"price": 22.99}]}
  ```

- [ ] `$..*`
  Input:
  ```
  {"key": "value", "another key": {"complex": "string", "primitives": [0, 1]}}
  ```
  Expected output:
  ```
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  ```
  {"another key": {"complex": "string", "primitives": [0, 1]}, "key": "value"}
  ```

- [ ] `$`
  Input:
  ```
  {"key": "value", "another key": {"complex": ["a", 1]}}
  ```
  Expected output:
  ```
  [{"another key": {"complex": ["a", 1]}, "key": "value"}]
  ```
  Error:
  ```
  sed: bad regex '\[(([0-9]+|"[^"]+")[],]){9999}(.*)': Invalid contents of {}
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[*]`
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
  Extra data: line 4 column 6 (char 28)
  [
      "string",
      42
      ],
      {
          "key":"value"
      },
          0,
          1
      }
  ]
  ```

- [ ] `$[*]`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Actual output:
  ```
  {"array": [0, 1], "int": 42, "object": {"key": "value"}, "some": "string"}
  ```

- [ ] `$[*].bar[*].baz`
  Input:
  ```
  [{"bar": [{"baz": "hello"}]}]
  ```
  Expected output:
  ```
  ["hello"]
  ```
  Actual output:
  ```
  {"baz": "hello"}
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
  Extra data: line 4 column 6 (char 28)
  [
      "string",
      42
      ],
      {
          "key":"value"
      },
          0,
          1
      }
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  {"some": "string", "int": 42, "object": {"key": "value"}, "array": [0, 1]}
  ```
  Expected output:
  ```
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Actual output:
  ```
  {"array": [0, 1], "int": 42, "object": {"key": "value"}, "some": "string"}
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Bash_JSONPath.sh.
