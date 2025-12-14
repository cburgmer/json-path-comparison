Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$..[*]`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string","value",0,1,[0,1],{"complex":"string","primitives":[0,1]}]
  ```
  Actual output:
  ```
  [
    "string",
    "value",
    0.0,
    1,
    [
      0.0,
      1
    ],
    {
      "complex": "string",
      "primitives": [
        0.0,
        1
      ]
    }
  ]
  ```

- [ ] `$[*]`
  Input:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0,
      1
    ]
  ]
  ```
  Expected output:
  ```
  ["string",42,{"key":"value"},[0,1]]
  ```
  Actual output:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0.0,
      1
    ]
  ]
  ```

- [ ] `$[*]`
  Input:
  ```
  {
    "some": "string",
    "int": 42,
    "object": {
      "key": "value"
    },
    "array": [
      0,
      1
    ]
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string",42,[0,1],{"key":"value"}]
  ```
  Actual output:
  ```
  [
    "string",
    42,
    [
      0.0,
      1
    ],
    {
      "key": "value"
    }
  ]
  ```

- [ ] `$.key-dash`
  Input:
  ```
  {
    "key": 42,
    "key-": 43,
    "-": 44,
    "dash": 45,
    "-dash": 46,
    "": 47,
    "key-dash": "value",
    "something": "else"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Error at char 18 in expression in xsl:sequence/@select on line 20 column 67 of ajp-runner.xslt:
     <failed xmlns:ixml="http://invisiblexml.org/NS"
    ixml:state="failed"><line>1</line><column>6</column><pos>6</pos><unexpected>-</unexpected><permitted>#9, #A, #D, ' ', '.', '[', '_', [#80-'퟿[xd7ff]'], ['0'-'9'], ['A'-'Z'; 'a'-'z'], ['𐀀[x10000]'-'􏿯[x10ffef]'], ['[xe000]'-'￯[xffef]']</permitted><completions><completed rule="member-name-shorthand" start="3" end="5"><input>key</input></completed><completed rule="child-segment" start="2" end="5"><input>.key</input></completed><completed rule="segment" start="2" end="5"><input>.key</input></completed><completed rule="segments" start="2" end="5"><input>.key</input></completed></completions><could-be-next><in rule="bracketed-selection"><tokens>'['</tokens></in><in rule="ALPHA"><tokens>['A'-'Z'; 'a'-'z']</tokens></in><in rule="DIGIT"><tokens>['0'-'9']</tokens></in><in rule="descendant-segment"><tokens>'.'</tokens></in><in rule="B"><tokens>#9, #A, #D, ' '</tokens></in><in rule="child-segment"><tokens>'.'</tokens></in><in rule="name-first"><tokens>'_', [#80-'퟿[xd7ff]'], ['𐀀[x10000]'-'􏿯[x10ffef]'], ['[xe000]'-'￯[xffef]']</tokens></in></could-be-next></failed>
  During lazy evaluation of tailCallLoop(ajp:getProcessor(...)) on line 20 of jar:file:./implementations/Java_com.github.xmljacquard.ajp/build/deps/org/xmljacquard/ajp/0.0.7/ajp-0.0.7.jar!/xslt/ajp-runner.xslt
  In function ajpr:getProcessor on line 17 column 106 of ajp-runner.xslt:
  net.sf.saxon.s9api.SaxonApiException: <failed xmlns:ixml="http://invisiblexml.org/NS" ixml:state="failed"><line>1</line><column>6</column><pos>6</pos><unexpected>-</unexpected><permitted>#9, #A, #D, ' ', '.', '[', '_', [#80-'퟿'], ['0'-'9'], ['A'-'Z'; 'a'-'z'], ['𐀀'-'􏿯'], [''-'￯']</permitted><completions><completed rule="member-name-shorthand" start="3" end="5"><input>key</input></completed><completed rule="child-segment" start="2" end="5"><input>.key</input></completed><completed rule="segment" start="2" end="5"><input>.key</input></completed><completed rule="segments" start="2" end="5"><input>.key</input></completed></completions><could-be-next><in rule="bracketed-selection"><tokens>'['</tokens></in><in rule="ALPHA"><tokens>['A'-'Z'; 'a'-'z']</tokens></in><in rule="DIGIT"><tokens>['0'-'9']</tokens></in><in rule="descendant-segment"><tokens>'.'</tokens></in><in rule="B"><tokens>#9, #A, #D, ' '</tokens></in><in rule="child-segment"><tokens>'.'</tokens></in><in rule="name-first"><tokens>'_', [#80-'퟿'], ['𐀀'-'􏿯'], [''-'￯']</tokens></in></could-be-next></failed>
  ```

- [ ] `$.2`
  Input:
  ```
  {
    "a": "first",
    "2": "second",
    "b": "third"
  }
  ```
  Expected output:
  ```
  ["second"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  Error at char 18 in expression in xsl:sequence/@select on line 20 column 67 of ajp-runner.xslt:
     <failed xmlns:ixml="http://invisiblexml.org/NS"
    ixml:state="failed"><line>1</line><column>2</column><pos>3</pos><unexpected>2</unexpected><permitted>'*', '_', [#80-'퟿[xd7ff]'], ['A'-'Z'; 'a'-'z'], ['𐀀[x10000]'-'􏿯[x10ffef]'], ['[xe000]'-'￯[xffef]']</permitted><could-be-next><in rule="ALPHA"><tokens>['A'-'Z'; 'a'-'z']</tokens></in><in rule="wildcard-selector"><tokens>'*'</tokens></in><in rule="name-first"><tokens>'_', [#80-'퟿[xd7ff]'], ['𐀀[x10000]'-'􏿯[x10ffef]'], ['[xe000]'-'￯[xffef]']</tokens></in></could-be-next><unfinished><open rule="child-segment" start="2" end="2"><input>.</input></open><open rule="jsonpath-query" start="1" end="1"><input>$</input></open></unfinished></failed>
  During lazy evaluation of tailCallLoop(ajp:getProcessor(...)) on line 20 of jar:file:./implementations/Java_com.github.xmljacquard.ajp/build/deps/org/xmljacquard/ajp/0.0.7/ajp-0.0.7.jar!/xslt/ajp-runner.xslt
  In function ajpr:getProcessor on line 17 column 106 of ajp-runner.xslt:
  net.sf.saxon.s9api.SaxonApiException: <failed xmlns:ixml="http://invisiblexml.org/NS" ixml:state="failed"><line>1</line><column>2</column><pos>3</pos><unexpected>2</unexpected><permitted>'*', '_', [#80-'퟿'], ['A'-'Z'; 'a'-'z'], ['𐀀'-'􏿯'], [''-'￯']</permitted><could-be-next><in rule="ALPHA"><tokens>['A'-'Z'; 'a'-'z']</tokens></in><in rule="wildcard-selector"><tokens>'*'</tokens></in><in rule="name-first"><tokens>'_', [#80-'퟿'], ['𐀀'-'􏿯'], [''-'￯']</tokens></in></could-be-next><unfinished><open rule="child-segment" start="2" end="2"><input>.</input></open><open rule="jsonpath-query" start="1" end="1"><input>$</input></open></unfinished></failed>
  ```

- [ ] `$..*`
  Input:
  ```
  {
    "key": "value",
    "another key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string","value",0,1,[0,1],{"complex":"string","primitives":[0,1]}]
  ```
  Actual output:
  ```
  [
    "string",
    "value",
    0.0,
    1,
    [
      0.0,
      1
    ],
    {
      "complex": "string",
      "primitives": [
        0.0,
        1
      ]
    }
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0,
      1
    ]
  ]
  ```
  Expected output:
  ```
  ["string",42,{"key":"value"},[0,1]]
  ```
  Actual output:
  ```
  [
    "string",
    42,
    {
      "key": "value"
    },
    [
      0.0,
      1
    ]
  ]
  ```

- [ ] `$.*`
  Input:
  ```
  {
    "some": "string",
    "int": 42,
    "object": {
      "key": "value"
    },
    "array": [
      0,
      1
    ]
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["string",42,[0,1],{"key":"value"}]
  ```
  Actual output:
  ```
  [
    "string",
    42,
    [
      0.0,
      1
    ],
    {
      "key": "value"
    }
  ]
  ```

- [ ] `$[?(1==1)]`
  Input:
  ```
  [
    1,
    3,
    "nice",
    true,
    null,
    false,
    {},
    [],
    -1,
    0,
    ""
  ]
  ```
  Expected output:
  ```
  [1,3,"nice",true,null,false,{},[],-1,0,""]
  ```
  Actual output:
  ```
  [
    1,
    3,
    "nice",
    true,
    null,
    false,
    {},
    [],
    -1,
    0.0,
    ""
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  [
    [
      0
    ],
    [
      1
    ]
  ]
  ```
  Expected output:
  ```
  [[0],[1],0,1]
  ```
  Actual output:
  ```
  [
    [
      0.0
    ],
    [
      1
    ],
    0.0,
    1
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.github.xmljacquard.ajp.
