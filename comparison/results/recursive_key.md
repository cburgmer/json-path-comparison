## Recursive key

### Setup
Selector: `$..key`

    {
        "object": {
            "key": "value",
            "array": [
                {"key": "something"},
                {"key": {"key": "russian dolls"}}
            ]
        },
        "key": "top"
    }

### Results
####  Gold Standard (consensus)

    [
      "top", 
      "value", 
      "something", 
      {
        "key": "russian dolls"
      }, 
      "russian dolls"
    ]

