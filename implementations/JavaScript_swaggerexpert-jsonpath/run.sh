#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

readonly tmp_stdout="/tmp/node_swaggerexpert-jsonpath.stdout.$$"
readonly tmp_stderr="/tmp/node_swaggerexpert-jsonpath.stderr.$$"

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
