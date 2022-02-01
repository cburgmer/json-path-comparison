# JSONPath Comparison: An Analysis

[Introduction](#A1)  

[Filter applied to JSON Object](#A2)

[The meaning of current value expressions in filters](#A3)

<div id="A1"/> 
 
## Introduction  

There's a great deal of data, an almost overwhelming amount of data, in the 
[JSONPath comparisons](https://cburgmer.github.io/json-path-comparison/). This document 
attempts to analyze that data as it pertains to the different implementations. 
It limits itself to comparing and contrasting the data, it is not prescriptive.

<div id="A2"/>  

## Filter applied to JSON Object

### Comparisons

[Filter expression on object](https://cburgmer.github.io/json-path-comparison/results/filter_expression_on_object.html)

### Analysis

Should JSONPath filters apply to both JSON objects and arrays, or only to JSON arrays?
If to JSON objects, should they apply to the object itself, or to the value part of the
object's name-value pairs?
 
In the comparisons, given document
```json
{"key": 42, "another": {"key": 1}}
``` 
and selector
```
$[?(@.key)]
```
results vary.

Result                                               |Interpretation       |Count | Notable implementations
-----------------------------------------------------|-----------------|------|------------------
[], "syntax error", "not supported", or runtime error|Unsupported      |17    |[Json.NET](https://www.newtonsoft.com/json), [PHP Goessner](https://code.google.com/archive/p/jsonpath/)
[ { "key": 1}]                                       |Applied to members only       |15    |[Python jsonpath](http://www.ultimate.com/phil/python/#jsonpath)
[ { "another": { "key":1}, "key": 42 }]              |Applied to members only (Jayway style) |10     |[Java Jayway](https://github.com/json-path/JsonPath/)
[ 42, { "key": 1 }]                                  |Applied to object and members|2| [JavaScript Goessner](https://code.google.com/archive/p/jsonpath/)


<div id="A3"/> 
 
## The meaning of current value expressions in filters 

### Comparisons

[Filter expression with bracket notation](https://cburgmer.github.io/json-path-comparison/results/filter_expression_with_bracket_notation.html)  
[Filter expression with bracket notation with number](https://cburgmer.github.io/json-path-comparison/results/filter_expression_with_bracket_notation_with_number.html)  
[Filter expression with subfilter](https://cburgmer.github.io/json-path-comparison/results/filter_expression_with_subfilter.html)  
[Current with dot notation](https://cburgmer.github.io/json-path-comparison/results/current_with_dot_notation.html)  
[Filter expression with equals array](https://cburgmer.github.io/json-path-comparison/results/filter_expression_with_equals_array.html)  
[Filter expression with equals array for array slice with range 1](https://cburgmer.github.io/json-path-comparison/results/filter_expression_with_equals_array_for_array_slice_with_range_1.html)  

### Analysis

A current value expression is an expression that refers to the "current value", represented by `@`. 

Many (but not all) JSONPath implementations support selectors like
```
$[?(@['key']==42)]

$[?(@[1]=='b')]
```
Perhaps surprisingly, out of 44 implementations, 15 cannot evaluate the first selector, 
and 13 the second, variously producing `[]`, "syntax error", "not supported", or runtime error.
But of the ones that can, they all agree on the same result.

What do expressions like `@['key']` and `@[1]` mean? On the one hand, they bear a resemblance
to JSONPath expressions, except they begin with `@` rather than `$`. On the other hand,
they must evaluate to a single JSON value (null, boolean, number, string, object, array),
not a result list, for the above comparisons to make sense. 

In original JavaScript Goessner, Stefan Goessner uses the JavaScript engine for evaluating
JSONPath filter expressions. In these scripts, `@` is substituted with the "current value",
and expressions consisting of the "current value" followed by a dot or a left square bracket
are evaluated according to JavaScript semantics. These always result in a single value. 
Similar conclusions apply to implementations that use Python or PhP for evaluating filter expressions. 

Following original JavaScript Goessner, some JSONPath implementations made up their own 
expression languages, and dispensed with JavaScript, Python, PhP et all for that purpose.
Of these, the most popular and influential was [Java Jayway](https://github.com/json-path/JsonPath/).

In Jayway, expressions like `@['key']` and `@[1]` mean actual JSONPath expressions, 
evaluated against the "current value". Moreover, Jayway allows JSONPath expressions 
to start with either `$` or `@` at the beginning of evaluation, where `$` and `@`
both represent the root value. Also in Jayway,
by default JSONPath expressions are evaluated according to rules that produce a single value, 
not a result list. Some description of these rules may be found 
[here](https://support.smartbear.com/readyapi/docs/testing/jsonpath-reference.html), 
under "Usage notes and considerations". In summary, the slice, union and filter selectors 
always wrap matches in an array, the wildcard selector wraps matches in an array if 
there are more than two, the identifier and index selectors 
produce a single value if matched, and if not matched, produce a null.

Jayway has an option to return a result list rather than a single value, but this option
does not apply inside filters, inside filters, current value expression are always
evaluated to a single value according to the above rules.

We can get an idea of the number of implementations that treat current value expressions
as actual JSONPath expressions from the comparison that allows subfilters in filters.

Given the document
```json
[
    {
        "a": [{"price": 1}, {"price": 3}]
    },
    {
        "a": [{"price": 11}]
    },
    {
        "a": [{"price": 8}, {"price": 12}, {"price": 3}]
    },
    {
        "a": []
    }
]
``` 
and selector
```
$[?(@.a[?(@.price>10)])]
```
15 of 44 implementations produce meaningful results (with some differences.)

These include Cpp (jsoncons), Erlang (ejsonpath), Golang (github.com-bhmj-jsonslice),
Golang (github.com-spyzhov-ajson), Golang (github.com-vmware-labs-yaml-jsonpath),
Java (com.jayway.jsonpath), Objective-C (SMJJSONPath), PHP (remorhaz-jsonpath),
Ruby (jsonpath), Rust (jsonpath_lib), Scala (jsonpath), Swift (Sextant),
dotNET (Json.NET), dotNET (JsonCons.JsonPath), dotNET (JsonPath.Net). The list 
includes the important [Java Jayway](https://github.com/json-path/JsonPath/) and 
[Json.NET](https://www.newtonsoft.com/json) implementations.

Of these, Cpp (jsoncons), Golang (github.com-spyzhov-ajson), Java (com.jayway.jsonpath),
Objective-C (SMJJSONPath), Ruby (jsonpath), Swift (Sextant), dotNET (JsonCons.JsonPath), 
and dotNET (JsonPath.Net) allow JSONPath expressions such as '@.a' in place of '$.a'.
Here `@`, the current value, is regarded as the same as `$`, the root value,
at the beginning of evaluation.


