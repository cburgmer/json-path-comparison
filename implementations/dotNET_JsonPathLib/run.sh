#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"

# Timeout after some seconds as slices with 0 step seem to go into an infinite loop
timeout -v 10 build/Dotnet_JsonPathLib "$@"
