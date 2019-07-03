#!/bin/bash
set -euo pipefail

readonly builddir="build"
readonly consensus_dir="consensus"

all_implementations() {
    find ./implementations -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

all_queries() {
    if [[ -n "${ONLY_QUERIES:-}" ]]; then
        echo "$ONLY_QUERIES" | tr ' ' '\n'
        return
    fi

    find ./queries -type d -depth 1 -print0 | xargs -0 -n1 basename
}

main() {
    local query
    local implementation

    {
        cat <<EOF
rule run
  command = ./src/query_implementation.sh '\$out'

rule consensus
  command = ./src/build_consensus.sh '\$in' '\$out'

EOF

        while IFS= read -r query; do
            while IFS= read -r implementation; do
                echo "build ${builddir}/${query}/${implementation}: run | src/query_implementation.sh"
            done <<< "$(all_implementations)"
            echo

            # aggregate query build
            echo -n "build ${builddir}/${query}: phony"
            while IFS= read -r implementation; do
                echo -n " ${builddir}/${query}/${implementation}"
            done <<< "$(all_implementations)"
            echo
        done <<< "$(all_queries)"
        echo

        # aggregate build
        echo
        echo -n "build ${builddir}: phony"
        while IFS= read -r query; do
            echo -n " ${builddir}/${query}"
        done <<< "$(all_queries)"
        echo

        echo "build ${consensus_dir}: consensus ${builddir} | src/build_consensus.sh"
    } > "./build.ninja"
}

main
