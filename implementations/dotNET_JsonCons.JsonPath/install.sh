#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly target_dir="$1"

if [[ "$(uname -s)" == "Darwin" ]]; then
    runtime="osx-x64"
else
    runtime="linux-x64"
fi

cd "$script_dir"
dotnet build -r "$runtime" -o "$target_dir"

# Remove files clashing with other platform
rm -r ./obj/
