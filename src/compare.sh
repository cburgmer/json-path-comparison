#!/bin/bash
set -euo pipefail

readonly tmp_results_dir="./build"
readonly tmp_errors_dir="./errs"
readonly tmp_consensus_dir="./consensus"
readonly tmp_markdown_dir="/tmp/compare_jsonpath.markdown.$$"
readonly docs_dir="./docs"
readonly bug_reports_dir="./bug_reports"

main() {
    mkdir -p "$tmp_markdown_dir"

    rm -rf "$docs_dir"
    mkdir "$docs_dir"

    ./src/error_report.sh "$tmp_errors_dir" "$tmp_markdown_dir"

    ./src/compile_table.sh "$tmp_consensus_dir" "$tmp_markdown_dir"
    ./src/results_report.sh "$tmp_consensus_dir" "$tmp_markdown_dir"
    ./src/compile_html.sh "$tmp_markdown_dir" "$docs_dir"

    rm -rf "$bug_reports_dir"
    mkdir "$bug_reports_dir"
    ./src/compile_bug_reports.sh "$tmp_consensus_dir" "$tmp_errors_dir" "$bug_reports_dir"

    rm -r "$tmp_markdown_dir"
}

main
