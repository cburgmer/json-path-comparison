#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"/..

docker rmi json-path-comparison || true
find ./implementations -type d -name "build" | xargs rm -r
find ./proposals -type d -name "build" | xargs rm -r
# This removes checked in artifacts, so this needs a fresh new build to restore
rm -rf build docs regression_suite bug_reports
