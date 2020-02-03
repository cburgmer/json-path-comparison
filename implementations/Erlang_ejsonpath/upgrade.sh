#!/usr/bin/env bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${script_dir}"

rebar3 upgrade
# Poor man's dependency handling, work around https://github.com/erlang/rebar3/issues/2220
rm -r ./build/
