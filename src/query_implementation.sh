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
    local tmp_errors_dir="$2"

    local tmp_results_dir
    local query
    local implementation

    tmp_results_dir="$(cut -d/ -f1 <<< "$target")"
    query="$(cut -d/ -f2 <<< "$target")"
    implementation="$(cut -d/ -f3 <<< "$target")"

    local results_dir="${tmp_results_dir}/${query}"
    local error_key

    mkdir -p "$tmp_errors_dir"

    error_key="${implementation}___${query}"
    if run_query "$implementation" "$query" > "${results_dir}/${implementation}" 2> "${tmp_errors_dir}/${error_key}"; then
        rm "${tmp_errors_dir}/${error_key}"

        canonical_json "${results_dir}/${implementation}"
        echo -n "(ok) "
    else
        # Some implementations don't report errors on stderr
        cat "${results_dir}/${implementation}" >> "${tmp_errors_dir}/${error_key}"
        rm "${results_dir}/${implementation}"

        echo -n "(err) "
    fi
}

main "$@"
