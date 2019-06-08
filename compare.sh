#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly tmp_dir="/tmp/compare_jsonpath.$$"

pretty_tool_name() {
    local tool="$1"
    local language
    local library
    language="$(sed "s/\([^_]*\)_.*/\1/" <<< "$tool")"
    library="$(sed "s/[^_]*_\(.*\)/\1/" <<< "$tool")"
    echo "${language} (${library})"
}

capitalize() {
    local s="$1"
    echo "$(tr a-z A-Z <<< ${s:0:1})${s:1}"
}

pretty_query_name() {
    local query="$1"

    capitalize "$query" | tr '_' ' '
}

run_query() {
    local tool="$1"
    local selector="$2"
    local document="$3"

    "${script_dir}/tools/${tool}"/run.sh "$selector" < "$document" > /dev/null
}

list_of_tools() {
    find "$script_dir"/tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

compile_row() {
    local query="$1"
    local query_dir="${script_dir}/queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    local query_name
    local tool
    local error_key
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td>${query_name}</td>"
    echo "<td><code>${selector}</code></td>"

    while IFS= read -r tool; do
        error_key="${tool}___${query}"
        echo "<td>"
        if run_query "$tool" "$selector" "$document" 2> "${tmp_dir}/${error_key}"; then
            echo "✓"
            rm "${tmp_dir}/${error_key}"
        else
            echo "<a href=\"#${error_key}\">✗</a>"
        fi
        echo "</td>"
    done <<< "$(list_of_tools)"
    echo "</tr>"
}

all_errors() {
    find "${tmp_dir}" -type f -depth 1 -print0| xargs -0 -n1 basename | sort
}

pre_block() {
    sed 's/^/    /'
}

nice_error_headline() {
    local error_key="$1"
    local query
    local tool
    query="$(sed "s/.*___\(.*\)/\1/" <<< "$error_key")"
    tool="$(sed "s/\(.*\)___.*/\1/" <<< "$error_key")"

    echo "$(pretty_tool_name "$tool"), $(pretty_query_name "$query")"
}

compile_error_report() {
    echo "## Error output"
    echo
    while IFS= read -r error_key; do
        echo "<h3 id=\"${error_key}\">"
        echo "$(nice_error_headline "$error_key")"
        echo "</h3>"
        echo
        pre_block < "${tmp_dir}/${error_key}"
        echo
    done <<< "$(all_errors)"
}

header_row() {
    local tool
    local tool_name

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r tool; do
        tool_name="$(pretty_tool_name "$tool")"
        echo "<th>${tool_name}</th>"
    done <<< "$(list_of_tools)"
    echo "</tr>"
}

all_queries() {
    find "$script_dir"/queries -type d -depth 1 | xargs -n1 basename
}

main() {
    mkdir -p "$tmp_dir"

    echo "# Comparison of different implementations of JSONPath"
    echo
    echo "<table>"

    echo "<thead>"
    header_row
    echo "</thead>"

    echo "<tbody>"

    while IFS= read -r query; do
        compile_row "$query"
    done <<< "$(all_queries)"

    echo "</tbody>"
    echo "</table>"
    echo "
## Explanation

- ✓ means the tool successfully returns a query
- ✗ says the tool failed producing output"

    echo
    compile_error_report
    rm -r "$tmp_dir"
}

main
