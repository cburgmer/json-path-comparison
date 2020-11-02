Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[1:3]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0:5]`
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
  ["first", "second", "third", "forth", "fifth"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:5]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[7:10]`
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
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `7:10]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[1:3]`
  Input:
  ```
  {
    ":": 42,
    "more": "string",
    "a": 1,
    "b": 2,
    "c": 3,
    "1:3": "nice"
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[1:10]`
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
  ["second", "third"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:10]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

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
  ** (Jaxon.ParseError) Expected an integer at `2:11366777`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[2:-113667776004:-1]`
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
  ** (Jaxon.ParseError) Expected an integer at `2:-1136677`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `-113667776`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[113667776004:2:-1]`
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
  ** (Jaxon.ParseError) Expected an integer at `1136677760`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-4:-5]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:-5]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-4:-4]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:-4]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-4:-3]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:-3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[3:0:-2]`
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
  ** (Jaxon.ParseError) Expected an integer at `3:0:-2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:3:-2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[7:3:-1]`
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
  ** (Jaxon.ParseError) Expected an integer at `7:3:-1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[::-2]`
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
  ** (Jaxon.ParseError) Expected an integer at `::-2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[3::-1]`
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
  ** (Jaxon.ParseError) Expected an integer at `3::-1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[:2]`
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
  ** (Jaxon.ParseError) Expected an integer at `:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `::]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[:]`
  Input:
  ```
  {
    ":": 42,
    "more": "string"
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `:2:-1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[3:-4]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `3:-4]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[3:-3]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `3:-3]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `3:-2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[2:1]`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `2:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0:0]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:0]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0:1]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  ["first"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-1:]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-1:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-2:]`
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
  ["second", "third"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-2:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[-4:]`
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
  ["first", "second", "third"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `-4:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:3:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:3:0]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:3:1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `010:024:01`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `0:4:2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:3:]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ** (Jaxon.ParseError) Expected an integer at `::2]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['key']`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'key']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ```
  [
    "first"
  ]
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
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'missing']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['ü']`
  Input:
  ```
  {
    "u\u0308": 42
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'ü']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['two.some']`
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
    "two.some": "42"
  }
  ```
  Expected output:
  ```
  ["42"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'two.some'`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `"key"]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['']`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `""]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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

- [ ] `$[-1]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Unexpected a closing bracket, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Unexpected string, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[':']`
  Input:
  ```
  {
    ":": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `':']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[']']`
  Input:
  ```
  {
    "]": 42
  }
  ```
  Expected output:
  ```
  [42]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `']']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['@']`
  Input:
  ```
  {
    "@": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'@']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['.']`
  Input:
  ```
  {
    ".": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'.']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['.*']`
  Input:
  ```
  {
    "key": 42,
    ".*": 1,
    "": 10
  }
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'.*']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['"']`
  Input:
  ```
  {
    "\"": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'"']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['\\']`
  Input:
  ```
  {
    "\\": "value"
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'\\']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['\'']`
  Input:
  ```
  {
    "'": "value"
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'\'']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['0']`
  Input:
  ```
  {
    "0": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'0']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['$']`
  Input:
  ```
  {
    "$": "value",
    "another": "entry"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'$']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[':@."$,*\'\\']`
  Input:
  ```
  {
    ":@.\"$,*'\\": 42
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `':@."$,*\'`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'single'qu`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ["value"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `',']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'*']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "another": "entry"
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'*']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$['ni.*']`
  Input:
  ```
  {
    "nice": 42,
    "ni.*": 1,
    "mice": 100
  }
  ```
  Expected output:
  ```
  [1]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'ni.*']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'two'.'som`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[two.some]`
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
    "two.some": "42"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `two.some]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0:2][*]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      "a",
      "b"
    ],
    [
      0,
      0
    ]
  ]
  ```
  Expected output:
  ```
  [1, 2, "a", "b"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:2][*]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ```
  []
  ```

- [ ] `$[*]`
  Input:
  ```
  []
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Unexpected a closing bracket, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  []
  ```

- [ ] `$[key]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `key]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.['key']`
  Input:
  ```
  {
    "key": "value",
    "other": {
      "key": [
        {
          "key": 42
        }
      ]
    }
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'key']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.["key"]`
  Input:
  ```
  {
    "key": "value",
    "other": {
      "key": [
        {
          "key": 42
        }
      ]
    }
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `"key"]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.[key]`
  Input:
  ```
  {
    "key": "value",
    "other": {
      "key": [
        {
          "key": 42
        }
      ]
    }
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `key]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0:2].key`
  Input:
  ```
  [
    {
      "key": "ey"
    },
    {
      "key": "bee"
    },
    {
      "key": "see"
    }
  ]
  ```
  Expected output:
  ```
  ["ey", "bee"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0:2].key`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  ```
  []
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.id==42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
    "top"
  ]
  ```

- [ ] `$.store..price`
  Input:
  ```
  {
    "store": {
      "book": [
        {
          "category": "reference",
          "author": "Nigel Rees",
          "title": "Sayings of the Century",
          "price": 8.95
        },
        {
          "category": "fiction",
          "author": "Evelyn Waugh",
          "title": "Sword of Honour",
          "price": 12.99
        },
        {
          "category": "fiction",
          "author": "Herman Melville",
          "title": "Moby Dick",
          "isbn": "0-553-21311-3",
          "price": 8.99
        },
        {
          "category": "fiction",
          "author": "J. R. R. Tolkien",
          "title": "The Lord of the Rings",
          "isbn": "0-395-19395-8",
          "price": 22.99
        }
      ],
      "bicycle": {
        "color": "red",
        "price": 19.95
      }
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [12.99, 19.95, 22.99, 8.95, 8.99]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[0,2].key`
  Input:
  ```
  [
    {
      "key": "ey"
    },
    {
      "key": "bee"
    },
    {
      "key": "see"
    }
  ]
  ```
  Expected output:
  ```
  ["ey", "see"]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0,2].key`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'one','thr`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.`
  Input:
  ```
  {
    "key": 42,
    "": 9001,
    "''": "nice"
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
      "": 9001,
      "''": "nice",
      "key": 42
    }
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
  42
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  []
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Unexpected number, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Unexpected a closing bracket, expected a string, number, object, array instead.
      lib/jaxon/stream.ex:60: Jaxon.Stream.call_decode_fun/4
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.*`
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
  []
  ```

- [ ] `$..*[?(@.id>2)]`
  Input:
  ```
  [
    {
      "complext": {
        "one": [
          {
            "name": "first",
            "id": 1
          },
          {
            "name": "next",
            "id": 2
          },
          {
            "name": "another",
            "id": 3
          },
          {
            "name": "more",
            "id": 4
          }
        ],
        "more": {
          "name": "next to last",
          "id": 5
        }
      }
    },
    {
      "name": "last",
      "id": 6
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.id>2)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$..[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2,
    "more": [
      {
        "id": 2
      },
      {
        "more": {
          "id": 2
        }
      },
      {
        "id": {
          "id": 2
        }
      },
      [
        {
          "id": 2
        }
      ]
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.id==2)`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  {
    "key": 42,
    "another": {
      "key": 1
    }
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key+50==100)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key+50": 100
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key+50`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>0 && false)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>0 `
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>0 && true)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>0 `
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>43`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>0 || false)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>0 `
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>0 || true)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 3
    },
    {
      "key": "nice"
    },
    {
      "key": true
    },
    {
      "key": null
    },
    {
      "key": false
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": -1
    },
    {
      "key": 0
    },
    {
      "key": ""
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>0 `
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@['key']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@['@key'`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[-1]==2)]`
  Input:
  ```
  [
    [
      2,
      3
    ],
    [
      "a"
    ],
    [
      0,
      2
    ],
    [
      2
    ]
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[-1]==2`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[1]=='b`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[1]=='b')]`
  Input:
  ```
  {
    "1": [
      "a",
      "b"
    ],
    "2": [
      "x",
      "y"
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[1]=='b`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@)]`
  Input:
  ```
  [
    "some value",
    null,
    "value",
    0,
    1,
    -1,
    "",
    [],
    {},
    false,
    true
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.a && (@.b || @.c))]`
  Input:
  ```
  [
    {
      "a": true
    },
    {
      "a": true,
      "b": true
    },
    {
      "a": true,
      "b": true,
      "c": true
    },
    {
      "b": true,
      "c": true
    },
    {
      "a": true,
      "c": true
    },
    {
      "c": true
    },
    {
      "b": true
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.a && (`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.a && @.b || @.c)]`
  Input:
  ```
  [
    {
      "a": true,
      "b": true
    },
    {
      "a": true,
      "b": true,
      "c": true
    },
    {
      "b": true,
      "c": true
    },
    {
      "a": true,
      "c": true
    },
    {
      "a": true
    },
    {
      "b": true
    },
    {
      "c": true
    },
    {
      "d": true
    },
    {}
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.a && @`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key/10==5)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key/10": 5
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key/10`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?()]`
  Input:
  ```
  [
    1,
    {
      "key": 42
    },
    "value",
    null
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?()]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==42)]`
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
      "key": 1
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
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
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
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.d==["v1","v2"])]`
  Input:
  ```
  [
    {
      "d": [
        "v1",
        "v2"
      ]
    },
    {
      "d": [
        "a",
        "b"
      ]
    },
    {
      "d": "v1"
    },
    {
      "d": "v2"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "['v1','v2']"
    },
    {
      "d": "['v1', 'v2']"
    },
    {
      "d": "v1,v2"
    },
    {
      "d": "[\"v1\", \"v2\"]"
    },
    {
      "d": "[\"v1\",\"v2\"]"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.d==["v`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[0:1]==[1])]`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      1
    ],
    [
      2,
      3
    ],
    1,
    2
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[0:1]==`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.*==[1,2])]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      2,
      3
    ],
    [
      1
    ],
    [
      2
    ],
    [
      1,
      2,
      3
    ],
    1,
    2,
    3
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.*==[1,`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.d==['v1','v2'])]`
  Input:
  ```
  [
    {
      "d": [
        "v1",
        "v2"
      ]
    },
    {
      "d": [
        "a",
        "b"
      ]
    },
    {
      "d": "v1"
    },
    {
      "d": "v2"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "['v1','v2']"
    },
    {
      "d": "['v1', 'v2']"
    },
    {
      "d": "v1,v2"
    },
    {
      "d": "[\"v1\", \"v2\"]"
    },
    {
      "d": "[\"v1\",\"v2\"]"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.d==['v`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?((@.key<44)==false)]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?((@.key<4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==false)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
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
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==f`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==null)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
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
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==n`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[0:1]==1)]`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      1
    ],
    [
      2,
      3
    ],
    1,
    2
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[0:1]==`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[*]==2)]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      2,
      3
    ],
    [
      1
    ],
    [
      2
    ],
    [
      1,
      2,
      3
    ],
    1,
    2,
    3
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[*]==2)`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.*==2)]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      2,
      3
    ],
    [
      1
    ],
    [
      2
    ],
    [
      1,
      2,
      3
    ],
    1,
    2,
    3
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.*==2)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==-0.123e2)]`
  Input:
  ```
  [
    {
      "key": -12.3
    },
    {
      "key": -0.123
    },
    {
      "key": -12
    },
    {
      "key": 12.3
    },
    {
      "key": 2
    },
    {
      "key": "-0.123e2"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==-`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==010)]`
  Input:
  ```
  [
    {
      "key": "010"
    },
    {
      "key": "10"
    },
    {
      "key": 10
    },
    {
      "key": 0
    },
    {
      "key": 8
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==0`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.d=={"k":"v"})]`
  Input:
  ```
  [
    {
      "d": {
        "k": "v"
      }
    },
    {
      "d": {
        "a": "b"
      }
    },
    {
      "d": "k"
    },
    {
      "d": "v"
    },
    {
      "d": {}
    },
    {
      "d": []
    },
    {
      "d": null
    },
    {
      "d": -1
    },
    {
      "d": 0
    },
    {
      "d": 1
    },
    {
      "d": "[object Object]"
    },
    {
      "d": "{\"k\": \"v\"}"
    },
    {
      "d": "{\"k\":\"v\"}"
    },
    "v"
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.d=={"k`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@==42)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==42)]`
  Input:
  ```
  {
    "a": {
      "key": 0
    },
    "b": {
      "key": 42
    },
    "c": {
      "key": -1
    },
    "d": {
      "key": 41
    },
    "e": {
      "key": 43
    },
    "f": {
      "key": 42.0001
    },
    "g": {
      "key": 41.9999
    },
    "h": {
      "key": 100
    },
    "i": {
      "some": "value"
    }
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.id==2)]`
  Input:
  ```
  {
    "id": 2
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.id==2)`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=="`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=="`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=="`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=='`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key==true)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
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
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==t`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.items[?(@.key==$.value)]`
  Input:
  ```
  {
    "value": 42,
    "items": [
      {
        "key": 10
      },
      {
        "key": 42
      },
      {
        "key": 50
      }
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key==$`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>42)]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key>=42)]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key>=4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.d in [2, 3])]`
  Input:
  ```
  [
    {
      "d": 1
    },
    {
      "d": 2
    },
    {
      "d": 1
    },
    {
      "d": 3
    },
    {
      "d": 4
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.d in [`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(2 in @.d)]`
  Input:
  ```
  [
    {
      "d": [
        1,
        2,
        3
      ]
    },
    {
      "d": [
        2
      ]
    },
    {
      "d": [
        1
      ]
    },
    {
      "d": [
        3,
        4
      ]
    },
    {
      "d": [
        4,
        2
      ]
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(2 in @.d`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key<42)]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key<42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key<=42)]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key<=4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key*2==100)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key*2": 100
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key*2=`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(!(@.key==42))]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(!(@.key=`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(!(@.key<42))]`
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
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(!(@.key<`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key!=42)]`
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
      "key": 1
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
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
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
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key!=4`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.name=~/hello.*/)]`
  Input:
  ```
  [
    {
      "name": "hullo world"
    },
    {
      "name": "hello world"
    },
    {
      "name": "yes hello world"
    },
    {
      "name": "HELLO WORLD"
    },
    {
      "name": "good bye"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.name=~`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@[*]>=4)]`
  Input:
  ```
  [
    [
      1,
      2
    ],
    [
      3,
      4
    ],
    [
      5,
      6
    ]
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[*]>=4)`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.x[?(@[*]>=$.y[*])]`
  Input:
  ```
  {
    "x": [
      [
        1,
        2
      ],
      [
        3,
        4
      ],
      [
        5,
        6
      ]
    ],
    "y": [
      3,
      4,
      5
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@[*]>=$.`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key=42)]`
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
      "key": 1
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
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
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
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key=42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.a[?(@.price>10)])]`
  Input:
  ```
  [
    {
      "a": [
        {
          "price": 1
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": [
        {
          "price": 11
        }
      ]
    },
    {
      "a": [
        {
          "price": 8
        },
        {
          "price": 12
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.a[?(@.`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.address.city=='Berlin')]`
  Input:
  ```
  [
    {
      "address": {
        "city": "Berlin"
      }
    },
    {
      "address": {
        "city": "London"
      }
    }
  ]
  ```
  Expected output:
  ```
  [{"address": {"city": "Berlin"}}]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.addres`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key-50==-100)]`
  Input:
  ```
  [
    {
      "key": 60
    },
    {
      "key": 50
    },
    {
      "key": 10
    },
    {
      "key": -50
    },
    {
      "key-50": -100
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key-50`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(1==1)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key===42)]`
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
      "key": 1
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
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
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
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key===`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
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
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$..[?(@.id)]`
  Input:
  ```
  {
    "id": 2,
    "more": [
      {
        "id": 2
      },
      {
        "more": {
          "id": 2
        }
      },
      {
        "id": {
          "id": 2
        }
      },
      [
        {
          "id": 2
        }
      ]
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.id)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(false)]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(false)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@..child)]`
  Input:
  ```
  [
    {
      "key": [
        {
          "child": 1
        },
        {
          "child": 2
        }
      ]
    },
    {
      "key": [
        {
          "child": 2
        }
      ]
    },
    {
      "key": [
        {}
      ]
    },
    {
      "key": [
        {
          "something": 42
        }
      ]
    },
    {}
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@..child`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(null)]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(null)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(true)]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(true)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?@.key==42]`
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
      "key": 1
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
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
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
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?@.key==42`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(!@.key)]`
  Input:
  ```
  [
    {
      "some": "some value"
    },
    {
      "key": true
    },
    {
      "key": false
    },
    {
      "key": null
    },
    {
      "key": "value"
    },
    {
      "key": ""
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
      "key": 42
    },
    {
      "key": {}
    },
    {
      "key": []
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(!@.key)]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$(key,more)`
  Input:
  ```
  {
    "key": 1,
    "some": 2,
    "more": 3
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

- [ ] `$[(@.length-1)]`
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
  ** (Jaxon.ParseError) Expected an integer at `(@.length-`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[0,1]`
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0,1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[?(@.key<3),?(@.key>6)]`
  Input:
  ```
  [
    {
      "key": 1
    },
    {
      "key": 8
    },
    {
      "key": 3
    },
    {
      "key": 10
    },
    {
      "key": 7
    },
    {
      "key": 2
    },
    {
      "key": 6
    },
    {
      "key": 4
    }
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `?(@.key<3)`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'key','ano`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `:]['c','d'`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  []
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'c','d']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'c','d']`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `'missing',`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[4,1]`
  Input:
  ```
  [
    1,
    2,
    3,
    4,
    5
  ]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `4,1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$.*[0,:5]`
  Input:
  ```
  {
    "a": [
      "string",
      null,
      true
    ],
    "b": [
      false,
      "string",
      5.4
    ]
  }
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `0,:5]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[1:3,4]`
  Input:
  ```
  [
    1,
    2,
    3,
    4,
    5
  ]
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `1:3,4]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
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
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at ` 0 , 1 ]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```

- [ ] `$[*,1]`
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
  NOT_SUPPORTED
  ```
  Error:
  ```
  ** (Jaxon.ParseError) Expected an integer at `*,1]`
      lib/jaxon/path.ex:79: Jaxon.Path.parse!/1
      lib/jsonpath.ex:8: Mix.Tasks.Execute.run/1
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Elixir_jaxon.
