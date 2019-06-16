#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

if ! perldoc -l JSON::Path > /dev/null; then
    cpan -i JSON::Path
fi

perl main.pl "$@"
