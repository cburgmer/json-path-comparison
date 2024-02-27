#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

gem install -i "$script_dir"/gems jpt -v 0.1.4
