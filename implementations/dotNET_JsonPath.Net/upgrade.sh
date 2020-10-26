#!/bin/bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
dotnet add package JsonPath.Net
