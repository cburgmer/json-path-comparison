#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

version="$(cat "${script_dir}/version")"

gem install -i "$script_dir"/gems janeway-jsonpath -v "$version"
