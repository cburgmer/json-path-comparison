#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly target_dir="$1"

case "$(uname -m)" in
    armv7l | armv7) ARCH="arm";;
    aarch64) ARCH="arm64";;
    *) ARCH="x64";;
esac

# Fix dotnet complaining about missing runtime. There must be a better way, surely?
if [[ "$(uname -s)" == "Darwin" ]]; then
    if [[ "$(uname -m)" == "aarch64" ]]; then
        runtime="osx-arm64"
    else
        runtime="osx-x64"
    fi
else
    if [[ "$(uname -m)" == "aarch64" ]]; then
        runtime="linux-arm64"
    else
        runtime="linux-x64"
    fi
fi

cd "$script_dir"
dotnet build -r "$runtime" -o "$target_dir"

# Remove files clashing with other platform
rm -r ./obj/
