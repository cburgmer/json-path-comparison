#!/bin/bash
set -euo pipefail

readonly majority_result="$1"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
}

consensus() {
    local min_consensus="$1"
    local majority_size

    majority_size="$(tail -n +4 < "$majority_result" | wc -l)"

    if [[ "$majority_size" -ge $min_consensus ]]; then
        ./src/consensus.py < "$majority_result"
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
