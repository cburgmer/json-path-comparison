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

#### Python (jsonpath-rw)

    []

#### Ruby (jsonpath)

    [
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
    ]

#### Rust (jsonpath_lib)

    [
      "value"
    ]

