#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
./ensure_deps.sh ./build/JSONPath.sh -u -j "$@"
