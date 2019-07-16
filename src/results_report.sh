#!/bin/bash

set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"
readonly query_dir="$3"
readonly query="$(basename "$query_dir")"

. src/shared.sh

is_outlier() {
    local implementation="$1"
    local matching_implementations="${consensus_dir}/${query}"

    is_query_result_ok "${results_dir}/${query}/${implementation}" && ! grep "^${implementation}\$" < "$matching_implementations" > /dev/null
}

implementation_outliers() {
    local implementation
    while IFS= read -r implementation; do
        if is_outlier "$implementation"; then
            echo "$implementation"
        fi
    done <<< "$(find "${results_dir}/${query}" -type f -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | sort)"
}

output_setup() {
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    echo "Selector: \`${selector}\`"
    echo

    pre_block < "$document"
}

gold_standard() {
    local matching_implementations="${consensus_dir}/${query}"
    local first_matching_implementation
    first_matching_implementation="$(head -1 < "$matching_implementations")"

    query_result_payload "${results_dir}/${query}/${first_matching_implementation}"
}

main() {
    local matching_implementations="${consensus_dir}/${query}"
    local implementation

    echo "## $(pretty_query_name "$query")"
    echo

    echo "### Setup"
    output_setup
    echo

    echo "### Results"

    if [[ -s "$matching_implementations" ]]; then
        echo "####  Gold Standard (consensus)"
        echo
        gold_standard | pre_block
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
    done <<< "$(implementation_outliers)"
}

main
