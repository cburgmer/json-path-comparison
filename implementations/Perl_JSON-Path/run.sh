#!/bin/bash
set -euo pipefail


readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

perl main.pl "$@"
