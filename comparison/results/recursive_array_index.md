## Recursive array index

### Setup
Selector: `$..[0]`

    [
        "first",
        {
            "key": [
                "first nested",
                {
                    "more": [
                        {
                            "nested": ["deepest", "second"]
                        },
                        ["more", "values"]
                    ]
                }
            ]
        }
    ]

### Results
#### JavaScript (Goessner)

    [
      "first", 
      "first nested", 
      {
        "nested": [
          "deepest", 
          "second"
        ]
      }, 
      "deepest", 
      "more"
    ]

#### JavaScript (jsonpath)

    [
      "first", 
      "first nested", 
      {
        "nested": [
          "deepest", 
          "second"
        ]
      }, 
      "deepest", 
      "more"
    ]

#### JavaScript (jsonpath-plus)

    [
      "first", 
      "first nested", 
      {
        "nested": [
          "deepest", 
          "second"
        ]
      }, 
      "deepest", 
      "more"
    ]

#### Java (com.jayway.jsonpath)

    [
      "first", 
      "first nested", 
      {
        "nested": [
          "deepest", 
          "second"
        ]
      }, 
      "deepest", 
      "more"
    ]

#### Rust (jsonpath_lib)

    [
      "first nested", 
      {
        "nested": [
          "deepest", 
          "second"
        ]
      }, 
      "more", 
      "deepest"
    ]

