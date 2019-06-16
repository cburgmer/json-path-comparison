## Wildcard bracket notation on object

### Setup
Selector: `$[*]`

    {
        "some": "string",
        "int": 42,
        "object": {
            "key": "value"
        },
        "array": [0, 1]
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

#### Python (jsonpath)

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

#### Python (jsonpath-rw)

    [
      {
        "array": [
          0, 
          1
        ], 
        "int": 42, 
        "object": {
          "key": "value"
        }, 
        "some": "string"
      }
    ]

#### Ruby (jsonpath)

    [
      null, 
      null, 
      null, 
      null
    ]

#### Rust (jsonpath_lib)

    {
      "array": [
        0, 
        1
      ], 
      "int": 42, 
      "object": {
        "key": "value"
      }, 
      "some": "string"
    }

