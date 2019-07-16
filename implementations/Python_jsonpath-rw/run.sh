#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

if ! python3 -c "import jsonpath_rw" > /dev/null; then
    pip3 install -r requirements.txt
fi

python3 main.py "$@"
