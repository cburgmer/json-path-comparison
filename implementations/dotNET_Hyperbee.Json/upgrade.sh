#!/bin/bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
dotnet add package Hyperbee.Json --version 1.2.1
