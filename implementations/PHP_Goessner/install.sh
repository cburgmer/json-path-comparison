#!/bin/bash
set -euo pipefail

readonly source_url="https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/jsonpath/source-archive.zip"
readonly zip_target="/tmp/jsonpath.zip.$$"
readonly zip_content_target="/tmp/jsonpath.$$"

readonly target="$1"

curl --fail -Lo "$zip_target" "$source_url"

unzip -q "$zip_target" -d "$zip_content_target"

cp "$zip_content_target"/jsonpath/trunk/src/php/jsonpath.php "$target"

rm -rf "$zip_content_target"
rm "$zip_target"
