#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

PYTHONPATH="$( cd deps/lib/python*/site-packages/ && pwd )" python3 main.py "$@"
