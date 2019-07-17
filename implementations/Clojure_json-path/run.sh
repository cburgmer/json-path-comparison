#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

java -jar "$script_dir"/build/json-path-comparison.jar "$@"
