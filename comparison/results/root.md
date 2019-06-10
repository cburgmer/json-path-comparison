## Root

### Setup
Selector: `$`

    {
      "key": "value",
      "another key": {
        "complex": [
          "a",
          1
        ]
      }
    }

### Results
####  Gold Standard (consensus)

    {
      "another key": {
        "complex": [
          "a", 
          1
        ]
      }, 
      "key": "value"
    }

#### JavaScript (jsonpath)

    [
      {
        "another key": {
          "complex": [
            "a", 
            1
          ]
        }, 
        "key": "value"
      }
    ]

