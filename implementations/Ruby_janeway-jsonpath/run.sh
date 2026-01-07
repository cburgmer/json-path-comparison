#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly gems_target="${script_dir}/gems"


GEM_PATH="$gems_target" ruby "$script_dir"/main.rb "$@"
