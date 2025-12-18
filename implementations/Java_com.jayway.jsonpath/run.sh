#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

java -XX:+PerfDisableSharedMem -cp "${script_dir}/build/json-path-comparison.jar:$(cat "${script_dir}/build/cp.txt")" query.App "$@"
