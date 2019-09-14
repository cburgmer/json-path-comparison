#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Timeout after some seconds as slices with step seem to go into an endless loop
timeout 5 "$script_dir"/build/main "$@"
