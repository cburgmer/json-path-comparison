#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
# Piping everything through a JSON parser to ensure we fail hard on a very lenient implementation
./ensure_deps.sh ./build/JSONPath.sh -u -j "$@" | python3 -m json.tool
