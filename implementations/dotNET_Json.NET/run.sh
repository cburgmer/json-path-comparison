#!/usr/bin/env bash

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"$script_dir"/build/Dotnet_Json.NET "$@"
