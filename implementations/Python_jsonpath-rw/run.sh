#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

if ! python -c "import jsonpath_rw" > /dev/null; then
    pip install -r requirements.txt
fi

python main.py "$@"
