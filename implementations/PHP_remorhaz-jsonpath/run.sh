#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

PATH="/root/php8.3.35/bin:$PATH" php main.php "$@"
