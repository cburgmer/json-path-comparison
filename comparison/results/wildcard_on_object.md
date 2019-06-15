## Wildcard on object

### Setup
Selector: `$.key.*`

    {
        "key": {
            "some": "string",
            "int": 42,
            "object": {
                "key": "value"
            },
            "array": [0, 1]
        }
    }

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

    [
      42, 
      [
        0, 
        1
      ], 
      {
        "key": "value"
      }, 
      "string"
    ]

