# json-path-comparison
Comparison of the different implementations of
[JSONPath](https://goessner.net/articles/JsonPath/) and language agnostic test
suite.

See https://cburgmer.github.io/json-path-comparison/ for the table generated
from the queries in [./queries](./queries).

## Goals

- Show implementation status of well established implementations.
- Inform emerging specification on existing de facto standard.
- Support implementers with test cases.

## How to

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

### Errors

Some of the complexity sadly brings its own set of errors

- Docker might fail building on re-runs due to an outdated package index.
  Quickest fix is to run `docker rmi json-path-comparison` and start from scratch.
- If Ninja fails, the failing step is unlikely to be the last (as it will let
  parallel requests finish first). Search for `FAILED` to identify the failing
  step. The error is most likely captured in the output file (the part behind
  the `>`). Debug from there.
- Some executions might run into timeouts (especially when the machine is under
  high load). This is a necessary mechanism as not all implementations play nice.
  Currently the best fix is to remove the output, e.g.
  `rm -r build/results/bracket_notation_with_number_on_short_array` for a whole
  query, and re-running Ninja to force a re-build.
- Out of memory: Some compile steps (looking at you, Haskell) seem to need a lot
  of memory. Increasing the available memory for Docker should help.
