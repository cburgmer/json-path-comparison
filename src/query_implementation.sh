#!/bin/bash
set -euo pipefail

wrap_scalar_if_needed() {
    local implementation="$1"
    local query="$2"

    if [[ -f "./implementations/${implementation}/SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR" && -f "./queries/${query}/SCALAR_RESULT" ]]; then
        ./src/wrap_scalar.py
    else
        cat
    fi
}

run_query() {
    local implementation="$1"
    local query="$2"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    "./implementations/${implementation}"/run.sh "$selector" < "$document" | wrap_scalar_if_needed "$implementation" "$query"
}

canonical_json() {
    local filepath="$1"
    ./src/canonical_json.py < "$filepath" > "${filepath}.json"
    mv "${filepath}.json" "$filepath"
}

main() {
    local target="$1"
    local tmp_stdout="/tmp/query_implementation.stdout.$$"
    local tmp_stderr="/tmp/query_implementation.stderr.$$"

    local tmp_results_dir
    local query
    local implementation

    tmp_results_dir="$(cut -d/ -f1 <<< "$target")"
    query="$(cut -d/ -f2 <<< "$target")"
    implementation="$(cut -d/ -f3 <<< "$target")"

    local results_dir="${tmp_results_dir}/${query}"

    if run_query "$implementation" "$query" > "$tmp_stdout" 2> "$tmp_stderr"; then
        echo "OK" > "${results_dir}/${implementation}"

        canonical_json "$tmp_stdout"
        cat "$tmp_stdout" >> "${results_dir}/${implementation}"

        echo >&2 -n "(ok) "
    else
        echo "ERROR" > "${results_dir}/${implementation}"

        # Some implementations don't report errors on stderr
        cat "$tmp_stderr" >> "${results_dir}/${implementation}"
        cat "$tmp_stdout" >> "${results_dir}/${implementation}"

        echo >&2 -n "(err) "
    fi

    rm "$tmp_stdout"
    rm "$tmp_stderr"
}

main "$@"
