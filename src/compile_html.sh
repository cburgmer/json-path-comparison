#!/bin/bash
set -euo pipefail

readonly tmp_markdown_dir="$1"
readonly docs_dir="$2"

resolve_links() {
    sed 's/<a href="\([^"]*\).md\(#[^"]*\)*">/<a href="\1.html\2">/'
}

main() {
    local file
    local html_target
    while IFS= read -r file; do
        html_target="${file/.md/.html}"
        mkdir -p "$(dirname "${docs_dir}/${html_target}")"
        markdown < "${tmp_markdown_dir}/${file}" | resolve_links > "${docs_dir}/${html_target}"
    done <<< "$(cd "$tmp_markdown_dir" && find . -name "*.md")"
}

main
