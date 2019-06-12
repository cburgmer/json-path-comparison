#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly target="$script_dir"/query/target

cd "$script_dir"/query

if [[ ! -e "$target" ]]; then
    mvn clean package -q
fi

mvn -e exec:java -q -D"exec.mainClass"="query.App" -Dexec.args="$@"
