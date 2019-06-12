# Comparison of different implementations of JSONPath

This sheet makes no statement on the correctness of any of the tools, it merely believes in what the majority says.

<table>
<thead>
<tr>
<th></th>
<th></th>
<th colspan="1">Clojure</th>
<th colspan="3">JavaScript</th>
<th colspan="1">Java</th>
<th colspan="1">Python</th>
<th colspan="1">Rust</th>
</tr>
<tr>
<th></th>
<th></th>
<th>
json-path
</th>
<th>
Goessner
¹
</th>
<th>
jsonpath
¹
</th>
<th>
jsonpath-plus
</th>
<th>
com.jayway.jsonpath
</th>
<th>
jsonpath-ng
¹
</th>
<th>
jsonpath_lib
</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="results/root.md">Root</a></td>
<td><code>$</code></td>
<td>
✓
</td>
<td>
<a href="errors.md#JavaScript_Goessner___root">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/all_elements.md">All elements</a></td>
<td><code>$..*</code></td>
<td>
<a href="errors.md#Clojure_json-path___all_elements">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/recursive_attribute.md">Recursive attribute</a></td>
<td><code>$..author</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_result.md">Array result</a></td>
<td><code>$.book</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/all_children.md">All children</a></td>
<td><code>$.book.*</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/last_array_index_open_end.md">Last array index open end</a></td>
<td><code>$.book[-1:]</code></td>
<td>
<a href="errors.md#Clojure_json-path___last_array_index_open_end">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/last_array_index.md">Last array index</a></td>
<td><code>$.book[-1]</code></td>
<td>
<a href="errors.md#Clojure_json-path___last_array_index">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___last_array_index">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___last_array_index">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___last_array_index">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_index_union.md">Array index union</a></td>
<td><code>$.book[0,1]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___array_index_union">e</a>
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_index_step_start_end_step.md">Array index step start end step</a></td>
<td><code>$.book[0:3:2]</code></td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
✗
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___array_index_step_start_end_step">e</a>
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___array_index_step_start_end_step">e</a>
</td>
</tr>
<tr>
<td><a href="results/array_index_step_start_end.md">Array index step start end</a></td>
<td><code>$.book[1:3]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_index_step_start.md">Array index step start</a></td>
<td><code>$.book[1:]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_index.md">Array index</a></td>
<td><code>$.book[2]</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/array_index_step_end.md">Array index step end</a></td>
<td><code>$.book[:2]</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/all_children_with_nested.md">All children with nested</a></td>
<td><code>$.store.*</code></td>
<td>
✗
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/nested_recursive.md">Nested recursive</a></td>
<td><code>$.store..price</code></td>
<td>
<a href="errors.md#Clojure_json-path___nested_recursive">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/deep_attribute.md">Deep attribute</a></td>
<td><code>$.store.book[*].author</code></td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/bracket_for_object_with_double_quotes.md">Bracket for object with double quotes</a></td>
<td><code>$["key"]</code></td>
<td>
<a href="errors.md#Clojure_json-path___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
✓
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___bracket_for_object_with_double_quotes">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/bracket_for_object_multiple_keys.md">Bracket for object multiple keys</a></td>
<td><code>$['key','another']</code></td>
<td>
<a href="errors.md#Clojure_json-path___bracket_for_object_multiple_keys">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___bracket_for_object_multiple_keys">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___bracket_for_object_multiple_keys">e</a>
</td>
<td>
✓
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___bracket_for_object_multiple_keys">e</a>
</td>
</tr>
<tr>
<td><a href="results/bracket_for_object.md">Bracket for object</a></td>
<td><code>$['key']</code></td>
<td>
<a href="errors.md#Clojure_json-path___bracket_for_object">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
✓
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___bracket_for_object">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
</tbody>
</table>

## Explanation

- ✓, the result of this tool matches what the majority says
- ✗, the result is different to multiple others
- ?, the results disagree, but there are not enough samples to be conclusive on which one is probably correct
- e, the tool failed executing the query and probably does not support this type of query
- ¹, those tools actually return a scalar as an array of one element. This difference is not included for the sake of this comparison.
