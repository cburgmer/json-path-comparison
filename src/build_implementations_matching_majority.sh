#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly majority_result="$2"

. ./src/shared.sh

all_implementations_and_proposals() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
}

matching_majority_result() {
    if implementation_returns_not_found_as_error "$implementation" && grep '^not-found-consensus' < "${majority_result}"; then
        return
    fi
    if implementation_returns_not_found_for_scalar_queries_as_error "$implementation" && grep '^scalar-not-found-consensus' < "${majority_result}"; then
        return
    fi
    if is_scalar_implementation "$implementation" && grep '^scalar-consensus' < "${majority_result}"; then
        return
    fi
    grep '^consensus' < "${majority_result}"
}

equals_majority_result() {
    local implementation="$1"
    local majority
    majority="$(matching_majority_result "$implementation" | cut -f2)"

    if [[ "$majority" == "NOT_FOUND" ]] && is_query_result_not_found "${query_results}/${implementation}"; then
        return 0;
    fi

    if [[ "$majority" == "NOT_SUPPORTED" ]] && is_query_not_supported "${query_results}/${implementation}"; then
        return 0;
    fi

    test "$(query_result_payload "${query_results}/${implementation}")" == "$majority"
}

main() {
    while IFS= read -r implementation; do
        if equals_majority_result "$implementation"; then
            echo "$implementation"
        fi
    done <<< "$(all_implementations_and_proposals)"
}

main
