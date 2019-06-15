# json-path-comparison
Comparison of the different implementations of JSONPath.

Our goal is to show features of [JSONPath](https://goessner.net/articles/JsonPath/)
in available libraries, and call out differences where libraries are not aligned.

See [./comparison](./comparison) for a table generated against a set of example queries.

## Contribute

You can easily add another library/implementation to the comparison. Copy a comparable setup in [./implementations](./implementations) and adapt. Be aware that some implementations don't handle scalars specifically, compare [./implementations/JavaScript_Goessner](./implementations/JavaScript_Goessner).

Adding more tests should be fairly easy. Add a new directory under [./queries](./queries) and give it a `selector` and `document.json`
. Scalar queries have a specific handling, compare [./queries/array_index](./queries/array_index).

And last but not least, clarifying any differences and fixing bugs identified in upstream is the main goal of this comparison!
