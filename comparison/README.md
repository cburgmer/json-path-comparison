# Comparison of different implementations of JSONPath

This table makes no statement on the correctness of any of the implementations.
Outcomes are compared to the pool of other implementations, and judged based on a simple consensus.
A majority has to consist of half of all implementations (rounded up) + 1.
This guarantees that in case of a split on two sides, the majority wins by two votes.

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
<td><a href="results/array_index.md">Array index</a></td>
<td><code>$[2]</code></td>
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
<td><a href="results/array_index_last.md">Array index last</a></td>
<td><code>$[-1]</code></td>
<td>
<a href="errors.md#Clojure_json-path___array_index_last">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___array_index_last">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___array_index_last">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___array_index_last">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/array_index_out_of_bounds.md">Array index out of bounds</a></td>
<td><code>$[1]</code></td>
<td>
<a href="errors.md#Clojure_json-path___array_index_out_of_bounds">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___array_index_out_of_bounds">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___array_index_out_of_bounds">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___array_index_out_of_bounds">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___array_index_out_of_bounds">e</a>
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___array_index_out_of_bounds">e</a>
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/array_index_slice_end_out_of_bounds.md">Array index slice end out of bounds</a></td>
<td><code>$[1:10]</code></td>
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
<td><a href="results/array_index_slice_last_no_end.md">Array index slice last no end</a></td>
<td><code>$[-1:]</code></td>
<td>
<a href="errors.md#Clojure_json-path___array_index_slice_last_no_end">e</a>
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
<td><a href="results/array_index_slice_no_start_no_end.md">Array index slice no start no end</a></td>
<td><code>$[:]</code></td>
<td>
<a href="errors.md#Clojure_json-path___array_index_slice_no_start_no_end">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___array_index_slice_no_start_no_end">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___array_index_slice_no_start_no_end">e</a>
</td>
</tr>
<tr>
<td><a href="results/array_index_slice_only_end.md">Array index slice only end</a></td>
<td><code>$[:2]</code></td>
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
<td><a href="results/array_index_slice_only_start.md">Array index slice only start</a></td>
<td><code>$[1:]</code></td>
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
<td><a href="results/array_index_slice_start_end.md">Array index slice start end</a></td>
<td><code>$[1:3]</code></td>
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
<td><a href="results/array_index_slice_start_end_step.md">Array index slice start end step</a></td>
<td><code>$[0:3:2]</code></td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___array_index_slice_start_end_step">e</a>
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___array_index_slice_start_end_step">e</a>
</td>
</tr>
<tr>
<td><a href="results/array_index_slice_start_equals_end.md">Array index slice start equals end</a></td>
<td><code>$[0:0]</code></td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_Goessner___array_index_slice_start_equals_end">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/array_index_slice_start_plus_one.md">Array index slice start plus one</a></td>
<td><code>$[0:1]</code></td>
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
<td><a href="results/array_index_union.md">Array index union</a></td>
<td><code>$[0,1]</code></td>
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
<td><a href="results/key_bracket_notation.md">Key bracket notation</a></td>
<td><code>$['key']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation">e</a>
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
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_union.md">Key bracket notation union</a></td>
<td><code>$['key','another']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_union">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___key_bracket_notation_union">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_union">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___key_bracket_notation_union">e</a>
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_double_quotes.md">Key bracket notation with double quotes</a></td>
<td><code>$["key"]</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_double_quotes">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___key_bracket_notation_with_double_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___key_bracket_notation_with_double_quotes">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_double_quotes">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_number.md">Key bracket notation with number</a></td>
<td><code>$['0']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_number">e</a>
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
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_number">e</a>
</td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_number_without_quotes.md">Key bracket notation with number without quotes</a></td>
<td><code>$[0]</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_number_without_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_bracket_notation_with_number_without_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_number_without_quotes">e</a>
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___key_bracket_notation_with_number_without_quotes">e</a>
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_single_quote.md">Key bracket notation with single quote</a></td>
<td><code>$['single'quote']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_single_quote">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_bracket_notation_with_single_quote">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_single_quote">e</a>
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___key_bracket_notation_with_single_quote">e</a>
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___key_bracket_notation_with_single_quote">e</a>
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_single_quote_escaped.md">Key bracket notation with single quote escaped</a></td>
<td><code>$['single\'quote']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___key_bracket_notation_with_single_quote_escaped">e</a>
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_with_special_characters.md">Key bracket notation with special characters</a></td>
<td><code>$['fun:\"characters']</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_with_special_characters">e</a>
</td>
<td>
<a href="errors.md#JavaScript_Goessner___key_bracket_notation_with_special_characters">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_bracket_notation_with_special_characters">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___key_bracket_notation_with_special_characters">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_with_special_characters">e</a>
</td>
<td>
?
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/key_bracket_notation_without_quotes.md">Key bracket notation without quotes</a></td>
<td><code>$[key]</code></td>
<td>
<a href="errors.md#Clojure_json-path___key_bracket_notation_without_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_bracket_notation_without_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_bracket_notation_without_quotes">e</a>
</td>
<td>
?
</td>
<td>
<a href="errors.md#Rust_jsonpath_lib___key_bracket_notation_without_quotes">e</a>
</td>
</tr>
<tr>
<td><a href="results/key_on_array.md">Key on array</a></td>
<td><code>$.key</code></td>
<td>
?
</td>
<td>
<a href="errors.md#JavaScript_Goessner___key_on_array">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath___key_on_array">e</a>
</td>
<td>
<a href="errors.md#JavaScript_jsonpath-plus___key_on_array">e</a>
</td>
<td>
<a href="errors.md#Java_com.jayway.jsonpath___key_on_array">e</a>
</td>
<td>
<a href="errors.md#Python_jsonpath-ng___key_on_array">e</a>
</td>
<td>
?
</td>
</tr>
<tr>
<td><a href="results/key_with_array_value.md">Key with array value</a></td>
<td><code>$.array</code></td>
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
<td><a href="results/key_with_deep_query.md">Key with deep query</a></td>
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
<td><a href="results/recursive_key.md">Recursive key</a></td>
<td><code>$..key</code></td>
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
<td><a href="results/recursive_wildcard.md">Recursive wildcard</a></td>
<td><code>$..*</code></td>
<td>
<a href="errors.md#Clojure_json-path___recursive_wildcard">e</a>
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
<td><a href="results/recursive_with_nested_object.md">Recursive with nested object</a></td>
<td><code>$.store..price</code></td>
<td>
<a href="errors.md#Clojure_json-path___recursive_with_nested_object">e</a>
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
<td><a href="results/wildcard_on_array.md">Wildcard on array</a></td>
<td><code>$.key.*</code></td>
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
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/wildcard_on_object.md">Wildcard on object</a></td>
<td><code>$.key.*</code></td>
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
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td><a href="results/wildcard_with_nested_object.md">Wildcard with nested object</a></td>
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
</tbody>
</table>

## Explanation

- ✓, the result of this implementation matches the majority of results
- ✗, the result does not match a majority
- ?, no clear consensus amongst the implementations (the results disagree and/or a lot of implementations error)
- e, the implementation failed executing the query and probably does not support this type of query
- ¹, those implementations actually return a scalar as an array of one element. This difference is not included for the sake of this comparison.
