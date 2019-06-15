#!/bin/bash

set -euo pipefail

readonly tmp_consensus_dir="$1"
readonly target_dir="$2"
readonly report_output_dir="${target_dir}/results"

. src/shared.sh

all_query_results() {
    find "$tmp_consensus_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

implementation_outliers() {
    local query="$1"
    find "${tmp_consensus_dir}/${query}/outliers" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort
}

output_setup() {
    local query="$1"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    echo "Selector: \`${selector}\`"
    echo

    pre_block < "$document"
}

compile_result_report_for_query() {
    local query="$1"
    local consensus_dir="${tmp_consensus_dir}/${query}"
    local gold_standard="${consensus_dir}/gold_standard.json"
    local implementation

    echo "## $(pretty_query_name "$query")"
    echo

    echo "### Setup"
    output_setup "$query"
    echo

    echo "### Results"

    if [[ -f "$gold_standard" ]]; then
        echo "####  Gold Standard (consensus)"
        echo
        pre_block < "$gold_standard"
        echo
    fi

    while IFS= read -r implementation; do
        if [[ -z "$implementation" ]]; then
            break
        fi

        echo "#### $(pretty_implementation_name "$implementation")"
        echo
        pre_block < "${tmp_consensus_dir}/${query}/outliers/${implementation}"
        echo
    done <<< "$(implementation_outliers "$query")"
}

main() {
    rm -rf "$report_output_dir"
    mkdir -p "$report_output_dir"

    while IFS= read -r query; do
        compile_result_report_for_query "$query" > "${report_output_dir}/${query}.md"
    done <<< "$(all_query_results)"
}

main
