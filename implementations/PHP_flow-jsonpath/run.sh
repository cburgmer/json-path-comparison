#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

# Timeout after some seconds as some slices with negative step seem to go into an infinite loop
timeout -v 10 php main.php "$@"
