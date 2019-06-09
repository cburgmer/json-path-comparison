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
    echo "$(tr a-z A-Z <<< ${s:0:1})${s:1}"
}

pretty_query_name() {
    local query="$1"

    capitalize "$query" | tr '_' ' '
}

pre_block() {
    sed 's/^/    /'
}
