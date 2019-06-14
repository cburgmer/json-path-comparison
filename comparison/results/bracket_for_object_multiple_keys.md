## Bracket for object multiple keys

### Setup
Selector: `$['key','another']`

    {
      "key": "value",
      "another": "entry"
    }

### Results
#### JavaScript (Goessner)

    [
      "value", 
      "entry"
    ]

#### JavaScript (jsonpath)

    [
      "value", 
      "entry"
    ]

#### Python (jsonpath-ng)

    [
      "value", 
      "entry"
    ]

