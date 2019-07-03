#!/bin/bash
set -euo pipefail

readonly tmp_results_dir="$1"
readonly tmp_consensus_dir="$2"

. src/shared.sh

all_query_results() {
    find "$tmp_results_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename
}

all_implementation_results() {
    local query="$1"
    find "${tmp_results_dir}/${query}" -type f -print0 | xargs -0 -n1 basename
}

implementations_agreeing_to() {
    local query="$1"
    local implementation="$2"
    local other_implementation

    while IFS= read -r other_implementation; do
        if diff "${tmp_results_dir}/${query}/${implementation}" "${tmp_results_dir}/${query}/${other_implementation}" > /dev/null; then
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

consensus_on_query() {
    local query="$1"
    local min_consensus="$2"
    local results_dir="${tmp_results_dir}/${query}"
    local query_consensus_result_dir="${tmp_consensus_dir}/${query}"

    mkdir -p "$query_consensus_result_dir"
    mkdir -p "$query_consensus_result_dir"/outliers
    mkdir -p "$query_consensus_result_dir"/errors
    touch "$query_consensus_result_dir"/matching_implementations

    while IFS= read -r implementation; do
        if is_query_result_ok "${tmp_results_dir}/${query}/${implementation}"; then
            if check_gold_standard "$query" "$implementation" "$min_consensus"; then
                cat "${results_dir}/${implementation}" > "$query_consensus_result_dir"/gold_standard
                echo "$implementation" >> "$query_consensus_result_dir"/matching_implementations
            else
                cp "${results_dir}/${implementation}" "$query_consensus_result_dir"/outliers
            fi
        else
            cp "${results_dir}/${implementation}" "$query_consensus_result_dir"/errors
        fi
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
