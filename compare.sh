#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

run_query() {
    local tool="$1"
    local query="$2"
    local document="$query"/document.json
    local selector_file="$query"/selector
    local selector
    selector="$(cat "${selector_file}")"

    cat "$document" | "${script_dir}/tools/${tool}"/run.sh "$selector" > /dev/null
}

list_of_tools() {
    find "$script_dir"/tools -type d -depth 1 | xargs -n1 basename
}

compile_row() {
    local query="$1"
    local query_name
    local tool
    query_name="$(basename "$query")"

    echo "<tr>"
    echo "<td>${query_name}</td>"

    while IFS= read -r tool; do
        echo "<td>"
        if run_query "$tool" "$query"; then
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
