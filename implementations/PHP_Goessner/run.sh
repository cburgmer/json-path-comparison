#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

# Timeout after some seconds as slices with negative step seem to go into an infinite loop
timeout -v 20 php main.php "$@"
