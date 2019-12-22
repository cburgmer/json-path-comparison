#!/bin/bash

set -euo pipefail

readonly results_dir="$1"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_queries() {
    find ./queries -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | sort
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
    local query="$1"
    local implementation="$2"

    echo "<h3 id=\"$(error_headline_id "$query" "$implementation")\">"
    nice_error_headline "$query" "$implementation"
    echo "</h3>"
    echo
    query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
    echo
}

main() {
    local query
    local implementation

    echo "## Errors"
    echo

    while IFS= read -r query; do
        while IFS= read -r implementation; do
            if ! is_query_result_ok "${results_dir}/${query}/${implementation}"; then
                error_section "$query" "$implementation"
            fi
        done <<< "$(all_implementations)"
    done <<< "$(all_queries)"
}

main
