#!/bin/bash
set -euo pipefail

readonly tmp_results_dir="/tmp/compare_jsonpath.results.$$"
readonly tmp_errors_dir="/tmp/compare_jsonpath.errors.$$"
readonly tmp_consensus_dir="/tmp/compare_jsonpath.consensus.$$"
readonly target_dir="./comparison"

. src/shared.sh


all_tools() {
    find ./tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

all_queries() {
    if [[ -n "${ONLY_QUERIES:-}" ]]; then
        echo "$ONLY_QUERIES" | tr ' ' '\n'
        return
    fi

    find ./queries -type d -depth 1 -print0 | xargs -0 -n1 basename
}

unwrap_scalar_if_needed() {
    local tool="$1"
    local query="$2"

    if [[ -f "./tools/${tool}/SCALARS_RETURNED_AS_ARRAY" && -f "./queries/${query}/SCALAR_RESULT" ]]; then
        ./src/unwrap_scalar.py
    else
        cat
    fi
}

run_query() {
    local tool="$1"
    local query="$2"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    "./tools/${tool}"/run.sh "$selector" < "$document" | unwrap_scalar_if_needed "$tool" "$query"
}

canonical_json() {
    local filepath="$1"
    ./src/canonical_json.py < "$filepath" > "${filepath}.json"
    mv "${filepath}.json" "$filepath"
}

query_tools() {
    local query="$1"
    local results_dir="${tmp_results_dir}/${query}"
    local tool
    local error_key

    mkdir -p "$results_dir"

    echo -en "${query}\t"
    while IFS= read -r tool; do
        echo -n "${tool} "
        error_key="${tool}___${query}"
        if run_query "$tool" "$query" > "${results_dir}/${tool}" 2> "${tmp_errors_dir}/${error_key}"; then
            rm "${tmp_errors_dir}/${error_key}"

            canonical_json "${results_dir}/${tool}"
            echo -n "(ok) "
        else
            rm "${results_dir}/${tool}"
            echo -n "(err) "
        fi
    done <<< "$(all_tools)"
    echo
}

main() {
    mkdir -p "$tmp_results_dir"
    mkdir -p "$tmp_errors_dir"
    mkdir -p "$tmp_consensus_dir"

    while IFS= read -r query; do
        query_tools "$query"
    done <<< "$(all_queries)"

    ./src/error_report.sh "$tmp_errors_dir" "$target_dir"

    ./src/build_consensus.sh "$tmp_results_dir" "$tmp_consensus_dir"
    ./src/compile_table.sh "$tmp_consensus_dir" "$target_dir"
    ./src/results_report.sh "$tmp_consensus_dir" "$target_dir"

    rm -r "$tmp_results_dir"
    rm -r "$tmp_errors_dir"
    rm -r "$tmp_consensus_dir"
}

main
