#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly tmp_stdout="/tmp/bash_jsonpath.stdout.$$"
readonly tmp_stderr="/tmp/bash_jsonpath.stderr.$$"

filter_osx_differences() {
    sed 's/^ggrep: /grep: /'
}

output_and_cleanup() {
    cat "$tmp_stdout"
    cat "$tmp_stderr" | >&2 filter_osx_differences
    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

trap output_and_cleanup EXIT

cd "$script_dir"
./ensure_deps.sh ./node_modules/jsonpath.sh/JSONPath.sh -u -j "$@" > "$tmp_stdout" 2> "$tmp_stderr"
