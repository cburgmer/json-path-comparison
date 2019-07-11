#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly source_url="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jsonpath/jsonpath-0.8.1.php"
readonly target="${script_dir}/jsonpath.php"

cd "$script_dir"

if [[ ! -f "$target" ]]; then
    curl --fail -Lo "$target" "$source_url"
fi

php main.php "$@"
