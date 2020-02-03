#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "${script_dir}"

# Don't store crash dump, will make ninja continuously rebuild this project
export ERL_CRASH_DUMP=/dev/null
erl -noshell -run jsonpath start "$1" -s init stop -pa ./build/default/lib/jsonpath/ebin/ ./build/default/lib/jiffy/ebin/ ./build/default/lib/ejsonpath/ebin/
