## List result

### Setup
Selector: `$.book`

    {
      "book": [
        {
          "category": "reference",
          "author": "Nigel Rees",
          "title": "Sayings of the Century",
          "price": 8.95
        },
        {
          "category": "fiction",
          "author": "Evelyn Waugh",
          "title": "Sword of Honour",
          "price": 12.99
        },
        {
          "category": "fiction",
          "author": "Herman Melville",
          "title": "Moby Dick",
          "isbn": "0-553-21311-3",
          "price": 8.99
        },
        {
          "category": "fiction",
          "author": "J. R. R. Tolkien",
          "title": "The Lord of the Rings",
          "isbn": "0-395-19395-8",
          "price": 22.99
        }
      ]
    }

### Results
####  Gold Standard (consensus)

    [
      {
        "author": "Nigel Rees", 
        "category": "reference", 
        "price": 8.95, 
        "title": "Sayings of the Century"
      }, 
      {
        "author": "Evelyn Waugh", 
        "category": "fiction", 
        "price": 12.99, 
        "title": "Sword of Honour"
      }, 
      {
        "author": "Herman Melville", 
        "category": "fiction", 
        "isbn": "0-553-21311-3", 
        "price": 8.99, 
        "title": "Moby Dick"
      }, 
      {
        "author": "J. R. R. Tolkien", 
        "category": "fiction", 
        "isbn": "0-395-19395-8", 
        "price": 22.99, 
        "title": "The Lord of the Rings"
      }
    ]

#### JavaScript (jsonpath-plus)

    [
      [
        {
          "author": "Nigel Rees", 
          "category": "reference", 
          "price": 8.95, 
          "title": "Sayings of the Century"
        }, 
        {
          "author": "Evelyn Waugh", 
          "category": "fiction", 
          "price": 12.99, 
          "title": "Sword of Honour"
        }, 
        {
          "author": "Herman Melville", 
          "category": "fiction", 
          "isbn": "0-553-21311-3", 
          "price": 8.99, 
          "title": "Moby Dick"
        }, 
        {
          "author": "J. R. R. Tolkien", 
          "category": "fiction", 
          "isbn": "0-395-19395-8", 
          "price": 22.99, 
          "title": "The Lord of the Rings"
        }
      ]
    ]

