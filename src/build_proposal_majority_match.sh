#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly majority_result="$2"

. src/shared.sh

all_proposals() {
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

gold_standard() {
    head -2 < "$majority_result" | tail -1
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

    majority_result_payload="$(gold_standard | ./src/canonical_json.py)"

    while IFS= read -r proposal; do
        if proposal_equals "$proposal" "$majority_result_payload"; then
            echo "$proposal"
        fi
    done <<< "$(all_proposals)"
}

main
