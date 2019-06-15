## Key with array value

### Setup
Selector: `$.array`

    {
        "array": ["first", "second"]
    }

### Results
####  Gold Standard (consensus)

    [
      "first", 
      "second"
    ]

#### JavaScript (jsonpath-plus)

    [
      [
        "first", 
        "second"
      ]
    ]

