#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly majority_result="$2"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
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

consensus() {
    local min_consensus="$1"
    local majority_size

    majority_size="$(wc -l < "$majority_result")"

    if [[ "$majority_size" -ge $min_consensus ]]; then
        gold_standard
    fi
}

minimal_consensus() {
    local implementation_count
    implementation_count=$(all_implementations | wc -l)

    # ceil(half) and +1 so consensus always has 2 more members than other side
    echo $(( (implementation_count + 1) / 2 + 1))
}

main() {
    local min_consensus
    min_consensus=$(minimal_consensus)

    consensus "$min_consensus"
}

main
