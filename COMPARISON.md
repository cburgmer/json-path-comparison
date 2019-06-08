# Comparison of different implementations of JSONPath

<table>
<thead>
<tr>
<th></th>
<th></th>
<th>Clojure (json-path)</th>
<th>Rust (jsonpath_lib)</th>
</tr>
</thead>
<tbody>
<tr>
<td>Array index step end</td>
<td><code>$.book[:2]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Recursive attribute</td>
<td><code>$..author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Last array index</td>
<td><code>$.book[-1:]</code></td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All elements</td>
<td><code>$..*</code></td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start end</td>
<td><code>$.book[1:3]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start end step</td>
<td><code>$.book[0:3:2]</code></td>
<td>
✓
</td>
<td>
✗
</td>
</tr>
<tr>
<td>Array index</td>
<td><code>$.book[2]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Deep attribute</td>
<td><code>$.store.book[*].author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Bracket for object with double quotes</td>
<td><code>$["key"]</code></td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Root</td>
<td><code>$</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>All children</td>
<td><code>$..author</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index step start</td>
<td><code>$.book[1:]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Array index union</td>
<td><code>$.book[0,1]</code></td>
<td>
✓
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Nested recursive</td>
<td><code>$.store..price</code></td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
<tr>
<td>Bracket for object</td>
<td><code>$['key']</code></td>
<td>
✗
</td>
<td>
✓
</td>
</tr>
</tbody>
</table>

## Explanation

- ✓ means the tool successfully returns a query
- ✗ says the tool failed producing output
