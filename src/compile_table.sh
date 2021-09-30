#!/bin/bash
set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"
readonly implementations_matching_majority_dir="$3"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_proposals() {
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_queries() {
    find ./queries -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | ./src/sort_queries.py
}

is_in_majority() {
    local query="$1"
    local implementation="$2"
    grep "^${implementation}\$" < "${implementations_matching_majority_dir}/${query}"> /dev/null
}

has_consensus() {
    local query="$1"
    test -s "${consensus_dir}/${query}"
}

give_mark() {
    local query="$1"
    local implementation="$2"

    # Error?
    if is_query_error "${results_dir}/${query}/${implementation}"; then
        echo "<a href=\"results/${query}.html#${implementation}\">e</a>"
        return
    fi

    if is_in_majority "$query" "$implementation"; then
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.html#consensus\">✓</a>"
        else
            echo "<a href=\"results/${query}.html#${implementation}\">➚</a>"
        fi
    else
        # So we are an outlier, but is there actually any gold standard?
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.html#${implementation}\">✗</a>"
        else
            echo "<a href=\"results/${query}.html#${implementation}\">➘</a>"
        fi
    fi
}

fix_line_break_on_osx() {
    tr -d '\n'
}

compile_row() {
    local query="$1"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local selector
    local query_name
    local implementation
    local proposal
    local status
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    if has_consensus "$query"; then
        status="consensus"
    else
        status="no_consensus"
    fi;

    echo "<tr id=\"${query}\" class=\"${status}\">"
    echo "<td>"
    echo "<a href=\"#${query}\" style=\"color: lightgrey;\">#</a>"
    echo "<a href=\"results/${query}.html\">${query_name}</a>"
    if [[ -f "${query_dir}/ALLOW_UNORDERED" ]]; then
        echo "⁴"
    fi
    echo "</td>"
    echo "<td>"
    if [[ -z "$selector" ]]; then
        echo "<em>n/a</em>"
    else
        echo -n "<code>"
        echo -n "$selector" | html_escape | fix_line_break_on_osx
        echo "</code>"
    fi
    echo "</td>"

    while IFS= read -r implementation; do
        echo "<td>"
        give_mark "$query" "$implementation"
        echo "</td>"
    done <<< "$(all_implementations)"

    while IFS= read -r proposal; do
        echo "<td class=\"proposal\">"
        give_mark "$query" "$proposal"
        echo "</td>"
    done <<< "$(all_proposals)"

    echo "</tr>"
}

implementation_language_header() {
    local category_entry
    local category
    local count

    while IFS= read -r category_entry; do
        category="$(awk '{print $2}' <<< "$category_entry")"
        count="$(awk '{print $1}' <<< "$category_entry")"

        echo "<th style=\"position: sticky; top: 0; background: #ffffffaa;\" colspan=\"${count}\">"
        echo "<span style=\"writing-mode: vertical-rl;\">"
        echo "${category}"
        echo "</span>"
        echo "</th>"
    done <<< "$(all_implementations | sed "s/\([^_]*\)_.*/\1/" | uniq -c)"

    count="$(all_proposals | wc -l | tr -d ' ')"
    echo "<th style=\"position: sticky; top: 0; background: #ffffffaa;\" colspan=\"${count}\"></th>"
}

wrap_with_link() {
    local path="$1"
    if [[ -f "${path}/LINK" ]]; then
        echo "<a href=\"$(cat "${path}/LINK")\">"
        cat
        echo "</a>"
    else
        cat
    fi
}

header_row() {
    local implementation
    local proposal

    echo "<tr style=\"background: none\">"
    echo "<th style=\"background: #ffffffaa;\"></th>"
    echo "<th style=\"background: #ffffffaa;\"></th>"
    implementation_language_header
    echo "</tr>"

    echo "<tr style=\"background: none\">"
    echo "<th style=\"background: #f6f8faaa;\"></th>"
    echo "<th style=\"background: #f6f8faaa;\"></th>"
    while IFS= read -r implementation; do
        echo "<th style=\"background: #f6f8faaa;\">"
        echo "<div style=\"writing-mode: vertical-rl; white-space: nowrap;\">"
        sed "s/[^_]*_\(.*\)/\1/" <<< "$implementation" | wrap_with_link "./implementations/${implementation}"
        if implementation_returns_scalar_for_single_possible_match "$implementation"; then
            echo "¹"
        fi
        if implementation_returns_not_found_as_error "$implementation"; then
            echo "²"
        fi
        if implementation_returns_not_found_for_scalar_queries_as_error "$implementation"; then
            echo "³"
        fi
        echo "</div>"
        echo "</th>"
    done <<< "$(all_implementations)"

    while IFS= read -r proposal; do
        echo "<th style=\"background: #fbfdffaa;\">"
        echo "<div style=\"writing-mode: vertical-rl; white-space: nowrap;\">"
        tr '_' ' ' <<< "$proposal" | wrap_with_link "./proposals/${proposal}"
        echo "</div>"
        echo "</th>"
    done <<< "$(all_proposals)"

    echo "</tr>"
}

table() {
    echo "<h1>JSONPath Comparison</h1>

<p>See how <a href=\"https://goessner.net/articles/JsonPath/\">JSONPath</a> is implemented across different languages.
See the <a href=\"https://github.com/cburgmer/json-path-comparison/blob/master/FAQ.md\">FAQ</a> for why we are doing this and where the results come from.</p>
"
    echo "
<h2>Explanation</h2>

<ul>
<li>✓ The result of this implementation matches the consensus of results.</li>
<li>✗ The result does not match the consensus.</li>
<li>➚ and ➘: no clear consensus amongst the implementations, but ➚ indicates a majority (and possible future consensus).</li>
<li>e The implementation failed executing the query.</li>
<li>¹ This implementation returns a single value where only one match is possible (instead of an array of a single value).</li>
<li>² This implementation returns a specific <em>not found</em> value if a query doesn't result in any matches.</li>
<li>³ This implementation returns a specific <em>not found</em> value if a query that would regularly return a single match results in no match.</li>
<li>⁴ It is unclear whether results for this query have a defined order, and some implementations might apply different and even non-deterministic ordering. For comparison the results are sorted into a canonical order.</li>
</ul>
"

    echo
    echo "<table style=\"overflow: unset;\">" # Need to reset style for sticky headers

    echo "<thead style=\"position: sticky; top: 0;\">"
    header_row
    echo "</thead>"

    echo "<tbody>"

    while IFS= read -r query; do
        compile_row "$query"
    done <<< "$(all_queries)"

    echo "</tbody>"
    echo "</table>"
}

adjust_css() {
    cat
    cat <<EOF
<style>
/* Make room for more columns */
.markdown-body table td, .markdown-body table th {
  padding: 6px 9px;
}
</style>
EOF
}

table_consensus_colouring() {
    cat
    # Make sure the selector is more specific than the markdown CSS
    cat <<EOF
<style>
.markdown-body tbody tr.consensus:nth-child(2n+1) {
  background: #eff;
}
.markdown-body tbody tr.consensus:nth-child(2n) {
  background: #e9f8fa;
}
.markdown-body tbody tr.no_consensus {
  background: #fff;
}
</style>
EOF
}

highlight_effect() {
    cat
    cat <<EOF
<style>
h3:target,
h4:target,
tbody tr:target,
tbody tr:hover {
  background-color: #ffa !important;
}
</style>
EOF
}

proposal() {
    cat
    cat <<EOF
<style>
.markdown-body tbody .proposal {
  background-color: #fff8;
}
</style>
EOF
}

main() {
    table | beautiful_html | adjust_css | table_consensus_colouring | highlight_effect | proposal
}

main
