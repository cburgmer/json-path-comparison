#!/bin/bash
set -euo pipefail

readonly source_url="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jsonpath/jsonpath-0.8.0.js.txt"
readonly tmp_target="/tmp/jsonpath.js.$$"

readonly target="$1"

curl --fail -Lo "$tmp_target" "$source_url"

# Make lib requireable
{
    cat "$tmp_target"
    echo "module.exports = jsonPath;"
} > "$target"

rm "$tmp_target"
