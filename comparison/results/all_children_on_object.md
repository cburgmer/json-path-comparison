## All children on object

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

#### JavaScript (Goessner)

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

#### JavaScript (jsonpath)

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

#### JavaScript (jsonpath-plus)

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

#### Java (com.jayway.jsonpath)

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

#### Rust (jsonpath_lib)

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

