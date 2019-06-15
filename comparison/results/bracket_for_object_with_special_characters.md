## Bracket for object with special characters

### Setup
Selector: `$['fun:\"characters']`

    {"fun:\"characters":"value"}

### Results
#### Python (jsonpath-ng)

    "value"

#### Rust (jsonpath_lib)

    null

