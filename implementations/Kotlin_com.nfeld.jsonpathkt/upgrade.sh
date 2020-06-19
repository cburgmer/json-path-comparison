#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$BASH_SOURCE[0]")"
mvn versions:use-latest-versions
rm pom.xml.versionsBackup
