#!/bin/bash
set -euo pipefail

if ! gem which jsonpath > /dev/null; then
    gem install jsonpath
fi

jsonpath "$@"
