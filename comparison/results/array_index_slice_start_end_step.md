## Array index slice start end step

### Setup
Selector: `$[0:3:2]`

    ["first", "second", "third", "forth", "fifth"]

### Results
####  Gold Standard (consensus)

    [
      "first", 
      "third"
    ]

#### Clojure (json-path)

    "first"

#### Java (com.jayway.jsonpath)

    [
      "first", 
      "second", 
      "third"
    ]

