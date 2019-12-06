#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly jsonpath_export="${script_dir}/build/jsonpath_export.js"
readonly build_dir="$script_dir/build"

# run node from a directory ignored by git so that any superfluous files (like OOM) don't mess up the build
mkdir -p "$build_dir"
cd "$build_dir"

readonly tmp_stdout="/tmp/node_goessner_jsonpath.stdout.$$"
readonly tmp_stderr="/tmp/node_goessner_jsonpath.stderr.$$"

output_and_cleanup() {
  local filter_out_of_memory="CALL_AND_RETRY_LAST Allocation failed"
  if ! grep "$filter_out_of_memory" < "$tmp_stderr"; then
    cat "$tmp_stdout"
    >&2 cat "$tmp_stderr"
  fi
  rm "$tmp_stdout"
  rm "$tmp_stderr"
}

trap output_and_cleanup EXIT

# https://stackoverflow.com/questions/34964332/suppress-signal-output-like-abort-trap-6-in-a-shellscript-for-a-test-that-sh
$(node --max-old-space-size=10 "$script_dir"/index.js "$@" > "$tmp_stdout" 2> "$tmp_stderr")
