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
  	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
  	at java.base/java.lang.Integer.parseInt(Integer.java:652)
  	at java.base/java.lang.Integer.parseInt(Integer.java:770)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitSlicing(JsonPathCompiler.java:123)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitSlicing(JsonPathCompiler.java:42)
  	at org.jsfr.json.compiler.JsonPathParser$SlicingContext.accept(JsonPathParser.java:599)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visitChildren(AbstractParseTreeVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathBaseVisitor.visitRelativePath(JsonPathBaseVisitor.java:53)
  	at org.jsfr.json.compiler.JsonPathParser$RelativePathContext.accept(JsonPathParser.java:221)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visitChildren(AbstractParseTreeVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathBaseVisitor.visitPath(JsonPathBaseVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitPath(JsonPathCompiler.java:53)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitPath(JsonPathCompiler.java:42)
  	at org.jsfr.json.compiler.JsonPathParser$PathContext.accept(JsonPathParser.java:138)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visit(AbstractParseTreeVisitor.java:18)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:285)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:284)
  	at query.App.main(App.java:30)
  ```

- [ ] `$[-113667776004:2]`
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
  Exception in thread "main" java.lang.NumberFormatException: For input string: "-113667776004"
  	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
  	at java.base/java.lang.Integer.parseInt(Integer.java:652)
  	at java.base/java.lang.Integer.parseInt(Integer.java:770)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitSlicing(JsonPathCompiler.java:123)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitSlicing(JsonPathCompiler.java:42)
  	at org.jsfr.json.compiler.JsonPathParser$SlicingContext.accept(JsonPathParser.java:599)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visitChildren(AbstractParseTreeVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathBaseVisitor.visitRelativePath(JsonPathBaseVisitor.java:53)
  	at org.jsfr.json.compiler.JsonPathParser$RelativePathContext.accept(JsonPathParser.java:221)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visitChildren(AbstractParseTreeVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathBaseVisitor.visitPath(JsonPathBaseVisitor.java:46)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitPath(JsonPathCompiler.java:53)
  	at org.jsfr.json.compiler.JsonPathCompiler.visitPath(JsonPathCompiler.java:42)
  	at org.jsfr.json.compiler.JsonPathParser$PathContext.accept(JsonPathParser.java:138)
  	at org.antlr.v4.runtime.tree.AbstractParseTreeVisitor.visit(AbstractParseTreeVisitor.java:18)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:285)
  	at org.jsfr.json.compiler.JsonPathCompiler.compile(JsonPathCompiler.java:273)
  	at org.jsfr.json.JsonSurfer.collectAll(JsonSurfer.java:284)
  	at query.App.main(App.java:30)
  ```

- [ ] `$[-4:-3]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  [4]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[-4:1]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    2
  ]
  ```

- [ ] `$[-4:2]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  []
  ```
  Actual output:
  ```
  [
    2,
    "a"
  ]
  ```

- [ ] `$[-4:3]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  [4]
  ```
  Actual output:
  ```
  [
    2,
    "a",
    4
  ]
  ```

- [ ] `$[::]`
  Input:
  ```
  [
    "first",
    "second"
  ]
  ```
  Expected output:
  ```
  ["first", "second"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[3:-2]`
  Input:
  ```
  [
    2,
    "a",
    4,
    5,
    100,
    "nice"
  ]
  ```
  Expected output:
  ```
  [5]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[-1:]`
  Input:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```

- [ ] `$[-2:]`
  Input:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```
  Expected output:
  ```
  ["second", "third"]
  ```
  Actual output:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```

- [ ] `$[0:3:2]`
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
  ["first", "third"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[0:3:1]`
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
  ["first", "second", "third"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[010:024:010]`
  Input:
  ```
  [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ]
  ```
  Expected output:
  ```
  [10, 20]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 no viable alternative at input '[010'
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[0:4:2]`
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
  ["first", "third"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[1:3:]`
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
  ["second", "third"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[::2]`
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
  ["first", "third", "fifth"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$["key"]`
  Input:
  ```
  {
    "key": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:2 token recognition error at: '"'
  line 1:6 token recognition error at: '"'
  line 1:3 no viable alternative at input '[key'
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[-1]`
  Input:
  ```
  [
    "first",
    "second",
    "third"
  ]
  ```
  Expected output:
  ```
  ["third"]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$.true`
  Input:
  ```
  {
    "true": "value"
  }
  ```
  Expected output:
  ```
  ["value"]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  org.antlr.v4.runtime.misc.ParseCancellationException
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
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[?(@.key==42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
    },
    {
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.key==-0.123e2)]`
  Input:
  ```
  [
    {
      "key": -12.3
    },
    {
      "key": -0.123
    },
    {
      "key": -12
    },
    {
      "key": 12.3
    },
    {
      "key": 2
    },
    {
      "key": "-0.123e2"
    }
  ]
  ```
  Error:
  ```
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.key=="hi@example.com")]`
  Input:
  ```
  [
    {
      "key": "some"
    },
    {
      "key": "value"
    },
    {
      "key": "hi@example.com"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "hi@example.com"}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:11 token recognition error at: '"'
  line 1:26 token recognition error at: '"'
  line 1:12 no viable alternative at input '@.key==hi'
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[?(@.key=="some.value")]`
  Input:
  ```
  [
    {
      "key": "some"
    },
    {
      "key": "value"
    },
    {
      "key": "some.value"
    }
  ]
  ```
  Expected output:
  ```
  [{"key": "some.value"}]
  ```
  Actual output:
  NOT_SUPPORTED
  ```
  line 1:11 token recognition error at: '"'
  line 1:22 token recognition error at: '"'
  line 1:12 no viable alternative at input '@.key==some'
  org.antlr.v4.runtime.misc.ParseCancellationException
  ```

- [ ] `$[?(@.key>42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.key>=42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  line 1:10 token recognition error at: '=4'
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.key<42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.key<=42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "43"
    },
    {
      "key": "42"
    },
    {
      "key": "41"
    },
    {
      "key": "value"
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  line 1:10 token recognition error at: '=4'
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$[?(@.a[?(@.price>10)])]`
  Input:
  ```
  [
    {
      "a": [
        {
          "price": 1
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": [
        {
          "price": 11
        }
      ]
    },
    {
      "a": [
        {
          "price": 8
        },
        {
          "price": 12
        },
        {
          "price": 3
        }
      ]
    },
    {
      "a": []
    }
  ]
  ```
  Error:
  ```
  java.lang.NullPointerException
  ```

- [ ] `$[?(@.key===42)]`
  Input:
  ```
  [
    {
      "key": 0
    },
    {
      "key": 42
    },
    {
      "key": -1
    },
    {
      "key": 1
    },
    {
      "key": 41
    },
    {
      "key": 43
    },
    {
      "key": 42.0001
    },
    {
      "key": 41.9999
    },
    {
      "key": 100
    },
    {
      "key": "some"
    },
    {
      "key": "42"
    },
    {
      "key": null
    },
    {
      "key": 420
    },
    {
      "key": ""
    },
    {
      "key": {}
    },
    {
      "key": []
    },
    {
      "key": [
        42
      ]
    },
    {
      "key": {
        "key": 42
      }
    },
    {
      "key": {
        "some": 42
      }
    },
    {
      "some": "value"
    }
  ]
  ```
  Error:
  ```
  line 1:11 token recognition error at: '=4'
  java.lang.NumberFormatException: Character " is neither a decimal digit number, decimal point, nor "e" notation exponential mark.
  ```

- [ ] `$..`
  Input:
  ```
  [
    {
      "a": {
        "b": "c"
      }
    },
    [
      0,
      1
    ]
  ]
  ```
  Error:
  ```
  java.lang.IllegalStateException: deep-scan shouldn't be the last operator.
  ```

- [ ] `$.key..`
  Input:
  ```
  {
    "some key": "value",
    "key": {
      "complex": "string",
      "primitives": [
        0,
        1
      ]
    }
  }
  ```
  Error:
  ```
  java.lang.IllegalStateException: deep-scan shouldn't be the last operator.
  ```

- [ ] `$`
  Input:
  ```
  42
  ```
  Expected output:
  ```
  [42]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$`
  Input:
  ```
  false
  ```
  Expected output:
  ```
  [false]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$`
  Input:
  ```
  true
  ```
  Expected output:
  ```
  [true]
  ```
  Actual output:
  ```
  []
  ```

- [ ] `$[4,1]`
  Input:
  ```
  [
    1,
    2,
    3,
    4,
    5
  ]
  ```
  Expected output:
  ```
  [5, 2]
  ```
  Actual output:
  ```
  [
    2,
    5
  ]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Java_com.github.jsurfer.
