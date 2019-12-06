#!/bin/bash

# Will compile the whole report.
#
# Hint: setting e.g. `ONLY_QUERIES="root array_index"` will speed up
#       debugging in development by running only the given queries.

set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly docs_dir="./docs"

for dep in ninja java mvn cargo git go node python3 markdown php composer curl gcc pkg-config perl wget ghc cabal erl rebar3; do
    if ! which "$dep" > /dev/null; then
        echo >&2 "Please install $dep"
        exit 1
    fi
done

for dep in glib-2.0 json-glib-1.0 gio-unix-2.0; do
    if ! pkg-config --cflags "$dep" > /dev/null; then
        exit 1
    fi
done

cd "$script_dir"

./src/generate_ninja.sh && ninja

echo "Run \`open docs/index.html\`"
