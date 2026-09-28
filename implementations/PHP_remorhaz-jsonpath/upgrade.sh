#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
rm -rf vendor
PATH="/root/php8.3.35/bin:$PATH" composer update
