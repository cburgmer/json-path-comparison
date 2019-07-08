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

is_query_result_ok() {
    local result="$1"
    test "$(query_result_status "$result")" = "OK"
}

query_result_payload() {
    local result="$1"
    tail -n +2 < "$result"
}
