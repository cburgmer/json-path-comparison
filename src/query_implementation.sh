#!/bin/bash
set -euo pipefail

wrap_scalar_if_needed() {
    local implementation="$1"
    local query="$2"

    if [[ -f "${implementation}/SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR" && -f "${query}/SCALAR_RESULT" ]]; then
        ./src/wrap_scalar.py
    else
        cat
    fi
}

run_query() {
    local query="$1"
    local implementation="$2"
    local selector_file="$query"/selector
    local document="$query"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    "$implementation"/run.sh "$selector" < "$document" | wrap_scalar_if_needed "$implementation" "$query"
}

canonical_json() {
    local filepath="$1"
    ./src/canonical_json.py < "$filepath" > "${filepath}.json"
    mv "${filepath}.json" "$filepath"
}

main() {
    local query="$1"
    local implementation="$2"
    local tmp_stdout="/tmp/query_implementation.stdout.$$"
    local tmp_stderr="/tmp/query_implementation.stderr.$$"

    if run_query "$query" "$implementation" > "$tmp_stdout" 2> "$tmp_stderr"; then
        echo "OK"

        canonical_json "$tmp_stdout"
        cat "$tmp_stdout"
    else
        echo "ERROR"

        # Some implementations don't report errors on stderr
        cat "$tmp_stderr"
        cat "$tmp_stdout"
    fi

    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

main "$@"
