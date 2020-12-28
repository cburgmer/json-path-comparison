#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
curl 'https://api.github.com/repos/brunerd/jsonpath/releases' | grep '"tag_name":' | head -1 | sed 's/.*"tag_name": "\(.*\)",.*/\1/' > tag
rm -rf build
