Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$[2:113667776004]`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth",
    "fifth"
  ]
  ```
  Expected output:
  ```
  ["third", "forth", "fifth"]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.NumberFormatException: For input string: "113667776004"
  	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:68)
  	at java.base/java.lang.Integer.parseInt(Integer.java:652)
  	at java.base/java.lang.Integer.parseInt(Integer.java:770)
  	at scala.collection.immutable.StringLike.toInt(StringLike.scala:301)
  	at scala.collection.immutable.StringLike.toInt$(StringLike.scala:301)
  	at scala.collection.immutable.StringOps.toInt(StringOps.scala:29)
  	at io.gatling.jsonpath.Parser$.$anonfun$number$1(Parser.scala:67)
  	at io.gatling.jsonpath.Parser$.$anonfun$number$1$adapted(Parser.scala:67)
  	at scala.util.parsing.combinator.Parsers$Success.map(Parsers.scala:140)
  	at scala.util.parsing.combinator.Parsers$Success.map(Parsers.scala:139)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Success.flatMapWithNext(Parsers.scala:146)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Success.flatMapWithNext(Parsers.scala:146)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$2(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$Failure.append(Parsers.scala:195)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Success.flatMapWithNext(Parsers.scala:146)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$2(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$Failure.append(Parsers.scala:195)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers.$anonfun$rep1$1(Parsers.scala:765)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$append$1(Parsers.scala:247)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Success.flatMapWithNext(Parsers.scala:146)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$flatMap$1(Parsers.scala:232)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.Parsers$$anon$5.apply(Parsers.scala:919)
  	at scala.util.parsing.combinator.Parsers$Parser.$anonfun$map$1(Parsers.scala:235)
  	at scala.util.parsing.combinator.Parsers$$anon$1.apply(Parsers.scala:215)
  	at scala.util.parsing.combinator.RegexParsers.parse(RegexParsers.scala:161)
  	at scala.util.parsing.combinator.RegexParsers.parse$(RegexParsers.scala:160)
  	at io.gatling.jsonpath.Parser$.parse(Parser.scala:36)
  	at io.gatling.jsonpath.Parser.compile(Parser.scala:212)
  	at io.gatling.jsonpath.JsonPath$.compile(JsonPath.scala:31)
  	at io.gatling.jsonpath.JsonPath$.query(JsonPath.scala:37)
  	at query.App$.main(App.scala:28)
  	at query.App.main(App.scala)
  ```

- [ ] `$[0:3:0]`
  Input:
  ```
  [
    "first",
    "second",
    "third",
    "forth",
    "fifth"
  ]
  ```
  Error:
  ```
  Exception in thread "main" java.lang.IllegalArgumentException: requirement failed: size=0 and step=0, but both must be positive
  	at scala.collection.Iterator$GroupedIterator.<init>(Iterator.scala:1109)
  	at scala.collection.Iterator.grouped(Iterator.scala:1246)
  	at scala.collection.Iterator.grouped$(Iterator.scala:1245)
  	at scala.collection.AbstractIterator.grouped(Iterator.scala:1432)
  	at io.gatling.jsonpath.JsonPathWalker.sliceArray(JsonPath.scala:187)
  	at io.gatling.jsonpath.JsonPathWalker.walk1(JsonPath.scala:98)
  	at io.gatling.jsonpath.JsonPathWalker.walk(JsonPath.scala:50)
  	at io.gatling.jsonpath.JsonPathWalker.$anonfun$walk$1(JsonPath.scala:50)
  	at scala.collection.Iterator$$anon$11.nextCur(Iterator.scala:482)
  	at scala.collection.Iterator$$anon$11.hasNext(Iterator.scala:488)
  	at scala.collection.Iterator.foreach(Iterator.scala:944)
  	at scala.collection.Iterator.foreach$(Iterator.scala:944)
  	at scala.collection.AbstractIterator.foreach(Iterator.scala:1432)
  	at scala.collection.generic.Growable.$plus$plus$eq(Growable.scala:59)
  	at scala.collection.generic.Growable.$plus$plus$eq$(Growable.scala:50)
  	at scala.collection.mutable.ListBuffer.$plus$plus$eq(ListBuffer.scala:186)
  	at scala.collection.mutable.ListBuffer.$plus$plus$eq(ListBuffer.scala:44)
  	at scala.collection.TraversableOnce.to(TraversableOnce.scala:310)
  	at scala.collection.TraversableOnce.to$(TraversableOnce.scala:308)
  	at scala.collection.AbstractIterator.to(Iterator.scala:1432)
  	at scala.collection.TraversableOnce.toList(TraversableOnce.scala:294)
  	at scala.collection.TraversableOnce.toList$(TraversableOnce.scala:294)
  	at scala.collection.AbstractIterator.toList(Iterator.scala:1432)
  	at query.App$.main(App.scala:32)
  	at query.App.main(App.scala)
  ```

- [ ] `$..[0]`
  Input:
  ```
  [
    "first",
    {
      "key": [
        "first nested",
        {
          "more": [
            {
              "nested": [
                "deepest",
                "second"
              ]
            },
            [
              "more",
              "values"
            ]
          ]
        }
      ]
    }
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["deepest", "first nested", "first", "more", {"nested": ["deepest", "second"]}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  JPError(end of input expected)
  ```

- [ ] `$['']`
  Input:
  ```
  {
    "": 42,
    "''": 123,
    "\"\"": 222
  }
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  JPError(end of input expected)
  ```

- [ ] `$.*[1]`
  Input:
  ```
  [
    [
      1
    ],
    [
      2,
      3
    ]
  ]
  ```
  Expected output:
  ```
  [3]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$['*']`
  Input:
  ```
  {
    "*": "value",
    "another": "entry"
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["value"]
  ```
  Actual output:
  ```
  [
    "entry",
    "value"
  ]
  ```

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
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  JPError(end of input expected)
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
  ["string", 42, [0, 1], {"key": "value"}]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$..key`
  Input:
  ```
  {
    "object": {
      "key": "value",
      "array": [
        {
          "key": "something"
        },
        {
          "key": {
            "key": "russian dolls"
          }
        }
      ]
    },
    "key": "top"
  }
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  ["russian dolls", "something", "top", "value", {"key": "russian dolls"}]
  ```
  Actual output:
  ```
  [
    "something",
    "top",
    "value",
    {
      "key": "russian dolls"
    }
  ]
  ```

- [ ] `$.*.bar.*`
  Input:
  ```
  [
    {
      "bar": [
        42
      ]
    }
  ]
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$.*.*`
  Input:
  ```
  [
    [
      1,
      2,
      3
    ],
    [
      4,
      5,
      6
    ]
  ]
  ```
  Expected output:
  ```
  [1, 2, 3, 4, 5, 6]
  ```
  Actual output:
  ```
  []
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
  ["string", "value", 0, 1, [0, 1], {"complex": "string", "primitives": [0, 1]}]
  ```
  Actual output:
  ```
  [
    "string",
    "value",
    0,
    1,
    [
      0,
      1
    ],
    {
      "another key": {
        "complex": "string",
        "primitives": [
          0,
          1
        ]
      },
      "key": "value"
    },
    {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  [
    40,
    null,
    42
  ]
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  [40, 42, null]
  ```
  Actual output:
  ```
  [
    40,
    42,
    [
      40,
      null,
      42
    ],
    null
  ]
  ```

- [ ] `$..*`
  Input:
  ```
  42
  ```
  Expected output (in any order as no consensus on ordering exists):
  ```
  []
  ```
  Actual output:
  ```
  [
    42
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
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  []
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Scala_jsonpath.
