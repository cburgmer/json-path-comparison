#!/bin/bash
set -euo pipefail

readonly results_dir="results"
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
  command = ./src/query_implementation.sh \$in > '\$out'

rule consensus
  command = ./src/build_consensus.sh '\$in' > \$out

EOF

        while IFS= read -r query; do
            while IFS= read -r implementation; do
                echo -n "build ${results_dir}/${query}/${implementation}: run queries/${query} implementations/${implementation}"
                # implicit deps
                echo -n " | src/query_implementation.sh queries/${query}/selector queries/${query}/document.json"
                if [[ -f "queries/${query}/SCALAR_RESULT" ]]; then
                    echo -n " queries/${query}/SCALAR_RESULT"
                fi
                echo
            done <<< "$(all_implementations)"
            echo

            # aggregate query build
            echo -n "build ${results_dir}/${query}: phony"
            while IFS= read -r implementation; do
                echo -n " ${results_dir}/${query}/${implementation}"
            done <<< "$(all_implementations)"
            echo

            echo "build ${consensus_dir}/${query}: consensus ${results_dir}/${query} | src/build_consensus.sh"
        done <<< "$(all_queries)"
    } > "./build.ninja"
}

main
