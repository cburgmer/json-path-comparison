#!/bin/bash
set -euo pipefail

readonly tmp_results_dir="$1"
readonly tmp_consensus_dir="$2"

. src/shared.sh

all_query_results() {
    find "$tmp_results_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename
}

all_tool_results() {
    local query="$1"
    find "${tmp_results_dir}/${query}" -type f -print0 | xargs -0 -n1 basename
}

tools_agreeing_to() {
    local results_dir="$1"
    local tool="$2"
    local other_tool

    while IFS= read -r other_tool; do
        if diff "${results_dir}/${tool}" "${results_dir}/${other_tool}" > /dev/null; then
            echo "$other_tool"
        fi
    done <<< "$(find "$results_dir" -type f -print0 | xargs -0 -n1 basename | grep -v "^$tool\$")"
}

check_gold_standard() {
    local results_dir="$1"
    local tool="$2"
    local min_consensus="$3"
    local min_no_of_others=$((min_consensus - 1))

    if [[ $(tools_agreeing_to "$results_dir" "$tool" | wc -l) -ge $min_no_of_others ]]; then
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
    touch "$query_consensus_result_dir"/matching_tools

    while IFS= read -r tool; do
        if check_gold_standard "$results_dir" "$tool" "$min_consensus"; then
            cat "${results_dir}/${tool}" > "$query_consensus_result_dir"/gold_standard.json
            echo "$tool" >> "$query_consensus_result_dir"/matching_tools
        else
            cp "${results_dir}/${tool}" "$query_consensus_result_dir"/outliers
        fi
    done <<< "$(all_tool_results "$query")"
}

minimal_consensus() {
    local tool_count
    tool_count=$(find tools -type d -depth 1 | wc -l)

    # ceil(half) and +1 so consensus always has 2 more members than other side
    echo $(( (tool_count + 1) / 2 + 1))
}

build_consensus() {
    local query
    local min_consensus
    min_consensus=$(minimal_consensus)

    while IFS= read -r query; do
        consensus_on_query "$query" $min_consensus
    done <<< "$(all_query_results)"
}

main() {
    build_consensus
}

main
