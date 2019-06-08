#!/bin/bash

set -euo pipefail

if ! which java > /dev/null; then
    echo >&2 "Please install Java"
    exit 1
fi

if ! which cargo > /dev/null; then
    echo >&2 "Please install Rust and Cargo"
    exit 1
fi

if ! which markdown > /dev/null; then
    echo >&2 "Please install markdown"
    exit 1
fi

./compare.sh | tee COMPARISON.md
markdown < COMPARISON.md > COMPARISON.md.html
echo "Run \`open COMPARISON.md.html\`"
