#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
# Timeout after some seconds to avoid endless loops
LC_CTYPE=C timeout -v 10 ./build/Swift_SwiftPath "$@"
