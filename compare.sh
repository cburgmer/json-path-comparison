#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly tmp_error_report_dir="/tmp/compare_jsonpath.errors.$$"
readonly tmp_result_dir="/tmp/compare_jsonpath.results.$$"

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

    "${script_dir}/tools/${tool}"/run.sh "$selector" < "$document"
}

list_of_tools() {
    find "$script_dir"/tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

compare_results() {
    local results_dir="$1"
    if [[ $(find "$results_dir" -type f | wc -l) -gt 1 ]]; then
        if diff "$results_dir"/* > /dev/null; then
            echo "✓"
        else
            echo "✗"
        fi
    else
        echo "?"
    fi
}

compile_row() {
    local query="$1"
    local query_dir="${script_dir}/queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local results_dir="${tmp_result_dir}/${query}"
    local selector
    local query_name
    local tool
    local error_key
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td>${query_name}</td>"
    echo "<td><code>${selector}</code></td>"

    mkdir -p "$results_dir"

    while IFS= read -r tool; do
        error_key="${tool}___${query}"
        echo "<td>"
        if run_query "$tool" "$selector" "$document" > "${results_dir}/${tool}" 2> "${tmp_error_report_dir}/${error_key}"; then
            echo ""
            rm "${tmp_error_report_dir}/${error_key}"
            jp < "${results_dir}/${tool}" > "${results_dir}/${tool}.json"
        else
            echo "<a href=\"#${error_key}\">error</a>"
        fi
        rm "${results_dir}/${tool}"
        echo "</td>"
    done <<< "$(list_of_tools)"

    echo "<td>"
    compare_results "$results_dir"
    echo "</td>"

    echo "</tr>"
}

all_errors() {
    find "${tmp_error_report_dir}" -type f -depth 1 -print0| xargs -0 -n1 basename | sort
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
        pre_block < "${tmp_error_report_dir}/${error_key}"
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
    echo "<th>Results align?</th>"
    echo "</tr>"
}

all_queries() {
    find "$script_dir"/queries -type d -depth 1 -print0 \
        | xargs -0 -n1 -I% sh -c 'echo "$(cat %/selector)\t%"' \
        | sort \
        | cut -f2 \
        | xargs -n1 basename
}

main() {
    mkdir -p "$tmp_error_report_dir"
    mkdir -p "$tmp_result_dir"

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

- ✓ means the tools agree on the results
- ✗ indicates that the results are different, and one of the tools is probably wrong
- ? means there are not enough candidates available to check for correctness
- \`error\` says the tool failed executing the query"

    echo
    compile_error_report

    rm -r "$tmp_error_report_dir"
    rm -r "$tmp_result_dir"
}

main
