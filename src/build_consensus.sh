#!/bin/bash
set -euo pipefail

readonly query_results="$1"

. src/shared.sh

all_ok_implementation_results() {
    while IFS= read -r result; do
        if is_query_result_ok "$result"; then
            echo "$result"
        fi
    done <<< "$(find "${query_results}" -type f)"
}

consensus() {
    local min_consensus="$1"

    local tmp_consensus_results="/tmp/build_consensus.$$"
    # with a canonical representation we can just rely on a simple checksum
    all_ok_implementation_results | xargs -n1 md5sum > "$tmp_consensus_results"

    local most_frequent_match
    most_frequent_match="$(awk '{ print $1 }' < "$tmp_consensus_results" | sort | uniq -c | sort -n | tail -1)"

    local highest_agreement_count
    local highest_agreement_checksum
    highest_agreement_count="$(awk '{ print $1 }' <<< "$most_frequent_match")"

    if [[ "$highest_agreement_count" -ge $min_consensus ]]; then
        highest_agreement_checksum="$(awk '{ print $2 }' <<< "$most_frequent_match")"
        grep "^${highest_agreement_checksum} " < "$tmp_consensus_results" | awk '{ print $2 }' | xargs -n1 basename
    fi

    rm "$tmp_consensus_results"
}

minimal_consensus() {
    local implementation_count
    implementation_count=$(find implementations -type d -depth 1 | wc -l)

    # ceil(half) and +1 so consensus always has 2 more members than other side
    echo $(( (implementation_count + 1) / 2 + 1))
}

main() {
    local min_consensus
    min_consensus=$(minimal_consensus)

    consensus "$min_consensus"
}

main
