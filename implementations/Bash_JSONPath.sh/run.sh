#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly tmp_stdout="/tmp/bash_jsonpath.stdout.$$"
readonly tmp_stderr="/tmp/bash_jsonpath.stderr.$$"

lines_to_json_array() {
    local line
    echo "["
    read -r line
    echo "${line}"
    while read -r line; do
        echo ", ${line}"
    done
    echo "]"
}

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
./ensure_deps.sh ./build/JSONPath.sh "$@" | cut -f2 | lines_to_json_array > "$tmp_stdout" 2> "$tmp_stderr"
