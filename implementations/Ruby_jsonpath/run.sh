#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly gems_target="${script_dir}/gems"

filter_runtime_differences() {
    sed 's/^[1234567890]*: unexpected token/unexpected token/'
}

GEM_PATH="$gems_target" ruby "$script_dir"/main.rb "$@" | filter_runtime_differences
