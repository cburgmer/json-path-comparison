#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
# Timeout after some seconds to avoid endless loops
timeout -v 20 ./build/json-path-comparison "$@"
