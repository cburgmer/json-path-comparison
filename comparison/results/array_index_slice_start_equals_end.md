## Array index slice start equals end

### Setup
Selector: `$[0:0]`

    [
      "first",
      "second"
    ]

### Results
#### Clojure (json-path)

    "first"

#### JavaScript (jsonpath)

    []

#### JavaScript (jsonpath-plus)

    [
      "first", 
      "second"
    ]

#### Java (com.jayway.jsonpath)

    []

#### Python (jsonpath-rw)

    []

#### Ruby (jsonpath)

    [
      "first"
    ]

#### Rust (jsonpath_lib)

    null

