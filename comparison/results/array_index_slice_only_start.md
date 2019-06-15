## Array index slice only start

### Setup
Selector: `$[1:]`

    ["first", "second", "third", "forth", "fifth"]

### Results
####  Gold Standard (consensus)

    [
      "second", 
      "third", 
      "forth", 
      "fifth"
    ]

#### Clojure (json-path)

    "second"

