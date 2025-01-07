#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
PYTHONPATH="$( cd build/deps/local/lib/python*/dist-packages/ && pwd )" ./build/deps/local/bin/pur -r requirements.txt
