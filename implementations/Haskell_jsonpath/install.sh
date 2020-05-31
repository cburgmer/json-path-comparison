#!/bin/bash
set -euo pipefail

readonly target_dir="$1"

cd "$(dirname "$target_dir")"

cabal v2-update
cabal v2-install --install-method=copy --installdir="$(basename "$target_dir")" --overwrite-policy=always
