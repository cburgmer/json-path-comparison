#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"/..

find ./implementations -name "upgrade.sh" | xargs -n1 -I% sh -c '%'
