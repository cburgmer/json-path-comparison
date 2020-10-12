#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly zip_target="/tmp/jsonpath.zip.$$"
readonly zip_content_target="/tmp/jsonpath.$$"

tag="$(cat "${script_dir}/tag")"
version="$(sed 's/^v//' <<< "$tag")"

readonly source_url="https://github.com/brunerd/jsonpath/archive/${tag}.zip"
readonly target="$1"

curl --fail -Lo "$zip_target" "$source_url"

unzip -q "$zip_target" -d "$zip_content_target"

# Make lib requireable
{
    cat "${zip_content_target}/jsonpath-${version}"/jsonpath.js
    echo "module.exports = jsonPath;"
} > "$target"

rm -rf "$zip_content_target"
rm "$zip_target"
