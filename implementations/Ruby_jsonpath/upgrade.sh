#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
curl 'https://rubygems.org/api/v1/versions/jsonpath.yaml' | grep number | head -1 | sed 's/.*number: //' > version
rm -rf build
