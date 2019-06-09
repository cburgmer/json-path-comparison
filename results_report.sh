#!/bin/bash

set -euo pipefail

readonly tmp_results_report_dir="$1"

. shared.sh

all_results() {
    find "${tmp_results_report_dir}" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

tool_results_for_query() {
    local query="$1"
    find "${tmp_results_report_dir}/${query}" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort
}

compile_result_report() {
    local query
    local tool

    echo "## Results"
    echo
    while IFS= read -r query; do
        echo "<h3 id=\"${query}\">"
        echo "$(pretty_query_name "$query")"
        echo "</h3>"
        echo

        while IFS= read -r tool; do
            echo "<h4>"
            echo "$tool"
            echo "</h4>"
            pre_block < "${tmp_results_report_dir}/${query}/${tool}"
            echo
        done <<< "$(tool_results_for_query "$query")"
    done <<< "$(all_results)"
}

main() {
    compile_result_report
}

main
