#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly majority_result="$2"

. src/shared.sh

all_proposals() {
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

wrap_scalar_if_needed() {
    local query="$1"
    local implementation="$2"

    if [[ -f "./implementations/${implementation}/SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR" && -f "./queries/${query}/SCALAR_RESULT" ]]; then
        ./src/wrap_scalar.py | ./src/canonical_json.py
    else
        cat
    fi
}

gold_standard() {
    local first_matching_implementation
    first_matching_implementation="$(head -1 < "$majority_result")"

    local query
    query="$(basename "$query_results")"

    query_result_payload "${query_results}/${first_matching_implementation}" | wrap_scalar_if_needed "$query" "$first_matching_implementation"
}

proposal_equals() {
    local proposal="$1"
    local majority_result_payload="$2"
    local proposal_result_payload

    if ! is_query_result_ok "${query_results}/${proposal}"; then
        return 1
    fi

    proposal_result_payload="$(query_result_payload "${query_results}/${proposal}")"

    if [[ "$proposal_result_payload" != "$majority_result_payload" ]]; then
        return 1;
    fi

    return 0;
}

main() {
    local proposal
    local majority_result_payload

    if [[ ! -s "$majority_result" ]]; then
        return
    fi

    majority_result_payload="$(gold_standard)"

    while IFS= read -r proposal; do
        if proposal_equals "$proposal" "$majority_result_payload"; then
            echo "$proposal"
        fi
    done <<< "$(all_proposals)"
}

main
