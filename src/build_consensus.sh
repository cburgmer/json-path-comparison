#!/bin/bash
set -euo pipefail

readonly query_results="$1"
readonly query_consensus="$2"

. src/shared.sh

all_implementation_results() {
    find "${query_results}" -type f -print0 | xargs -0 -n1 basename
}

implementations_agreeing_to() {
    local implementation="$1"
    local other_implementation

    while IFS= read -r other_implementation; do
        if diff "${query_results}/${implementation}" "${query_results}/${other_implementation}" > /dev/null; then
            echo "$other_implementation"
        fi
    done <<< "$(all_implementation_results | grep -v "^$implementation\$")"
}

check_gold_standard() {
    local implementation="$1"
    local min_consensus="$2"
    local min_no_of_others=$((min_consensus - 1))

    if [[ $(implementations_agreeing_to "$implementation" | wc -l) -ge $min_no_of_others ]]; then
        return 0
    else
        return 1
    fi
}

check_consensus_on_query_result() {
    local implementation="$1"
    local min_consensus="$2"
    local query_result="${query_results}/${implementation}"
    if is_query_result_ok "$query_result"; then
        if check_gold_standard "$implementation" "$min_consensus"; then
            cat "$query_result" > "$query_consensus"/gold_standard
            echo "$implementation" >> "$query_consensus"/matching_implementations
        else
            cp "$query_result" "$query_consensus"/outliers
        fi
    else
        cp "$query_result" "$query_consensus"/errors
    fi
}

consensus_on_query() {
    local min_consensus="$1"

    mkdir -p "$query_consensus"
    mkdir -p "$query_consensus"/outliers
    mkdir -p "$query_consensus"/errors
    touch "$query_consensus"/matching_implementations

    while IFS= read -r implementation; do
        check_consensus_on_query_result "$implementation" "$min_consensus"
    done <<< "$(all_implementation_results)"
}

minimal_consensus() {
    local implementation_count
    implementation_count=$(find implementations -type d -depth 1 | wc -l)

    # ceil(half) and +1 so consensus always has 2 more members than other side
    echo $(( (implementation_count + 1) / 2 + 1))
}

clean_previous_results() {
    rm -rf "${query_consensus:?}"
}

main() {
    local min_consensus

    min_consensus=$(minimal_consensus)

    clean_previous_results
    consensus_on_query "$min_consensus"
}

main
