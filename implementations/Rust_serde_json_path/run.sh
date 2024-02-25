#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly runner="${script_dir}/build/rust_serde_json_path"

"$runner" "$@"
