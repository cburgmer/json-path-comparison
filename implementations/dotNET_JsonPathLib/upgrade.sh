#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
dotnet add package --prerelease JsonPathLib
dotnet add package Newtonsoft.Json
dotnet add package Jint
