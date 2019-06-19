## Key bracket notation with single quote escaped

### Setup
Selector: `$['single\'quote']`

    {"single'quote":"value"}

### Results
#### Java (com.jayway.jsonpath)

    "value"

#### Python (jsonpath-rw)

    "value"

#### Rust (jsonpath_lib)

    "value"

