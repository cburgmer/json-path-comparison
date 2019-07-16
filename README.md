# json-path-comparison
Comparison of the different implementations of JSONPath.

Our goal is to show features of [JSONPath](https://goessner.net/articles/JsonPath/)
in available libraries, and call out differences where libraries are not aligned.

See https://cburgmer.github.io/json-path-comparison/ for the table generated from the test set under [./queries](./queries).

## Features
- Comparison of queries against supported implementations
- Consensus-based decision on correctness
- Output and error report for failures
- Automatically generated bug reports
- Regression test suites for upstream implementations

## Roadmap

- Test filters `?()`
- Provide a forum to clarify different interpretations
- Compare custom features/syntax across implementations

## How to

### Regression test suite

If you are an author of an upstream implementation, you can use the report generated here to test for regressions in your logic. The regression document is generated for every implementation individually so you can handle outcomes differently depending on whether they match the consensus or not.

For example, the Clojure json-path implementation has a [regression suite based on the above](https://github.com/gga/json-path/blob/master/test/json_path/test/regression_test.clj).

## Contribute

You can easily add another library/implementation to the comparison. Copy a comparable setup in [./implementations](./implementations) and adapt. Be aware that some implementations decide to return queries for single values as scalars, compare [./implementations/Clojure_json-path](./implementations/Clojure_json-path).

Adding more tests should be fairly easy. Add a new directory under [./queries](./queries) and give it a `selector` and `document.json`
. Scalar queries have a specific handling, compare [./queries/array_index](./queries/array_index).

Run `./go` to build the table.

And last but not least, clarifying any differences and fixing bugs identified in upstream is the main goal of this comparison!
