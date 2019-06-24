#!/bin/bash
set -euo pipefail

readonly tmp_results_dir="/tmp/compare_jsonpath.results.$$"
readonly tmp_errors_dir="/tmp/compare_jsonpath.errors.$$"
readonly tmp_consensus_dir="/tmp/compare_jsonpath.consensus.$$"
readonly tmp_markdown_dir="/tmp/compare_jsonpath.markdown.$$"
readonly docs_dir="./docs"
readonly bug_reports_dir="./bug_reports"

. src/shared.sh


all_implementations() {
    find ./implementations -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

all_queries() {
    if [[ -n "${ONLY_QUERIES:-}" ]]; then
        echo "$ONLY_QUERIES" | tr ' ' '\n'
        return
    fi

    find ./queries -type d -depth 1 -print0 | xargs -0 -n1 basename
}

unwrap_scalar_if_needed() {
    local implementation="$1"
    local query="$2"

    if [[ -f "./implementations/${implementation}/SCALARS_RETURNED_AS_ARRAY" && -f "./queries/${query}/SCALAR_RESULT" ]]; then
        ./src/unwrap_scalar.py
    else
        cat
    fi
}

run_query() {
    local implementation="$1"
    local query="$2"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    "./implementations/${implementation}"/run.sh "$selector" < "$document" | unwrap_scalar_if_needed "$implementation" "$query"
}

canonical_json() {
    local filepath="$1"
    ./src/canonical_json.py < "$filepath" > "${filepath}.json"
    mv "${filepath}.json" "$filepath"
}

query_implementations() {
    local query="$1"
    local results_dir="${tmp_results_dir}/${query}"
    local implementation
    local error_key

    mkdir -p "$results_dir"

    echo -en "${query}\t"
    while IFS= read -r implementation; do
        echo -n "${implementation} "
        error_key="${implementation}___${query}"
        if run_query "$implementation" "$query" > "${results_dir}/${implementation}" 2> "${tmp_errors_dir}/${error_key}"; then
            rm "${tmp_errors_dir}/${error_key}"

            canonical_json "${results_dir}/${implementation}"
            echo -n "(ok) "
        else
            # Some implementations don't report errors on stderr
            cat "${results_dir}/${implementation}" >> "${tmp_errors_dir}/${error_key}"
            rm "${results_dir}/${implementation}"

            echo -n "(err) "
        fi
    done <<< "$(all_implementations)"
    echo
}

main() {
    mkdir -p "$tmp_results_dir"
    mkdir -p "$tmp_errors_dir"
    mkdir -p "$tmp_consensus_dir"
    mkdir -p "$tmp_markdown_dir"

    while IFS= read -r query; do
        query_implementations "$query"
    done <<< "$(all_queries)"

    rm -rf "$docs_dir"
    mkdir "$docs_dir"

    ./src/error_report.sh "$tmp_errors_dir" "$tmp_markdown_dir"

    ./src/build_consensus.sh "$tmp_results_dir" "$tmp_consensus_dir"
    ./src/compile_table.sh "$tmp_consensus_dir" "$tmp_markdown_dir"
    ./src/results_report.sh "$tmp_consensus_dir" "$tmp_markdown_dir"
    ./src/compile_html.sh "$tmp_markdown_dir" "$docs_dir"

    rm -rf "$bug_reports_dir"
    mkdir "$bug_reports_dir"
    ./src/compile_bug_reports.sh "$tmp_consensus_dir" "$tmp_errors_dir" "$bug_reports_dir"

    rm -r "$tmp_results_dir"
    rm -r "$tmp_errors_dir"
    rm -r "$tmp_consensus_dir"
}

main
