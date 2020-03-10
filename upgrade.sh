#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

find "$script_dir"/implementations -name "upgrade.sh" | xargs -n1 -I% sh -c '%'
