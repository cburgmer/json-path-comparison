#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

rm -r build
rm cabal.project.freeze
./install.sh build
cabal new-freeze
