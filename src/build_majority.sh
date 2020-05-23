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
    local all_results
    local tmp_majority_with_multiple_matches_path="/tmp/majority_with_multiple_matches_path.$$"
    local tmp_majority_with_no_matches_path="/tmp/majority_with_no_matches_path.$$"
    all_results="$(all_ok_implementation_results)"

    ./src/majority_with_multiple_matches.py <<< "$all_results" > "$tmp_majority_with_multiple_matches_path"
    ./src/majority_with_no_matches.py <<< "$all_results" > "$tmp_majority_with_no_matches_path"

    if [[ "$(wc -l < "$tmp_majority_with_multiple_matches_path")" -gt "$(wc -l < "$tmp_majority_with_no_matches_path")" ]]; then
        cat "$tmp_majority_with_multiple_matches_path"
    else
        cat "$tmp_majority_with_no_matches_path"
    fi

    rm "$tmp_majority_with_multiple_matches_path"
    rm "$tmp_majority_with_no_matches_path"
}

main() {
    majority_members | xargs -n1 basename
}

main
