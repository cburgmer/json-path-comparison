#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
mix deps.update --all
