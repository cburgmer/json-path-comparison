#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

if [[ ! -d "vendor" ]]; then
    composer update
fi

php main.php "$@"
