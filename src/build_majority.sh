#!/bin/bash
set -euo pipefail

readonly query_results="$1"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename
}

all_ok_implementation_results() {
    local implementation
    while IFS= read -r implementation; do
        if is_query_result_ok "${query_results}/${implementation}"; then
            echo "${query_results}/${implementation}"
        fi
    done <<< "$(all_implementations)"
}

majority_members() {
    all_ok_implementation_results | ./src/majority.py
}

main() {
    majority_members | xargs -n1 basename
}

main
