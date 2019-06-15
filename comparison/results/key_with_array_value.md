## Key with array value

### Setup
Selector: `$.key`

    {
        "key": ["first", "second"]
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

