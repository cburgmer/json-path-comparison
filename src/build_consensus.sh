#!/bin/bash
set -euo pipefail

readonly tmp_result_dir="$1"
readonly tmp_consensus_dir="$2"

. src/shared.sh

tools_diverging_from() {
    local results_dir="$1"
    local tool="$2"
    local other_tool

    while IFS= read -r other_tool; do
        if ! diff "${results_dir}/${tool}" "${results_dir}/${other_tool}" > /dev/null; then
            echo "$other_tool"
        fi
    done <<< "$(find "$results_dir" -type f -print0 | xargs -0 -n1 basename | grep -v "^$tool\$")"
}

check_gold_standard() {
    local results_dir="$1"
    local tool="$2"
    local results_count
    results_count="$(find "$results_dir" -type f | wc -l)"

    if [[ $results_count -eq 1 ]]; then
        # nothing to compare to, might or might not be correct
        return 1
    fi

    if [[ $results_count -eq 2 ]]; then
        # for just 2 results both items need to match
        if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -eq 0 ]]; then
            return 0
        else
            return 1
        fi
    fi

    # If everybody agrees with me except one we are in a safe majority
    if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -lt 2 ]]; then
        return 0
    else
        return 1
    fi
}

consensus_on_query() {
    local query="$1"
    local results_dir="${tmp_result_dir}/${query}"
    local query_consensus_result_dir="${tmp_consensus_dir}/${query}"

    mkdir -p "$query_consensus_result_dir"
    mkdir -p "$query_consensus_result_dir"/outliers
    touch "$query_consensus_result_dir"/matching_tools

    while IFS= read -r tool; do
        if [[ -f "${results_dir}/${tool}" ]]; then
            if check_gold_standard "$results_dir" "$tool"; then
                cat "${results_dir}/${tool}" > "$query_consensus_result_dir"/gold_standard.json
                echo "$tool" >> "$query_consensus_result_dir"/matching_tools
            else
                cp "${results_dir}/${tool}" "$query_consensus_result_dir"/outliers
            fi
        fi
    done <<< "$(all_tools)"
}

build_consensus() {
    local query

    while IFS= read -r query; do
        consensus_on_query "$query"
    done <<< "$(all_queries)"
}

main() {
    build_consensus
}

main
