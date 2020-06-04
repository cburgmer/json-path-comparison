#!/bin/bash
set -euo pipefail

readonly test_compilation_dir="build/test_compilation"
readonly results_dir="build/results"
readonly consensus_dir="build/consensus"
readonly majority_dir="build/majority"
readonly majority_results_dir="build/majority_results"
readonly implementations_matching_majority_dir="build/implementations_matching_majority"
readonly markdown_dir="build/markdown"
readonly bug_reports_dir="bug_reports"
readonly docs_dir="docs"
readonly regression_suite="regression_suite"

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_proposals() {
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
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
    for dep in ninja java mvn cargo git go node unzip python3 markdown php composer curl gcc g++ pkg-config perl wget ghc cabal erl rebar3 dotnet elixir gawk clang; do
        if ! which "$dep" > /dev/null; then
            echo >&2 "Please install $dep"
            echo >&2 "If you use homebrew you might want to use ./src/Brewfile"
            exit 1
        fi
    done

    if ! pkg-config --cflags "$dep" > /dev/null; then
        export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
    fi
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
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C bash -c "diff --ignore-space-change <(echo 42) <(\$in/run.sh '\$testquery' <<< '[0, 42]' | tr -d ' \n') || diff --ignore-space-change <(echo '[42]') <(\$in/run.sh '\$testquery' <<< '[0, 42]' | tr -d ' \n')" > \$out
EOF
    while IFS= read -r implementation; do
        echo "subninja implementations/${implementation}/build.ninja"
        echo "build ${test_compilation_dir}/${implementation}: test_compilation implementations/${implementation} | implementations/${implementation}/install"
        echo
    done <<< "$(all_implementations)"
    echo

    while IFS= read -r proposal; do
        echo "subninja proposals/${proposal}/build.ninja"
        echo "build ${test_compilation_dir}/${proposal}: test_compilation proposals/${proposal} | proposals/${proposal}/install"
        echo
    done <<< "$(all_proposals)"
    echo

    echo -n "build ${test_compilation_dir}: phony"
    while IFS= read -r implementation; do
        echo -n " ${test_compilation_dir}/${implementation}"
    done <<< "$(all_implementations)"
    while IFS= read -r proposal; do
        echo -n " ${test_compilation_dir}/${proposal}"
    done <<< "$(all_proposals)"
    echo
    echo
}

query_rules() {
    local query
    local implementation

    cat <<EOF
rule run
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/query_implementation.sh \$in > '\$out'
EOF
    echo
    while IFS= read -r query; do
        while IFS= read -r implementation; do
            echo -n "build ${results_dir}/${query}/${implementation}: run queries/${query} implementations/${implementation}"
            # implicit deps
            echo -n " | src/query_implementation.sh src/canonical_json.py src/sort_json_array.py queries/${query}/selector queries/${query}/document.json ${test_compilation_dir}/${implementation}"
            echo
        done <<< "$(all_implementations)"
        echo

        while IFS= read -r proposal; do
            echo -n "build ${results_dir}/${query}/${proposal}: run queries/${query} proposals/${proposal}"
            # implicit deps
            echo -n " | src/query_implementation.sh src/canonical_json.py src/sort_json_array.py queries/${query}/selector queries/${query}/document.json ${test_compilation_dir}/${proposal}"
            echo
        done <<< "$(all_proposals)"
        echo

        # aggregate query build
        echo -n "build ${results_dir}/${query}: phony"
        while IFS= read -r implementation; do
            echo -n " ${results_dir}/${query}/${implementation}"
        done <<< "$(all_implementations)"
        while IFS= read -r proposal; do
            echo -n " ${results_dir}/${query}/${proposal}"
        done <<< "$(all_proposals)"
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
rule build_majority_result
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/build_majority_result.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${majority_results_dir}/${query}: build_majority_result ${results_dir}/${query} | src/build_majority_result.sh src/majority_result.py"
    done <<< "$(all_queries)"
    echo


    cat <<EOF
rule build_implementations_matching_majority
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/build_implementations_matching_majority.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${implementations_matching_majority_dir}/${query}: build_implementations_matching_majority ${results_dir}/${query} ${majority_results_dir}/${query} | src/build_implementations_matching_majority.sh"
    done <<< "$(all_queries)"
    echo
    # Aggregate build
    echo -n "build ${implementations_matching_majority_dir}: phony"
    while IFS= read -r query; do
        echo -n " ${implementations_matching_majority_dir}/${query}"
    done <<< "$(all_queries)"
    echo
    echo


    cat <<EOF
rule build_majority
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/build_majority.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${majority_dir}/${query}: build_majority ${results_dir}/${query} | src/build_majority.sh src/majority.py"
    done <<< "$(all_queries)"
    echo
    # Aggregate build
    echo -n "build ${majority_dir}: phony"
    while IFS= read -r query; do
        echo -n " ${majority_dir}/${query}"
    done <<< "$(all_queries)"
    echo
    echo


    cat <<EOF
rule build_consensus
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/build_consensus.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${consensus_dir}/${query}: build_consensus ${majority_dir}/${query} | src/build_consensus.sh"
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
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_bug_reports.sh \$in > \$out
EOF
    echo
    while IFS= read -r implementation; do
        echo "build ${bug_reports_dir}/${implementation}.md: compile_bug_reports ${results_dir} ${majority_dir} ${consensus_dir} implementations/${implementation} | src/compile_bug_reports.sh"
    done <<< "$(all_implementations)"
    echo
}

final_report_rules() {
    local query

    cat <<EOF
rule compile_table
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_table.sh \$in > \$out
EOF
    echo
    echo "build ${markdown_dir}/index.md: compile_table ${results_dir} ${consensus_dir} ${implementations_matching_majority_dir} | src/compile_table.sh src/sort_queries.py queries/ implementations/"
    echo

    cat <<EOF
rule compile_results_report
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_results_report.sh \$in > \$out
EOF
    echo
    while IFS= read -r query; do
        echo "build ${markdown_dir}/results/${query}.md: compile_results_report ${results_dir} ${majority_dir} ${consensus_dir} queries/${query} | src/compile_results_report.sh"
    done <<< "$(all_queries)"
    echo

    cat <<EOF
rule compile_html
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_html.sh \$in > \$out
EOF
    echo
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
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_regression_suite.sh \$in > \$out
EOF

    echo "build ${regression_suite}/regression_suite.yaml: compile_regression_suite ${consensus_dir} | src/compile_regression_suite.sh queries/ implementations/"

    cat <<EOF
rule compile_implementation_report
  command = LANG=en_US.UTF-8 LC_ALL= LC_COLLATE=C ./src/compile_implementation_report.sh \$in > \$out
EOF

    echo
    while IFS= read -r implementation; do
        echo "build ${regression_suite}/${implementation}.yaml: compile_implementation_report ${results_dir} ${majority_dir} ${consensus_dir} implementations/${implementation} | src/compile_implementation_report.sh queries/ implementations/"
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
