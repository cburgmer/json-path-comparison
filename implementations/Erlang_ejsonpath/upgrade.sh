#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
rebar3 upgrade
