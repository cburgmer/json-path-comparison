#!/bin/bash

all_queries() {
    if [[ -n "${ONLY_QUERIES:-}" ]]; then
        echo "$ONLY_QUERIES" | tr ' ' '\n'
        return
    fi

    find ./queries -type d -depth 1 -print0 \
        | xargs -0 -n1 -I% sh -c 'echo "$(cat %/selector)\t%"' \
        | sort \
        | cut -f2 \
        | xargs -n1 basename
}

all_tools() {
    find ./tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

pretty_tool_name() {
    local tool="$1"
    local language
    local library
    language="$(sed "s/\([^_]*\)_.*/\1/" <<< "$tool")"
    library="$(sed "s/[^_]*_\(.*\)/\1/" <<< "$tool")"
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
