#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

filter_versioned_stack_traces() {
    # Not sure how to catch all exceptions in Elixir and still return a non 0 status code
    # So instead we beautify the stack traces so we don't leak version numbers into the output which are bound to change over time
    # We also need to support strings without version numbers on Linux (maybe older Elixir?)
    sed 's/^    ([a-z]* .*\..*\..*) /    /' | sed 's/^    ([a-z]*) /    /'
}

"$script_dir"/build/jsonpath "$@" 2>&1 | filter_versioned_stack_traces
