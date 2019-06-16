## Key bracket notation union

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

#### JavaScript (jsonpath-plus)

    []

#### Java (com.jayway.jsonpath)

    {
      "another": "entry", 
      "key": "value"
    }

#### Python (jsonpath-rw)

    [
      "value", 
      "entry"
    ]

#### Ruby (jsonpath)

    [
      "value", 
      "entry"
    ]

