## Recursive wildcard

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
#### JavaScript (Goessner)

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

#### JavaScript (jsonpath)

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

#### JavaScript (jsonpath-plus)

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

#### Java (com.jayway.jsonpath)

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

#### Python (jsonpath)

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
      "string", 
      0, 
      1
    ]

#### Python (jsonpath-rw)

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

#### Ruby (jsonpath)

    [
      {
        "another key": {
          "complex": "string", 
          "primitives": [
            0, 
            1
          ]
        }, 
        "key": "value"
      }, 
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

#### Rust (jsonpath_lib)

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

