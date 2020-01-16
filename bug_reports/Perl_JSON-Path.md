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

- [ ] `$['special:"chars']`
  Input:
  ```
  {"special:\"chars": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  ```
  []
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
  [40, null, 42]
  ```
  Actual output:
  ```
  []
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


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Perl_JSON-Path.
