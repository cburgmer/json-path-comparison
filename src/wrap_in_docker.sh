#!/usr/bin/env bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly RUN_ARGS="$@"
readonly target_image=json-path-comparison

docker build -t "$target_image" "$script_dir"

docker run --rm -v "$(pwd):/json-path-comparison" -v "$(pwd)/cabal-cache":/root/.cabal -i "$target_image" sh -c "cd /json-path-comparison && $RUN_ARGS"
