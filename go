#!/bin/bash

# Will compile the whole report.
#
# Hint: setting e.g. `ONLY_QUERIES="root all_children"` will speed up
#       debugging in development by running only the given queries.

set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly docs_dir="./docs"

for dep in ninja java cargo node python markdown gem cpan perl php composer; do
    if ! which "$dep" > /dev/null; then
        echo >&2 "Please install $dep"
        exit 1
    fi
done

cd "$script_dir"

./src/generate_ninja.sh && ninja

rm -rf "$docs_dir" && mkdir "$docs_dir" && ./src/compile_html.sh "./markdown" "$docs_dir"

echo "Run \`open docs/index.html\`"
