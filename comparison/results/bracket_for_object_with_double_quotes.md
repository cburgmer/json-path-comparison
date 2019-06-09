## Bracket for object with double quotes

### Setup
Selector: `$["key"]`

    {
      "key": "value"
    }

### Results
#### JavaScript (jsonpath)

    [
      "value"
    ]

#### Rust (jsonpath_lib)

    "value"

