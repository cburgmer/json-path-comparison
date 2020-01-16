#!/bin/bash
set -euo pipefail


readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

perl -I ./build/lib/perl5/ main.pl "$@"
