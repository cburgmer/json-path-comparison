#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
./lein ancient upgrade
rm -f ./.lein-failures
rm -rf ./target/
