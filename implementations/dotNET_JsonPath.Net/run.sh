#!/bin/bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$script_dir"
timeout -v 5 build/Dotnet_JsonPath.Net "$@"
