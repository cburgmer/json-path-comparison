#!/bin/bash

# Will compile the whole report.
#
# Hint: setting e.g. `ONLY_QUERIES="root array_index"` will speed up
#       debugging in development by running only the given queries.

set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly docs_dir="./docs"

for dep in ninja java mvn cargo node python3 markdown php composer; do
    if ! which "$dep" > /dev/null; then
        echo >&2 "Please install $dep"
        exit 1
    fi
done

cd "$script_dir"

./src/generate_ninja.sh && ninja

echo "Run \`open docs/index.html\`"
