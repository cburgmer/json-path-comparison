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
`document.json`.

Test a query against an implementation (Goessner's JavaScript as example):

    ./src/query_implementation.sh queries/THE_NEW_QUERY implementations/JavaScript_Goessner

See above "One-off comparisons" to execute against all implementations.

### Upgrade implementations

Some implementations can be automatically upgraded:

    ./upgrade.sh
