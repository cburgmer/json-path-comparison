#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly gems_target="${script_dir}/gems"

jpt_file() {
    cat
    echo $@
}

extract_results() {
    grep '➔' | sed "s/.*➔//"
}

filter_absolute_path_in_warning() {
    sed 's|[^ ]*implementations/Ruby_jpt/gems|implementations/Ruby_jpt/gems|'
}

jpt_file $@ | GEM_PATH="$gems_target" "$script_dir"/gems/bin/jpt -q - 2>&1 | extract_results | filter_absolute_path_in_warning
