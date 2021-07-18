#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
./build/cpanm --info JSON::Path > version
rm -rf build
