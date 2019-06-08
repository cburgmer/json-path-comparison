#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly runner="./target/debug/Rust_jsonpath_lib"

cd "$script_dir"

if [[ ! -f "$runner" ]]; then
    cargo build
fi
"$runner" "$@"
