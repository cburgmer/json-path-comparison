#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tag="$(cat "${script_dir}/tag")"
version="$(sed 's/^v//' <<< "$tag")"

gem install -i "$script_dir"/gems jsonpath -v "$version"
