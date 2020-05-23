#!/bin/bash
set -euo pipefail

canonical_order_if_needed() {
    local query="$1"

    if [[ -f "${query}/ALLOW_UNORDERED" ]]; then
        ./src/sort_json_array.py
    else
        cat
    fi
}

check_json() {
    python3 -m json.tool > /dev/null
}

fail_on_absolute_paths_leaked() {
    # Absolute paths will make it hard to provide a reproducible outcome
    # Best way to avoid them in most languages is to catch exceptions and
    # print a simple error instead.
    local file="$1"
    if grep '/json-path-comparison/' < "$file" > /dev/null; then
        echo "This error message includes an absolute path which will make it hard to reproduce on other machines."
        echo "Please change the script to error without it."
        echo
        cat "$file"
        exit 1
    fi
}

run_query() {
    local query="$1"
    local implementation="$2"
    local selector_file="$query"/selector
    local document="$query"/document.json
    local tmp_output="/tmp/query_implementation.tmp.$$"
    local selector
    selector="$(cat "${selector_file}")"

    if ! "$implementation"/run.sh "$selector" < "$document" > "$tmp_output"; then
        cat "$tmp_output"
        rm "$tmp_output"
        return 1
    fi

    if [[ ! -s "$tmp_output" ]]; then
        echo "No JSON output received"
        rm "$tmp_output"
        return 1
    fi

    if ! check_json < "$tmp_output"; then
        cat "$tmp_output"
        rm "$tmp_output"
        return 1
    fi

    canonical_order_if_needed "$query" < "$tmp_output"
    rm "$tmp_output"
}

main() {
    local query="$1"
    local implementation="$2"
    local tmp_stdout="/tmp/query_implementation.stdout.$$"
    local tmp_stderr="/tmp/query_implementation.stderr.$$"

    if run_query "$query" "$implementation" > "$tmp_stdout" 2> "$tmp_stderr"; then
        echo "OK"

        ./src/canonical_json.py < "$tmp_stdout"
    else
        echo "ERROR"

        fail_on_absolute_paths_leaked "$tmp_stderr"
        fail_on_absolute_paths_leaked "$tmp_stdout"
        # Some implementations don't report errors on stderr
        cat "$tmp_stderr"
        cat "$tmp_stdout"
    fi

    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

main "$@"
