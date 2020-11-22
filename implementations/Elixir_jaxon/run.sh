#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

filter_versioned_stack_traces() {
    # Let's avoid stack traces looking different across environments and versions of Elixir/mix
    # It's a hack, but then we tried
    #   1. Running Elixir as a standalone app, but how do we provide a argv?
    #   2. Running as escript, but it doesn't play nicely with Jaxon's C binding (priv dependency)
    # Three categories of issues:
    #   1. Version numbers might diverge
    #   2. Whether or not line is preceded with version
    #   3. Line numbers might diverge
    grep -v '^    (mix\( .*\)*)' | grep -v '^    (elixir\( .*\)*)' | sed 's/(jsonpath [0-9\.]*) //' | sed 's/(jaxon [0-9\.]*) //'
}

filter_absolute_path_in_warning() {
    sed 's/[^ ]*implementations\/Elixir_jaxon\/build\/deps\/poison\/mix.exs/implementations\/Elixir_jaxon\/build\/deps\/poison\/mix.exs/'
}

cd "$script_dir"
mix execute "$@" 2>&1 | filter_versioned_stack_traces | filter_absolute_path_in_warning
