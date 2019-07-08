#!/bin/bash
set -euo pipefail

readonly markdown_dir="./markdown"
readonly docs_dir="./docs"

main() {
    mkdir -p "$markdown_dir"

    rm -rf "$docs_dir"
    mkdir "$docs_dir"

    ./src/compile_html.sh "$markdown_dir" "$docs_dir"
}

main
