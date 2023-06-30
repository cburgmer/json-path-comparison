#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

PYTHONPATH="$( cd build/deps/local/lib/python*/dist-packages/ && pwd )" python3 main.py "$@"
