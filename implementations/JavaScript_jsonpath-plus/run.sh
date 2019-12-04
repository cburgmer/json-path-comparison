#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

if [[ ! -d "node_modules" ]]; then
    npm install
fi

readonly tmp_stdout="node_jsonpath-plus.stdout.$$"
readonly tmp_stderr="node_jsonpath-plus.stderr.$$"

output_and_cleanup() {
    local filter_syntax_error_in_vm="evalmachine.<anonymous>:1"
    if ! grep "$filter_syntax_error_in_vm" < "$tmp_stdout"; then
        cat "$tmp_stdout"
        >&2 cat "$tmp_stderr"
    fi
    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

trap output_and_cleanup EXIT

./index.js "$@" > "$tmp_stdout" 2> "$tmp_stderr"
