#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
# Timeout after some seconds as slices with step seem to go into an endless loop
LC_CTYPE=C timeout -v 5 build/main "$@"
