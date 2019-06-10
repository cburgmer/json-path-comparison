## Bracket for object multiple keys

### Setup
Selector: `$['key','another']`

    {
      "key": "value",
      "another": "entry"
    }

### Results
####  Gold Standard (consensus)

    [
      "value", 
      "entry"
    ]

