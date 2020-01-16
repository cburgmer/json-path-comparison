#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker rmi json-path-comparison || true
rm -r cabal-cache || true
find "$script_dir" -type d -name "build" | xargs rm -r
# This removes checked in artifacts, so this needs a fresh new build to restore
rm -rf build docs regression_suite bug_reports
