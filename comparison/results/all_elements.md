## All elements

### Setup
Selector: `$..*`

    {
        "key": "value",
        "another key": {
            "complex": "string",
            "primitives": [0, 1]
        }
    }

### Results
####  Gold Standard (consensus)

    [
      "value", 
      {
        "complex": "string", 
        "primitives": [
          0, 
          1
        ]
      }, 
      "string", 
      [
        0, 
        1
      ], 
      0, 
      1
    ]

#### Python (jsonpath-ng)

    [
      {
        "complex": "string", 
        "primitives": [
          0, 
          1
        ]
      }, 
      "value", 
      [
        0, 
        1
      ], 
      "string"
    ]

