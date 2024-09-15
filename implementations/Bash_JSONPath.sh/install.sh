#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tag="$(cat "${script_dir}/tag")"
version="$(sed 's/^v//' <<< "$tag")"

readonly source_url="https://raw.githubusercontent.com/mclarkson/JSONPath.sh/${tag}/JSONPath.sh"
readonly target_path="$1"

curl --fail -L "$source_url" -o "$target_path"
chmod a+x "$target_path"
