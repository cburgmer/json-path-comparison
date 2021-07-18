#!/bin/bash
set -euo pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
build_dir="${script_dir}/build"
cpanm="${build_dir}/cpanm"

if [[ ! -x "$cpanm" ]]; then
    mkdir -p "$build_dir"
    curl -L -o "$cpanm" https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm && chmod a+x "$cpanm"
fi

"$cpanm" "$@"
