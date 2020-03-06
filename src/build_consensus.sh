#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly majority_result="$2"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
}

gold_standard() {
    local first_matching_implementation
    first_matching_implementation="$(head -1 < "$majority_result")"

    query_result_payload "${query_results}/${first_matching_implementation}"
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
