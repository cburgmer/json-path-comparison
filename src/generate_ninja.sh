#!/bin/bash
set -euo pipefail

readonly test_compilation_dir="build/test_compilation"
readonly results_dir="build/results"
readonly consensus_dir="build/consensus"
readonly markdown_dir="build/markdown"
readonly bug_reports_dir="bug_reports"
readonly docs_dir="docs"
readonly regression_suite="regression_suite"

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_queries() {
    if [[ -n "${ONLY_QUERIES:-}" ]]; then
        echo "$ONLY_QUERIES" | tr ' ' '\n'
        return
    fi

    find ./queries -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename
}

check_dependencies() {
    local dep
    for dep in ninja java mvn cargo git go node python3 markdown php composer curl gcc pkg-config perl wget ghc cabal erl rebar3; do
        if ! which "$dep" > /dev/null; then
            echo >&2 "Please install $dep"
            exit 1
        fi
    done

    for dep in glib-2.0 json-glib-1.0 gio-unix-2.0; do
        if ! pkg-config --cflags "$dep" > /dev/null; then
            exit 1
        fi
    done
}

ninja_rules() {
    cat <<EOF
rule configure
  command = ./src/generate_ninja.sh
  generator = 1
build build.ninja: configure | ./src/generate_ninja.sh queries/ implementations/

EOF
}

implementation_rules() {
    local implementation

    cat <<EOF
# Not fully sure why we need to quote this times 3. The outer quote layer at least is for Bash :)
testquery = '\\\\\$\$''[1]'

rule test_compilation
  command = bash -c "diff --ignore-space-change <(echo 42) <(\$in/run.sh '\$testquery' <<< '[0, 42]' | tr -d ' \n') || diff --ignore-space-change <(echo '[42]') <(\$in/run.sh '\$testquery' <<< '[0, 42]' | tr -d ' \n')" > \$out
EOF
    while IFS= read -r implementation; do
        if [[ -f "implementations/${implementation}/build.ninja" ]]; then # we are slowly migrating all implementation to build via ninja as well
            echo "subninja implementations/${implementation}/build.ninja"
            echo "build ${test_compilation_dir}/${implementation}: test_compilation implementations/${implementation} | implementations/${implementation}/install"
            echo
        fi
    done <<< "$(all_implementations)"
    echo

    echo -n "build ${test_compilation_dir}: phony"
    while IFS= read -r implementation; do
        echo -n " ${test_compilation_dir}/${implementation}"
    done <<< "$(all_implementations)"
    echo
    echo
}

query_rules() {
    local query
    local implementation

    cat <<EOF
rule run
  command = ./src/query_implementation.sh \$in > '\$out'
EOF
    echo
    while IFS= read -r query; do
        while IFS= read -r implementation; do
            echo -n "build ${results_dir}/${query}/${implementation}: run queries/${query} implementations/${implementation}"
            # implicit deps
            echo -n " | src/query_implementation.sh queries/${query}/selector queries/${query}/document.json"
            if [[ -f "queries/${query}/SCALAR_RESULT" ]]; then
                echo -n " queries/${query}/SCALAR_RESULT"
            fi
            if [[ -f "implementations/${implementation}/build.ninja" ]]; then # we are slowly migrating all implementation to build via ninja as well
                echo -n " ${test_compilation_dir}/${implementation}"
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
    # all aggregate build
    echo -n "build ${results_dir}: phony"
    while IFS= read -r query; do
        echo -n " ${results_dir}/${query}"
    done <<< "$(all_queries)"
    echo
    echo
    echo
}

consensus_rules() {
    local query

    cat <<EOF
rule build_consensus
  command = ./src/build_consensus.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${consensus_dir}/${query}: build_consensus ${results_dir}/${query} | src/build_consensus.sh"
    done <<< "$(all_queries)"
    echo
    # Aggregate consensus build
    echo -n "build ${consensus_dir}: phony"
    while IFS= read -r query; do
        echo -n " ${consensus_dir}/${query}"
    done <<< "$(all_queries)"
    echo
    echo
}

bug_report_rules() {
    local implementation

    cat <<EOF
rule compile_bug_reports
  command = ./src/compile_bug_reports.sh \$in > \$out
EOF
    echo
    while IFS= read -r implementation; do
        echo "build ${bug_reports_dir}/${implementation}.md: compile_bug_reports ${results_dir} ${consensus_dir} implementations/${implementation} | src/compile_bug_reports.sh"
    done <<< "$(all_implementations)"
    echo
}

final_report_rules() {
    local query

    cat <<EOF
rule error_report
  command = ./src/error_report.sh \$in > \$out
EOF
    echo
    echo "build ${markdown_dir}/errors.md: error_report ${results_dir} | src/error_report.sh"
    echo

    cat <<EOF
rule compile_table
  command = ./src/compile_table.sh \$in > \$out
EOF
    echo
    echo "build ${markdown_dir}/index.md: compile_table ${results_dir} ${consensus_dir} | src/compile_table.sh"
    echo

    cat <<EOF
rule results_report
  command = ./src/results_report.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${markdown_dir}/results/${query}.md: results_report ${results_dir} ${consensus_dir} queries/${query} | src/results_report.sh"
    done <<< "$(all_queries)"
    echo

    cat <<EOF
rule compile_html
  command = ./src/compile_html.sh \$in > \$out
EOF
    echo
    echo "build ${docs_dir}/errors.html: compile_html ${markdown_dir}/errors.md | src/compile_html.sh"
    echo "build ${docs_dir}/index.html: compile_html ${markdown_dir}/index.md | src/compile_html.sh"
    while IFS= read -r query; do
        echo "build ${docs_dir}/results/${query}.html: compile_html ${markdown_dir}/results/${query}.md | src/compile_html.sh"
    done <<< "$(all_queries)"
    echo
}

regression_suite_rules() {
    local implementation

    cat <<EOF
rule compile_regression_suite
  command = ./src/compile_regression_suite.sh \$in > \$out
EOF

    echo
    while IFS= read -r implementation; do
        echo "build ${regression_suite}/${implementation}.yaml: compile_regression_suite ${results_dir} ${consensus_dir} implementations/${implementation} | src/compile_regression_suite.sh"
    done <<< "$(all_implementations)"
}

main() {
    check_dependencies

    {
        ninja_rules
        implementation_rules
        query_rules
        consensus_rules
        bug_report_rules
        final_report_rules
        regression_suite_rules
    } > "./build.ninja"
}

main
