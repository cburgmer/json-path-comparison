#!/bin/bash
set -euo pipefail

readonly target_dir="$1"

resolve_links() {
    sed 's/<a href="\([^"]*\).md\(#[^"]*\)*">/<a href="\1.html\2">/'
}

main() {
    local file
    local html_target
    while IFS= read -r file; do
        html_target="${file/.md/.html}"
        markdown < "$file" | resolve_links > "$html_target"
    done <<< "$(find "$target_dir" -name "*.md")"
}

main
