#!/bin/bash
set -euo pipefail

readonly output_dir="$1"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
version="$(cat "${script_dir}/version")"

"$script_dir"/cpanm.sh --pureperl -nL "$output_dir" "$version"
