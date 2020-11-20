#!/bin/bash
set -euo pipefail

readonly tmp_stdout="/tmp/query_implementation.stdout.$$"
readonly tmp_stderr="/tmp/query_implementation.stderr.$$"

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

cut_excessive_error_logs() {
    head -150
}

run_query() {
    local query="$1"
    local implementation="$2"
    selector="$(cat "${query}/selector")"

    timeout -v 40 "$implementation"/run.sh "$selector" < "$query"/document.json
}

clean_up() {
    rm -f "$tmp_stdout"
    rm -f "$tmp_stderr"
}

main() {
    local query="$1"
    local implementation="$2"
    local implementation_return_code

    set +e
    run_query "$query" "$implementation" > "$tmp_stdout" 2> "$tmp_stderr"
    implementation_return_code=$?
    set -e

    trap clean_up EXIT

    if [[ $implementation_return_code -gt 0 ]]; then
        if [[ $implementation_return_code -eq 2 ]]; then
            echo "NOT_SUPPORTED"
        else
            if [[ $implementation_return_code -eq 3 ]]; then
                echo "NOT_FOUND"
            else
                echo "ERROR"
            fi
        fi

        fail_on_absolute_paths_leaked "$tmp_stderr"
        fail_on_absolute_paths_leaked "$tmp_stdout"
        # Some implementations don't report errors on stderr
        cut_excessive_error_logs < "$tmp_stderr"
        cat "$tmp_stdout"
        return
    fi

    if [[ ! -s "$tmp_stdout" ]]; then
        echo "ERROR"
        echo "No JSON output received"
        fail_on_absolute_paths_leaked "$tmp_stderr"
        cut_excessive_error_logs < "$tmp_stderr"
        return
    fi

    if ! check_json < "$tmp_stdout" 2>> "$tmp_stderr"; then
        echo "ERROR"
        fail_on_absolute_paths_leaked "$tmp_stderr"
        fail_on_absolute_paths_leaked "$tmp_stdout"
        cut_excessive_error_logs < "$tmp_stderr"
        cat "$tmp_stdout"
        return
    fi

    echo "OK"
    canonical_order_if_needed "$query" < "$tmp_stdout" | ./src/canonical_json.py
}

main "$@"
