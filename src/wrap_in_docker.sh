#!/usr/bin/env bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly target_image=json-path-comparison

docker build -t "$target_image" "$script_dir"

docker run --rm -v "$(pwd):/json-path-comparison" -w "/json-path-comparison" -i "$target_image" "$@"
