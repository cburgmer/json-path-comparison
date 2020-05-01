#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

filter_versioned_stack_traces() {
    # Let's avoid stack traces looking different across environments and versions of Elixir/mix
    # It's a hack, but then we tried
    #   1. Running Elixir as a standalone app, but how do we provide a argv?
    #   2. Running as escript, but it doesn't play nicely with Jaxon's C binding (priv dependency)
    grep -v '^    (mix\( .*\)*)' | grep -v '^    (elixir\( .*\)*)'
}

cd "$script_dir"
mix execute "$@" 2>&1 | filter_versioned_stack_traces
