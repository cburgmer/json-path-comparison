#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

run_query() {
    local tool="$1"
    local selector="$2"
    local document="$3"

    "${script_dir}/tools/${tool}"/run.sh "$selector" < "$document" > /dev/null
}

list_of_tools() {
    find "$script_dir"/tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

capitalize() {
    local s="$1"
    echo "$(tr a-z A-Z <<< ${s:0:1})${s:1}"
}

pretty_query_name() {
    local query="$1"

    capitalize "$(basename "$query")" | tr '_' ' '
}

compile_row() {
    local query="$1"
    local selector_file="$query"/selector
    local document="$query"/document.json
    local selector
    local query_name
    local tool
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td>${query_name}</td>"
    echo "<td><code>${selector}</code></td>"

    while IFS= read -r tool; do
        echo "<td>"
        if run_query "$tool" "$selector" "$document"; then
            echo "✓"
        else
            echo "✗"
        fi
        echo "</td>"
    done <<< "$(list_of_tools)"
    echo "</tr>"
}

pretty_print_tool_name() {
    local tool="$1"
    local language
    local library
    language="$(sed "s/\([^_]*\)_.*/\1/" <<< "$tool")"
    library="$(sed "s/[^_]*_\(.*\)/\1/" <<< "$tool")"
    echo "${language} (${library})"
}

header_row() {
    local tool
    local tool_name

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r tool; do
        tool_name="$(pretty_print_tool_name "$tool")"
        echo "<th>${tool_name}</th>"
    done <<< "$(list_of_tools)"
    echo "</tr>"
}


main() {
    echo "# Comparison of different implementations of JSONPath"
    echo
    echo "<table>"

    echo "<thead>"
    header_row
    echo "</thead>"

    echo "<tbody>"

    while IFS= read -r query; do
        compile_row "$query"
    done <<< "$(find "$script_dir"/queries -type d -depth 1)"

    echo "</tbody>"
    echo "</table>"
}

main
