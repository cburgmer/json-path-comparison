#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
PYTHONPATH="$( cd deps/lib/python*/site-packages/ && pwd )" ./deps/bin/pur -r requirements.txt
