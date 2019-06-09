#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly source_url="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jsonpath/jsonpath-0.8.0.js.txt"
readonly target="${script_dir}/jsonpath.js"
readonly jsonpath_export="${script_dir}/jsonpath_export.js"

cd "$script_dir"

if [[ ! -f "$jsonpath_export" ]]; then
    curl --fail -Lo "$target" "$source_url"

    # Make lib requireable
    {
        cat "$target"
        echo "module.exports = jsonPath;"
    } > "$jsonpath_export"
fi

./index.js "$@"
