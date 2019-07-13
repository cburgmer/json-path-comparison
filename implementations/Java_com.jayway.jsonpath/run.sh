#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly target="$script_dir"/query/target

cd "$script_dir"/query

if [[ ! -e "$target" ]]; then
    mvn clean package -q
    mvn -q dependency:build-classpath -Dmdep.outputFile=cp.txt
fi

java -cp "target/query-1.0-SNAPSHOT.jar:$(cat cp.txt)" query.App "$@"
