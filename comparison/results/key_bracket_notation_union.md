## Key bracket notation union

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

#### JavaScript (jsonpath-plus)

    []

#### Java (com.jayway.jsonpath)

    {
      "another": "entry", 
      "key": "value"
    }

