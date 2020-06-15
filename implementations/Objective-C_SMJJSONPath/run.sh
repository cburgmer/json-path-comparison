#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

readonly tmp_stdout="/tmp/Objective-C_SMJJSONPath.stdout.$$"
readonly tmp_stderr="/tmp/Objective-C_SMJJSONPath.stderr.$$"

multiline_maps() {
    sed 's/ *//' | tr '\n' ' ' | sed 's/Current context is: { */Current context is: {/' | sed 's/ $//'
}

gnustep_types() {
    sed 's/__NSArrayI/GSArray/'
}

filter_osx_differences() {
    multiline_maps | gnustep_types
}

output_and_cleanup() {
    cat "$tmp_stdout"
    cat "$tmp_stderr" | >&2 filter_osx_differences
    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

trap output_and_cleanup EXIT

"$script_dir"/build/main "$@" > "$tmp_stdout" 2> "$tmp_stderr"
