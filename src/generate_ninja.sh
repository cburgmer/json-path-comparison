#!/bin/bash
set -euo pipefail

readonly results_dir="results"
readonly consensus_dir="consensus"
readonly bug_reports_dir="bug_reports"
readonly markdown_dir="markdown"

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

rule compile_bug_reports
  command = ./src/compile_bug_reports.sh \$in > \$out

rule error_report
  command = ./src/error_report.sh \$in > \$out

EOF

        # Query results
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
            echo
        done <<< "$(all_queries)"

        ## Consensus
        echo
        while IFS= read -r query; do
            echo "build ${consensus_dir}/${query}: consensus ${results_dir}/${query} | src/build_consensus.sh"
        done <<< "$(all_queries)"
        echo
        # Aggregate consensus build
        echo -n "build ${consensus_dir}: phony"
        while IFS= read -r query; do
            echo -n " ${consensus_dir}/${query}"
        done <<< "$(all_queries)"
        echo
        echo

        ## Bug reports
        echo
        while IFS= read -r implementation; do
            echo "build ${bug_reports_dir}/${implementation}.md: compile_bug_reports ${results_dir} ${consensus_dir} implementations/${implementation} | src/compile_bug_reports.sh"
        done <<< "$(all_implementations)"
        echo

        ## Error report
        echo
        echo "build ${markdown_dir}/errors.md: error_report ${results_dir} | src/error_report.sh"

    } > "./build.ninja"
}

main
