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
