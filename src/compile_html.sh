#!/bin/bash
set -euo pipefail

readonly file="$1"

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
    markdown_into_beautiful_html < "$file" | resolve_links
}

main
