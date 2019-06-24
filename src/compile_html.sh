#!/bin/bash
set -euo pipefail

readonly tmp_markdown_dir="$1"
readonly docs_dir="$2"

resolve_links() {
    sed 's/<a href="\([^"]*\).md\(#[^"]*\)*">/<a href="\1.html\2">/'
}

markdown_into_beautiful_html() {
    echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.css">'
    echo '<article class="markdown-body">'
    markdown
    echo '</article>'
}

main() {
    local file
    local html_target
    while IFS= read -r file; do
        html_target="${file/.md/.html}"
        mkdir -p "$(dirname "${docs_dir}/${html_target}")"
        markdown_into_beautiful_html < "${tmp_markdown_dir}/${file}" | resolve_links > "${docs_dir}/${html_target}"
    done <<< "$(cd "$tmp_markdown_dir" && find . -name "*.md")"
}

main
