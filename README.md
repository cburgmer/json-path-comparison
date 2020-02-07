# json-path-comparison
Comparison of the different implementations of JSONPath and language agnostic test suite.

Our goal is to show features of
[JSONPath](https://goessner.net/articles/JsonPath/) in available libraries,
and support library authors to align on differences in their implementations.

See https://cburgmer.github.io/json-path-comparison/ for the table generated
from the queries in [./queries](./queries).

## Features
- Comparison of queries against supported implementations
- Consensus-based decision on correctness
- Output and error report for failures
- Automatically generated bug reports
- A [regression test suite](./regression_suite/regression_suite.yaml) for upstream implementations

## Roadmap

- More tests
  - Operators
  - Precedence of operators (see https://github.com/danielaparker/jsoncons/issues/110)
- Provide a forum to clarify different interpretations.
  See [OPEN_QUESTIONS.md](OPEN_QUESTIONS.md) for a rough start on visible
  disagreements.
- Compare custom features/syntax across implementations

## How to

### (Re-)Run the comparison locally

To update the reports checked into Git under ./docs and others, run:

    ./src/wrap_in_docker.sh ninja
    open docs/index.html

This will take a while and some network bandwidth to install all Docker
dependencies and build all implementations.
Skip ./src/wrap_in_docker.sh if you don't want to run against Docker, so the
command becomes `ninja`.

### One-off comparisons

You can quickly execute a query against all implementations by running:

    echo '{"a": 1}' | ./src/wrap_in_docker.sh ./src/one_off.sh '$.a'

(Skip ./src/wrap_in_docker.sh if you don't want to run against Docker.)

### Regression test suite

If you are an author of an upstream implementation, you can use the report
generated here to test for regressions in your logic. The
[regression_suite/regression_suite.yaml](./regression_suite/regression_suite.yaml) holds
all queries and includes a consensus where one exists. Additionally
a report is generated for every implementation which contains current results
for queries where the consensus isn't matched or no consensus exists (see
e.g. [regression_suite/Clojure_json-path.yaml](./regression_suite/Clojure_json-path.yaml)).

See for example the [Clojure json-path regression test](https://github.com/gga/json-path/blob/master/test/json_path/test/regression_test.clj)
on how those files can be put to use.

## Contribute

### Add an implementation

Copy a comparable setup in [./implementations](./implementations) and adapt.
Be aware that some implementations decide to return queries for single values as
scalars, compare
[./implementations/Clojure_json-path](./implementations/Clojure_json-path).

Test the implementation's ninja build script via (using Clojure as an example):

    ninja -f implementations/Clojure_json-path/build.ninja

Test a query by running (again Clojure as example):

    ./src/query_implementation.sh queries/array_index implementations/Clojure_json-path

### Add a new query

Add a new directory under [./queries](./queries) and give it a `selector` and
`document.json`. Scalar queries have a specific handling, compare
[./queries/array_index](./queries/array_index).

Test a query against an implementation (Goessner's JavaScript as example):

    ./src/query_implementation.sh queries/THE_NEW_QUERY implementations/JavaScript_Goessner

See above "One-off comparisons" to execute against all implementations.

### Upgrade an implementation

Some implementations can be automatically upgraded
(Golang_github.com-bhmj-jsonslice as an example):

    ./implementations/Golang_github.com-bhmj-jsonslice/upgrade.sh
    ./src/wrap_in_docker.sh ninja
