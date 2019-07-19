#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

PYTHONPATH="$script_dir"/deps/usr/local/lib/python3.7/site-packages/ python3 main.py "$@"
