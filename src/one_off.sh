#!/bin/bash
set -euo pipefail


all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | sort
}

execute_queries() {
    local query="$1"
    local implementation

    while IFS= read -r implementation; do
        echo "$implementation"
        ./src/query_implementation.sh "$query" "$implementation"
    done <<< "$(all_implementations)"
}

main() {
    local selector="$1"
    local tmp_query="/tmp/one_off.$$"
    local selector_file="${tmp_query}/selector"
    local document_file="${tmp_query}/document.json"

    ninja build/test_compilation

    mkdir "$tmp_query"
    echo "$selector" > "$selector_file"
    cat > "$document_file"

    execute_queries "$tmp_query"

    rm -r "$tmp_query"
}

main "$@"
