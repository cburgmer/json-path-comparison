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

### Run the comparison locally

Run

    ./src/wrap_in_docker.sh ./go

Skip ./src/wrap_in_docker.sh if you don't want to run against Docker, so the
command becomes `./go`.

### One-off comparisons

You can quickly execute a query against all implementations by running:

    echo '{"a": 1}' | ./src/wrap_in_docker.sh ./src/one_off.sh '$.a'

Currently you need to make sure you've run `./src/wrap_in_docker.sh ./go` once before.
(Skip ./src/wrap_in_docker.sh if you don't want to run against Docker.)

### Regression test suite

If you are an author of an upstream implementation, you can use the report generated here to test for regressions in your logic. The regression document is generated for every implementation individually so you can handle outcomes differently depending on whether they match the consensus or not.

For example, the Clojure json-path implementation has a [regression suite based on the above](https://github.com/gga/json-path/blob/master/test/json_path/test/regression_test.clj).

## Contribute

You can easily add another library/implementation to the comparison. Copy a comparable setup in [./implementations](./implementations) and adapt. Be aware that some implementations decide to return queries for single values as scalars, compare [./implementations/Clojure_json-path](./implementations/Clojure_json-path).

Test the implementation's ninja build script via (using Clojure as an example)

    ./src/generate_ninja.sh && ninja build/test_compilation/Clojure_json-path

Test a query by running (again Clojure as example)

    ./src/query_implementation.sh queries/array_index implementations/Clojure_json-path

Adding more tests should be fairly easy. Add a new directory under [./queries](./queries) and give it a `selector` and `document.json`
. Scalar queries have a specific handling, compare [./queries/array_index](./queries/array_index).

And last but not least, clarifying any differences and fixing bugs identified in upstream is the main goal of this comparison!
