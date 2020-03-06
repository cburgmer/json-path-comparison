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

main() {
    local tmp_relative_majority_results="/tmp/build_relative_majority.$$"
    # with a canonical representation we can just rely on a simple checksum
    all_ok_implementation_results | xargs -n1 md5sum > "$tmp_relative_majority_results"

    local most_frequent_match
    local highest_agreement_checksum
    most_frequent_match="$(awk '{ print $1 }' < "$tmp_relative_majority_results" | sort | uniq -c | sort -n | tail -1)"
    highest_agreement_no="$(awk '{ print $1 }' <<< "$most_frequent_match")"
    highest_agreement_checksum="$(awk '{ print $2 }' <<< "$most_frequent_match")"

    local second_most_frequent_match
    local second_highest_agreement_no
    second_most_frequent_match="$(awk '{ print $1 }' < "$tmp_relative_majority_results" | sort | uniq -c | sort -n | tail -2 | head -1)"
    second_highest_agreement_no="$(awk '{ print $1 }' <<< "$second_most_frequent_match")"

    if [[ "$second_highest_agreement_no" -ne "$highest_agreement_no" ]]; then
        grep "^${highest_agreement_checksum} " < "$tmp_relative_majority_results" | awk '{ print $2 }' | xargs -n1 basename
    fi

    rm "$tmp_relative_majority_results"
}

main
