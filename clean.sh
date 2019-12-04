#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker rmi json-path-comparison
find "$script_dir" -type d -name "build" | xargs rm -r
