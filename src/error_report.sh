#!/bin/bash

set -euo pipefail

readonly build_dir="build"
readonly target_dir="$1"

. src/shared.sh

all_errors() {
    local implementation_query_result
    while IFS= read -r implementation_query_result; do
        if ! is_query_result_ok "$implementation_query_result"; then
            echo "$implementation_query_result"
        fi
    done <<< "$(find "$build_dir" -type f)"
}

nice_error_headline() {
    local query="$1"
    local implementation="$2"

    echo "$(pretty_implementation_name "$implementation"), $(pretty_query_name "$query")"
}

error_headline_id() {
    local query="$1"
    local implementation="$2"

    echo "${implementation}___${query}"
}

error_section() {
    local implementation_query_result="$1"
    local query
    local implementation
    query="$(basename $(dirname "$implementation_query_result"))"
    implementation="$(basename "$implementation_query_result")"

    echo "<h3 id=\"$(error_headline_id "$query" "$implementation")\">"
    nice_error_headline "$query" "$implementation"
    echo "</h3>"
    echo
    query_result_payload "$implementation_query_result" | pre_block
    echo
}

compile_error_report() {
    local implementation_query_result

    {
        echo "## Errors"
        echo

        while IFS= read -r implementation_query_result; do
            error_section "$implementation_query_result"
        done <<< "$(all_errors | sort)"
    } > "${target_dir}/errors.md"
}

main() {
    compile_error_report
}

main
