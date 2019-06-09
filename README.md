# json-path-comparison
Comparison of the different implementations of JSONPath.

Our goals is to show features of [JSONPath](https://goessner.net/articles/JsonPath/)
in available libraries, and call out differences where libraries are not aligned.

See [./comparison](./comparison) for a table generated against a set of example queries.

## Contribute

You can easily add another library/tool to the comparison. Copy a comparable setup in [./tools](./tools) and adapt.

Adding more tests should be fairly easy. Add a new directory under [./queries](./queries) and give it a `selector` and `document.json`
.

And last but not least, clarifying any differences and fixing bugs identified in upstream is the main goal of this comparison!
