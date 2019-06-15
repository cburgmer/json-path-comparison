## Array index union

### Setup
Selector: `$[0,1]`

    ["first", "second", "third"]

### Results
####  Gold Standard (consensus)

    [
      "first", 
      "second"
    ]

#### Clojure (json-path)

    "first"

