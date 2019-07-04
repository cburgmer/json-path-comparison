#!/bin/bash

set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"
readonly target_dir="$3"
readonly report_output_dir="${target_dir}/results"

. src/shared.sh

all_query_results() {
    find "$consensus_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

is_outlier() {
    local query="$1"
    local implementation="$2"
    local matching_implementations="${consensus_dir}/${query}/matching_implementations"

    is_query_result_ok "${results_dir}/${query}/${implementation}" && ! grep "^${implementation}\$" < "$matching_implementations" > /dev/null
}

implementation_outliers() {
    local query="$1"
    local implementation
    while IFS= read -r implementation; do
        if is_outlier "$query" "$implementation"; then
            echo "$implementation"
        fi
    done <<< "$(find "${results_dir}/${query}" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort)"
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

gold_standard() {
    local query="$1"
    local matching_implementations="${consensus_dir}/${query}/matching_implementations"
    local first_matching_implementation
    first_matching_implementation="$(head -1 < "$matching_implementations")"

    query_result_payload "${results_dir}/${query}/${first_matching_implementation}"
}

compile_result_report_for_query() {
    local query="$1"
    local matching_implementations="${consensus_dir}/${query}/matching_implementations"
    local implementation

    echo "## $(pretty_query_name "$query")"
    echo

    echo "### Setup"
    output_setup "$query"
    echo

    echo "### Results"

    if [[ -s "$matching_implementations" ]]; then
        echo "####  Gold Standard (consensus)"
        echo
        gold_standard "$query" | pre_block
        echo
    fi

    while IFS= read -r implementation; do
        if [[ -z "$implementation" ]]; then
            break
        fi

        echo "#### $(pretty_implementation_name "$implementation")"
        echo
        query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
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
