#!/bin/bash
set -euo pipefail

readonly results_dir="$1"
readonly tmp_consensus_dir="$2"

. src/shared.sh

all_query_results() {
    find "$results_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename
}

all_implementation_results() {
    local query="$1"
    find "${results_dir}/${query}" -type f -print0 | xargs -0 -n1 basename
}

implementations_agreeing_to() {
    local query="$1"
    local implementation="$2"
    local other_implementation

    while IFS= read -r other_implementation; do
        if diff "${results_dir}/${query}/${implementation}" "${results_dir}/${query}/${other_implementation}" > /dev/null; then
            echo "$other_implementation"
        fi
    done <<< "$(all_implementation_results "$query" | grep -v "^$implementation\$")"
}

check_gold_standard() {
    local query="$1"
    local implementation="$2"
    local min_consensus="$3"
    local min_no_of_others=$((min_consensus - 1))

    if [[ $(implementations_agreeing_to "$query" "$implementation" | wc -l) -ge $min_no_of_others ]]; then
        return 0
    else
        return 1
    fi
}

check_consensus_on_query_result() {
    local query="$1"
    local implementation="$2"
    local min_consensus="$3"
    local query_consensus_result_dir="$4"
    local query_result="${results_dir}/${query}/${implementation}"
    if is_query_result_ok "$query_result"; then
        if check_gold_standard "$query" "$implementation" "$min_consensus"; then
            cat "$query_result" > "$query_consensus_result_dir"/gold_standard
            echo "$implementation" >> "$query_consensus_result_dir"/matching_implementations
        else
            cp "$query_result" "$query_consensus_result_dir"/outliers
        fi
    else
        cp "$query_result" "$query_consensus_result_dir"/errors
    fi
}

consensus_on_query() {
    local query="$1"
    local min_consensus="$2"
    local query_consensus_result_dir="${tmp_consensus_dir}/${query}"

    mkdir -p "$query_consensus_result_dir"
    mkdir -p "$query_consensus_result_dir"/outliers
    mkdir -p "$query_consensus_result_dir"/errors
    touch "$query_consensus_result_dir"/matching_implementations

    while IFS= read -r implementation; do
        check_consensus_on_query_result "$query" "$implementation" "$min_consensus" "$query_consensus_result_dir"
    done <<< "$(all_implementation_results "$query")"
}

minimal_consensus() {
    local implementation_count
    implementation_count=$(find implementations -type d -depth 1 | wc -l)

    # ceil(half) and +1 so consensus always has 2 more members than other side
    echo $(( (implementation_count + 1) / 2 + 1))
}

clean_previous_results() {
    local query="$1"
    rm -rf "${tmp_consensus_dir:?}/${query}"
}

build_consensus() {
    local query
    local min_consensus
    min_consensus=$(minimal_consensus)

    while IFS= read -r query; do
        clean_previous_results "$query"
        consensus_on_query "$query" "$min_consensus"
    done <<< "$(all_query_results)"
}

main() {
    build_consensus
}

main
