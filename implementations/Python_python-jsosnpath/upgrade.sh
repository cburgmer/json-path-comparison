#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
PYTHONPATH="$( cd build/deps/lib/python*/site-packages/ && pwd )" ./build/deps/bin/pur -r requirements.txt
