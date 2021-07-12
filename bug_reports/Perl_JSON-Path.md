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
  timeout: sending signal TERM to command ‘perl’
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
  timeout: sending signal TERM to command ‘perl’
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
    "nice",
    2
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
    "nice",
    2,
    "a"
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
    "nice",
    2,
    "a",
    4
  ]
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
  Assertion (":" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
  ```

- [ ] `$[:]`
  Input:
  ```
  {
    ":": 42,
    "more": "string"
  }
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Assertion (":" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 1.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Actual output:
  ```
  [
    "second",
    "third",
    "first",
    "second",
    "third"
  ]
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
  Actual output:
  ```
  [
    "first",
    "second",
    "third",
    "first",
    "second",
    "third"
  ]
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
  Illegal modulus zero at build/lib/perl5/JSON/Path/Evaluator.pm line 411, <STDIN> line 1.
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
  []
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
  Assertion ("]" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 1.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
  ```

- [ ] `$[0]`
  Input:
  ```
  {
    "0": "value"
  }
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    "value"
  ]
  ```

- [ ] `$[0]`
  Input:
  ```
  "Hello World"
  ```
  Expected output:
  ```
  []
  ```
  Error:
  ```
  Unable to decode Hello World as JSON: malformed JSON string, neither array, object, number, string or atom, at character offset 0 (before "Hello World") at build/lib/perl5/JSON/Path/Evaluator.pm line 81.
   at build/lib/perl5/JSON/Path/Evaluator.pm line 79.
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
  Assertion (":" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("]" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 1.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("@" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("." is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("]" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("$" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Assertion ("," is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  ```
  []
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
  []
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
  Actual output:
  ```
  []
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

- [ ] `$[key]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    "value"
  ]
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
  Actual output:
  ```
  [
    "value"
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
  non-safe evaluation, died at main.pl line 11.
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
  Assertion ("]" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 5.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 225
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
    ""
  ]
  ```

- [ ] `$.$`
  Input:
  ```
  {
    "$": "value"
  }
  ```
  Error:
  ```
  Assertion ("$" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 3.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
  ```

- [ ] `$.屬性`
  Input:
  ```
  {
    "\u5c6c\u6027": "value"
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

- [ ] `$a`
  Input:
  ```
  {
    "a": 1,
    "$a": 2
  }
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Actual output:
  ```
  [
    1
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
  Missing required argument 'expression' in constructor at build/lib/perl5/JSON/Path.pm line 107.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$[?(@.key-dash == 'value')]`
  Input:
  ```
  [
    {
      "key-dash": "value"
    }
  ]
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$[?(@.2 == 'second')]`
  Input:
  ```
  [
    {
      "a": "first",
      "2": "second",
      "b": "third"
    }
  ]
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$.items[?(@.key1==@.key2)]`
  Input:
  ```
  {
    "items": [
      {
        "key1": 10,
        "key2": 10
      },
      {
        "key1": 42,
        "key2": 50
      }
    ]
  }
  ```
  Expected output:
  ```
  [{"key1": 10, "key2": 10}]
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$[*].bookmarks[?(@.page == 45)]^^^`
  Input:
  ```
  [
    {
      "title": "Sayings of the Century",
      "bookmarks": [
        {
          "page": 40
        }
      ]
    },
    {
      "title": "Sword of Honour",
      "bookmarks": [
        {
          "page": 35
        },
        {
          "page": 45
        }
      ]
    },
    {
      "title": "Moby Dick",
      "bookmarks": [
        {
          "page": 3035
        },
        {
          "page": 45
        }
      ]
    }
  ]
  ```
  Expected output:
  ```
  NOT_SUPPORTED
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$[?(@.name=~/@.pattern/)]`
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
    },
    {
      "pattern": "hello.*"
    }
  ]
  ```
  Error:
  ```
  timeout: sending signal TERM to command ‘perl’
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  Actual output:
  ```
  []
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
  non-safe evaluation, died at main.pl line 11.
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

- [ ] `$`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": [
        "a",
        1
      ]
    }
  }
  ```
  Expected output:
  ```
  [{"another key": {"complex": ["a", 1]}, "key": "value"}]
  ```
  Actual output:
  ```
  [
    ""
  ]
  ```

- [ ] `$`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$`
  Input:
  ```
  false
  ```
  Expected output:
  ```
  [false]
  ```
  Error:
  ```
  Missing required argument 'root' in constructor at build/lib/perl5/JSON/Path.pm line 107.
  ```

- [ ] `$`
  Input:
  ```
  true
  ```
  Expected output:
  ```
  [true]
  ```
  Actual output:
  ```
  [
    ""
  ]
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
  Assertion ("[(" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 1.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  non-safe evaluation, died at main.pl line 11.
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
  []
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
  Assertion (":" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 1.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
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
  Expected output:
  ```
  ["cc1", "dd1", "cc2", "dd2"]
  ```
  Actual output:
  ```
  []
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
  Actual output:
  ```
  [
    "second"
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Perl_JSON-Path.
