#!/bin/bash
set -euo pipefail

readonly source_url="https://raw.githubusercontent.com/mclarkson/JSONPath.sh/master/JSONPath.sh"
readonly tmp_target="/tmp/JSONPath.sh.$$"

readonly target="$1"

curl --fail -Lo "$tmp_target" "$source_url"

# Work around https://github.com/mclarkson/JSONPath.sh/pull/7
sed 's/%0${indent}s/%${indent}s/' < "$tmp_target" > "$target"

chmod a+x "$target"

rm "$tmp_target"
