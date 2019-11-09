#!/bin/bash
set -euo pipefail

readonly source_url="https://raw.githubusercontent.com/mclarkson/JSONPath.sh/master/JSONPath.sh"
readonly target="$1"

curl --fail -Lo "$target" "$source_url"

chmod a+x "$target"
