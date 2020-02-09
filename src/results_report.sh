#!/bin/bash

set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"
readonly query_dir="$3"
readonly query="$(basename "$query_dir")"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

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
    done <<< "$(all_implementations)"
}

implementation_errors() {
    local implementation
    while IFS= read -r implementation; do
        if ! is_query_result_ok "${results_dir}/${query}/${implementation}"; then
            echo "$implementation"
        fi
    done <<< "$(all_implementations)"
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
    local outliers
    local errors

    echo "# $(pretty_query_name "$query")"
    echo

    echo "## Setup"
    output_setup
    echo

    echo "## Results"

    if [[ -s "$matching_implementations" ]]; then
        echo "###  Consensus"
        echo
        gold_standard | pre_block
        echo
    fi

    outliers="$(implementation_outliers)"

    if [[ -n "$outliers" ]]; then
        echo "### Other responses"
        echo

        while IFS= read -r implementation; do
            echo "#### $(pretty_implementation_name "$implementation")"
            echo
            query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
            echo
        done <<< "$outliers"
    fi

    errors="$(implementation_errors)"

    if [[ -n "$errors" ]]; then
        echo "### Errors"
        echo

        while IFS= read -r implementation; do
            echo "#### $(pretty_implementation_name "$implementation")"
            echo
            query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
            echo
        done <<< "$errors"
    fi
}

main
