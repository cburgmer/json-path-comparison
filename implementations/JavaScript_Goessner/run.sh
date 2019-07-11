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
$(node --max-old-space-size=10 index.js "$@" > "$tmp_stdout" 2> "$tmp_stderr")
