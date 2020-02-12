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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[1]`
  Input:
  ```
  ["one element"]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
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

- [ ] `$[4,1]`
  Input:
  ```
  [1, 2, 3, 4, 5]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Actual output:
  ```
  [2, 5]
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
  Actual output:
  ```
  {"key": 42}
  ```

- [ ] `$[?(@.key=="some.value")]`
  Input:
  ```
  [{"key": "some"}, {"key": "value"}, {"key": "some.value"}]
  ```
  Expected output:
  ```
  [{"key": "some.value"}]
  ```
  Actual output:
  ```
  {"key": "some.value"}
  ```

- [ ] `$[?(@.key=='value')]`
  Input:
  ```
  [{"key": "some"}, {"key": "value"}]
  ```
  Expected output:
  ```
  [{"key": "value"}]
  ```
  Error:
  ```
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

- [ ] `$[0]['c','d']`
  Input:
  ```
  [{"c": "cc1", "d": "dd1", "e": "ee1"}, {"c": "cc2", "d": "dd2", "e": "ee2"}]
  ```
  Expected output:
  ```
  ["cc1", "dd1"]
  ```
  Actual output:
  ```
  {"c": "cc1", "d": "dd1"}
  ```

- [ ] `$['one','three'].key`
  Input:
  ```
  {"one": {"key": "value"}, "two": {"k": "v"}, "three": {"some": "more", "key": "other value"}}
  ```
  Expected output:
  ```
  ["value", "other value"]
  ```
  Actual output:
  ```
  {"one": {"key": "value"}, "three": {"key": "other value"}}
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

- [ ] `$[*].a`
  Input:
  ```
  [{"a": 1}, {"b": 1}, {"a": 1}]
  ```
  Expected output:
  ```
  [1, 1]
  ```
  Actual output:
  ```
  [{"a": 1}, {"a": 1}]
  ```

- [ ] `$.key`
  Input:
  ```
  [0, 1]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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

- [ ] `$.id`
  Input:
  ```
  [{"id": 2}]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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

- [ ] `$.missing`
  Input:
  ```
  {"key": "value"}
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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

- [ ] `$..*`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Expecting value: line 3 column 1 (char 2)
  
  
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
  Expecting value: line 3 column 1 (char 2)
  
  
  ```

- [ ] `$[0:2][*]`
  Input:
  ```
  [[1, 2], ["a", "b"], [0, 0]]
  ```
  Expected output:
  ```
  [1, 2, "a", "b"]
  ```
  Error:
  ```
  Extra data: line 4 column 6 (char 28)
  [
          1,
          2
      ],
          "a",
          "b"
      
  ]
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
