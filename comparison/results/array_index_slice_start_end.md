## Array index slice start end

### Setup
Selector: `$[1:3]`

    ["first", "second", "third", "forth", "fifth"]

### Results
####  Gold Standard (consensus)

    [
      "second", 
      "third"
    ]

#### Clojure (json-path)

    "second"

