#!/bin/bash
set -euo pipefail

readonly query_results="$1"

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
}

all_implementation_results() {
    local implementation
    while IFS= read -r implementation; do
        echo "${query_results}/${implementation}"
    done <<< "$(all_implementations)"
}

majority_members() {
    all_implementation_results | ./src/majority.py
}

main() {
    majority_members | xargs -n1 basename
}

main
