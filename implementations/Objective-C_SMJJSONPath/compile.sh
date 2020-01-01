#!/bin/bash
set -euo pipefail

readonly out="$1"
readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly includes="${script_dir}/build/includes"
readonly files="-I${includes}/SMJJSONPath/Internals -I${includes}/SMJJSONPath -I${includes} ${includes}/SMJJSONPath/*.m ${includes}/SMJJSONPath/Internals/*.m ${script_dir}/main.m"

if [[ "$(uname -s)" == "Darwin" ]]; then
    clang -framework Foundation -fobjc-arc $files -o "$out"
else
    clang `gnustep-config --objc-flags` `gnustep-config --objc-libs --base-libs` -lgnustep-base -ldispatch -fobjc-arc $files -o "$out"
fi
