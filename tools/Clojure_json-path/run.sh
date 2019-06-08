#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly jar="target/uberjar/json-path-comparison-0.1.0-SNAPSHOT-standalone.jar"

cd "$script_dir"

if [[ ! -f "$jar" ]]; then
    ./lein uberjar
fi

java -jar "$jar" "$@"
