## Array index slice end

### Setup
Selector: `$[:2]`

    ["first", "second", "third", "forth", "fifth"]

### Results
####  Gold Standard (consensus)

    [
      "first", 
      "second"
    ]

#### Clojure (json-path)

    "third"

