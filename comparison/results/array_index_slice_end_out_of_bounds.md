## Array index slice end out of bounds

### Setup
Selector: `$[1:10]`

    ["first", "second", "third"]

### Results
####  Gold Standard (consensus)

    [
      "second", 
      "third"
    ]

#### Clojure (json-path)

    "second"

