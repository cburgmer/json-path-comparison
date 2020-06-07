#!/bin/bash

pretty_implementation_name() {
    local implementation="$1"
    local language
    local library
    language="$(sed "s/\([^_]*\)_.*/\1/" <<< "$implementation")"
    library="$(sed "s/[^_]*_\(.*\)/\1/" <<< "$implementation")"
    echo "${language} (${library})"
}

capitalize() {
    local s="$1"
    echo "$(tr '[:lower:]' '[:upper:]' <<< "${s:0:1}")${s:1}"
}

pretty_query_name() {
    local q="$1"

    capitalize "$q" | tr '_' ' '
}

pre_block() {
    sed 's/^/    /'
}

query_result_status() {
    local result="$1"
    head -1 < "$result"
}

is_query_ok() {
    local result="$1"
    test "$(query_result_status "$result")" = "OK"
}

is_query_error() {
    local result="$1"
    test "$(query_result_status "$result")" = "ERROR"
}

is_query_not_supported() {
    local result="$1"
    test "$(query_result_status "$result")" = "NOT_SUPPORTED"
}

is_query_result_not_found() {
    local result="$1"
    test "$(query_result_status "$result")" = "NOT_FOUND"
}

query_result_payload() {
    local result="$1"
    tail -n +2 < "$result"
}

all_query_result() {
    local result="$1"
    if is_query_result_not_found "$result"; then
        echo "NOT_FOUND"
        return
    fi

    if is_query_not_supported "$result"; then
        echo "NOT_SUPPORTED"
        return
    fi

    query_result_payload "$result"
}

implementation_returns_scalar_for_single_possible_match() {
    local implementation="$1"
    test -f "./implementations/${implementation}/SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR"
}

implementation_returns_not_found_as_error() {
    local implementation="$1"
    test -f "./implementations/${implementation}/NOT_FOUND_RETURNED_AS_ERROR"
}

implementation_returns_not_found_for_scalar_queries_as_error() {
    local implementation="$1"
    test -f "./implementations/${implementation}/NOT_FOUND_RETURNED_AS_ERROR_FOR_NON_SCALAR"
}
