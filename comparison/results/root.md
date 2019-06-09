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
      "key": "value",
      "another key": {
        "complex": [
          "a",
          1
        ]
      }
    }

#### JavaScript (jsonpath)

    [
      {
        "key": "value",
        "another key": {
          "complex": [
            "a",
            1
          ]
        }
      }
    ]

