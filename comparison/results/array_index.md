## Array index

### Setup
Selector: `$.book[2]`

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
#### Clojure (json-path)

    {
      "author": "Herman Melville", 
      "category": "fiction", 
      "isbn": "0-553-21311-3", 
      "price": 8.99, 
      "title": "Moby Dick"
    }

#### JavaScript (Goessner)

    [
      {
        "author": "Herman Melville", 
        "category": "fiction", 
        "isbn": "0-553-21311-3", 
        "price": 8.99, 
        "title": "Moby Dick"
      }
    ]

#### JavaScript (jsonpath)

    [
      {
        "author": "Herman Melville", 
        "category": "fiction", 
        "isbn": "0-553-21311-3", 
        "price": 8.99, 
        "title": "Moby Dick"
      }
    ]

#### JavaScript (jsonpath-plus)

    {
      "author": "Herman Melville", 
      "category": "fiction", 
      "isbn": "0-553-21311-3", 
      "price": 8.99, 
      "title": "Moby Dick"
    }

#### Rust (jsonpath_lib)

    {
      "author": "Herman Melville", 
      "category": "fiction", 
      "isbn": "0-553-21311-3", 
      "price": 8.99, 
      "title": "Moby Dick"
    }

