#!/bin/bash
set -euo pipefail

readonly target_dir="$1"

cd "$(dirname "$target_dir")"

cabal v2-update

if cabal --version | grep "cabal-install version 2" > /dev/null; then
    # Support Alpine with Cargo 2.4.1.0
    # Works with hack in ./src/wrap_in_docker.sh
    #   docker run --rm -v "$(pwd)/cabal-cache":/root/.cabal
    cabal v2-install exe:json-path-comparison --symlink-bindir "$(basename "$target_dir")" --overwrite-policy=always
else
    cabal v2-install --install-method=copy --installdir="$(basename "$target_dir")"
fi
