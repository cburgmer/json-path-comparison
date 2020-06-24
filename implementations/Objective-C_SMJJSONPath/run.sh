#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly tmp_stdout="/tmp/Objective-C_SMJJSONPath.stdout.$$"
readonly tmp_stderr="/tmp/Objective-C_SMJJSONPath.stderr.$$"

multiline_maps() {
    sed 's/ *//' | tr '\n' ' ' | sed 's/Current context is: { */Current context is: {/' | sed 's/ $//' | awk 1
}

gnustep_types() {
    sed 's/__NSArrayI/GSArray/'
}

remove_terminated() {
    grep -v '^Terminated$' || true
}

filter_runtime_differences() {
    multiline_maps | gnustep_types | remove_terminated
}

output_and_cleanup() {
    cat "$tmp_stdout"
    cat "$tmp_stderr" | >&2 filter_runtime_differences
    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

trap output_and_cleanup EXIT

cd "$script_dir"
timeout -v 10 build/main "$@" > "$tmp_stdout" 2> "$tmp_stderr"
