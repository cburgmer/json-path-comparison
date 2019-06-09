#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! which java > /dev/null; then
    echo >&2 "Please install Java"
    exit 1
fi

if ! which cargo > /dev/null; then
    echo >&2 "Please install Rust and Cargo"
    exit 1
fi

if ! which node > /dev/null; then
    echo >&2 "Please install Node.js"
    exit 1
fi

if ! which markdown > /dev/null; then
    echo >&2 "Please install markdown"
    exit 1
fi

cd "$script_dir"
./src/compare.sh
markdown < comparison/README.md > comparison/index.html
echo "Run \`open comparison/index.html\`"
