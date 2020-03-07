Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

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
  Assertion (":" is not an operator) failed!
   at build/lib/perl5/Carp/Assert.pm line 282, <STDIN> line 4.
  	Carp::Assert::assert(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 217
  	JSON::Path::Evaluator::_evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 122
  	JSON::Path::Evaluator::evaluate(...) called at build/lib/perl5/JSON/Path/Evaluator.pm line 97
  	JSON::Path::Evaluator::evaluate_jsonpath(...) called at build/lib/perl5/JSON/Path.pm line 107
  	JSON::Path::values(...) called at main.pl line 11
  ```

- [ ] `$[-2:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  ["second", "third", "first", "second", "third"]
  ```

- [ ] `$[-4:]`
  Input:
  ```
  ["first", "second", "third"]
  ```
  Expected output:
  ```
  ["first", "second", "third"]
  ```
  Actual output:
  ```
  ["first", "second", "third", "first", "second", "third"]
  ```

- [ ] `$..[0]`
  Input:
  ```
  ["first", {"key": ["first nested", {"more": [{"nested": ["deepest", "second"]}, ["more", "values"]]}]}]
  ```
  Expected output:
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[':']`
  Input:
  ```
  {":": "value", "another": "entry"}
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
  {".": "value", "another": "entry"}
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
  {"\"": "value", "another": "entry"}
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
  {"$": "value", "another": "entry"}
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

- [ ] `$[',']`
  Input:
  ```
  {",": "value", "another": "entry"}
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
  {"*": "value", "another": "entry"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  ["value", "entry"]
  ```

- [ ] `$[?(@.id==42)].name`
  Input:
  ```
  [{"id": 42, "name": "forty-two"}, {"id": 1, "name": "one"}]
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
  {"one": {"key": "value"}, "two": {"k": "v"}, "three": {"some": "more", "key": "other value"}}
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
  []
  ```

- [ ] `$..*`
  Input:
  ```
  [40, null, 42]
  ```
  Expected output:
  ```
  [40, 42, null]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[?(@['key']==42)]`
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
  non-safe evaluation, died at main.pl line 11.
  ```

- [ ] `$[?(@[1]=='b')]`
  Input:
  ```
  [["a", "b"], ["x", "y"]]
  ```
  Expected output:
  ```
  [["a", "b"]]
  ```
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  Error:
  ```
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  non-safe evaluation, died at main.pl line 11.
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
  Actual output:
  ```
  [""]
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
  []
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Perl_JSON-Path.
