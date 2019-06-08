#!/bin/bash

set -euo pipefail

./compare.sh | tee COMPARISON.md
markdown < COMPARISON.md > comparison.html
echo "Run \`open comparison.html\`"
