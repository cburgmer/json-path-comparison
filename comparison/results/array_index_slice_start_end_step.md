## Array index slice start end step

### Setup
Selector: `$[0:3:2]`

    ["first", "second", "third", "forth", "fifth"]

### Results
#### Clojure (json-path)

    "first"

#### JavaScript (Goessner)

    [
      "first", 
      "third"
    ]

#### JavaScript (jsonpath)

    [
      "first", 
      "third"
    ]

#### JavaScript (jsonpath-plus)

    [
      "first", 
      "third"
    ]

#### Java (com.jayway.jsonpath)

    [
      "first", 
      "second", 
      "third"
    ]

#### Python (jsonpath)

    [
      "first", 
      "third"
    ]

#### Ruby (jsonpath)

    [
      "first", 
      "third"
    ]

