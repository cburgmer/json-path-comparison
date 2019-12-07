# json-path-comparison
Comparison of the different implementations of JSONPath.

Our goal is to show features of
[JSONPath](https://goessner.net/articles/JsonPath/) in available libraries,
and call out differences where libraries are not aligned.

See https://cburgmer.github.io/json-path-comparison/ for the table generated
from the queries in [./queries](./queries).

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

This will take a while and some network bandwidth to install all Docker
dependencies and build all implementations.
Skip ./src/wrap_in_docker.sh if you don't want to run against Docker, so the
command becomes `./go`.

### One-off comparisons

You can quickly execute a query against all implementations by running:

    echo '{"a": 1}' | ./src/wrap_in_docker.sh ./src/one_off.sh '$.a'

(Skip ./src/wrap_in_docker.sh if you don't want to run against Docker.)

### Regression test suite

If you are an author of an upstream implementation, you can use the report
generated here to test for regressions in your logic. The regression document is
generated for every implementation individually so you can handle outcomes
differently depending on whether they match the consensus or not.

For example, the Clojure json-path implementation has a
[regression suite based on the above](https://github.com/gga/json-path/blob/master/test/json_path/test/regression_test.clj).

## Contribute

### Add an implementation

You can easily add another implementation to the comparison. Copy a comparable
setup in [./implementations](./implementations) and adapt. Be aware that some
implementations decide to return queries for single values as scalars, compare
[./implementations/Clojure_json-path](./implementations/Clojure_json-path).

Test the implementation's ninja build script via (using Clojure as an example)

    ninja -f implementations/Clojure_json-path/build.ninja

Test a query by running (again Clojure as example)

    ./src/query_implementation.sh queries/array_index implementations/Clojure_json-path

### Add a new query

Adding more queries should be fairly easy. Add a new directory under
[./queries](./queries) and give it a `selector` and `document.json`.
Scalar queries have a specific handling, compare
[./queries/array_index](./queries/array_index).

Test a query against an implementation (Goessner's JavaScript as example)

    ./src/query_implementation.sh queries/THE_NEW_QUERY implementations/JavaScript_Goessner

See above "One-off comparisons" to execute against all implementations.

### Upgrade an implementation

Some implementations can be automatically upgraded
(Golang_github.com-bhmj-jsonslice as an example):

    ./implementations/Golang_github.com-bhmj-jsonslice/upgrade.sh
    ./src/wrap_in_docker.sh ./go
