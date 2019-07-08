#!/bin/bash
set -euo pipefail

readonly results_dir="./results"
readonly consensus_dir="./consensus"
readonly markdown_dir="./markdown"
readonly docs_dir="./docs"
readonly bug_reports_dir="./bug_reports"

main() {
    mkdir -p "$markdown_dir"

    rm -rf "$docs_dir"
    mkdir "$docs_dir"

    ./src/compile_table.sh "$results_dir" "$consensus_dir" "$markdown_dir"
    ./src/results_report.sh "$results_dir" "$consensus_dir" "$markdown_dir"
    ./src/compile_html.sh "$markdown_dir" "$docs_dir"
}

main
