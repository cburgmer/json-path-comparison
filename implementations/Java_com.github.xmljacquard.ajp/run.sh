#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

filter_absolute_path_in_warning() {
    sed 's/jar:file:[^ ]*implementations\/Java_com.github.xmljacquard.ajp\//jar:file:.\/implementations\/Java_com.github.xmljacquard.ajp\//'
}

java -XX:+PerfDisableSharedMem -cp "${script_dir}/build/json-path-comparison.jar:$(cat "${script_dir}/build/cp.txt")" query.App "$@" 2>&1 | filter_absolute_path_in_warning
