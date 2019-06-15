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
    local query="$1"

    capitalize "$query" | tr '_' ' '
}

pre_block() {
    sed 's/^/    /'
}
