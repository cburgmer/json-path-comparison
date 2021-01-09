#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly runner="${script_dir}/build/JSON_Path_Reference_Implementation"

"$runner" "$@"
