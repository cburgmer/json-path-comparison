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
  Error:
  ```
  ERROR:  syntax error, unexpected INT_P at or near "2" of jsonpath input
  LINE 1: ...ry('{"a": "first", "2": "second", "b": "third"}', '$.2'))) r...
                                                               ^
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
  Expecting value: line 3 column 1 (char 3)
   
  
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
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...(jsonb_path_query('["first", "second", "third"]', '$[1:10]')...
                                                               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...(jsonb_path_query('["first", "second", "third"]', '$[-1:]'))...
                                                               ^
  ```

- [ ] `$[:]`
  Input:
  ```
  ["first", "second"]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined at or near ":" of jsonpath input
  LINE 4: ]', '$[:]'))) r;
              ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[:2]')))...
                                                               ^
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
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[1:]')))...
                                                               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[1:3]'))...
                                                               ^
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
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[0:3:2]'...
                                                               ^
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
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[0:3:1]'...
                                                               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[0:4:2]'...
                                                               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 4: ]', '$[0:0]'))) r;
              ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected $undefined, expecting ',' or ']' at or near ":" of jsonpath input
  LINE 4: ]', '$[0:1]'))) r;
              ^
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
  ERROR:  syntax error, unexpected $undefined at or near ":" of jsonpath input
  LINE 1: ...'["first", "second", "third", "forth", "fifth"]', '$[::2]'))...
                                                               ^
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
  ERROR:  syntax error, unexpected '?' at or near "?" of jsonpath input
  LINE 11: ]', '$[?(@.key==42)]'))) r;
               ^
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
  ERROR:  syntax error, unexpected '?' at or near "?" of jsonpath input
  LINE 10: ]', '$[?(@.key>42)]'))) r;
               ^
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
  ERROR:  syntax error, unexpected '?' at or near "?" of jsonpath input
  LINE 11: ]', '$[?(@.key<42)]'))) r;
               ^
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
  ERROR:  syntax error, unexpected '?' at or near "?" of jsonpath input
  LINE 4: ]', '$[?(@.key)]'))) r;
              ^
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
  ERROR:  syntax error at or near "key"
  LINE 3: }', '$['key']'))) r;
                  ^
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
  Error:
  ```
  ERROR:  syntax error at or near "one"
  LINE 5: }', '$['one','three'].key'))) r;
                  ^
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
  ERROR:  operator is not unique: unknown @ unknown
  LINE 4: }', '$['@']'))) r;
                  ^
  HINT:  Could not choose a best candidate operator. You might need to add explicit type casts.
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
  ERROR:  syntax error at or near "$"
  LINE 4: }', '$['$']'))) r;
                  ^
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
  Error:
  ```
  ERROR:  syntax error at or near "two"
  LINE 5: }', '$['two.some']'))) r;
                  ^
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
  ERROR:  syntax error at or near "0"
  LINE 3: }', '$['0']'))) r;
                  ^
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
  ERROR:  syntax error at or near "special"
  LINE 1: ...onb_path_query('{"special:\"chars":"value"}', '$['special:"c...
                                                               ^
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
  ERROR:  operator is not unique: unknown * unknown
  LINE 4: }', '$['*']'))) r;
                  ^
  HINT:  Could not choose a best candidate operator. You might need to add explicit type casts.
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
  Error:
  ```
  ERROR:  syntax error, unexpected '.' at or near "." of jsonpath input
  LINE 10: }', '$..key'))) r;
               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected '.' at or near "." of jsonpath input
  LINE 36: }', '$.store..price'))) r;
               ^
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
  Error:
  ```
  ERROR:  syntax error, unexpected '.' at or near "." of jsonpath input
  LINE 7: }', '$..*'))) r;
              ^
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
  ERROR:  syntax error, unexpected '.' at or near "." of jsonpath input
  LINE 5: ]', '$..*'))) r;
              ^
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
  [{"array": [0, 1], "int": 42, "object": {"key": "value"}, "some": "string"}]
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
  Actual output:
  ```
  ["value"]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Postgres_SQL-JSON-Path.
