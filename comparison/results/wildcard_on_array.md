## Wildcard on array

### Setup
Selector: `$.*`

    [
        "string",
        42,
        {
            "key": "value"
        },
        [0, 1]
    ]

### Results
####  Gold Standard (consensus)

    [
      "string", 
      42, 
      {
        "key": "value"
      }, 
      [
        0, 
        1
      ]
    ]

#### Clojure (json-path)

    [
      "string", 
      42, 
      {
        "key": "value"
      }, 
      0, 
      1
    ]

#### Python (jsonpath-ng)

    []

