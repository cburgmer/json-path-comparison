#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly tmp_output="/tmp/Bash_JSONPath.sh.$$"

cd "$script_dir"
./ensure_deps.sh ./build/JSONPath.sh -u -j "$@" | python3 -m json.tool | tee "$tmp_output"

# Catch empty output
if [[ -z "$(tr -d '\n' < "$tmp_output")" ]]; then
    rm "$tmp_output"
    exit 1
fi

rm "$tmp_output"
