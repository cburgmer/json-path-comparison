#!/bin/bash
set -euo pipefail

readonly tmp_consensus_dir="$1"
readonly target_dir="$2"

. src/shared.sh

all_tools() {
    find ./tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

sort_by_selector() {
    xargs -n1 -I% sh -c 'echo "$(cat ./queries/%/selector)\t%"' \
        | sort \
        | cut -f2

}

all_query_results() {
    find "$tmp_consensus_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort_by_selector
}

give_mark() {
    local query="$1"
    local tool="$2"
    local consensus_dir="${tmp_consensus_dir}/${query}"

    # Matching consensus?
    if grep "^${tool}\$" < "$consensus_dir"/matching_tools > /dev/null; then
        echo "✓"
        return
    fi

    # Neither matching consensus, nor found in outliers?
    if [[ ! -f "${consensus_dir}/outliers/${tool}" ]]; then
        echo "<a href=\"errors.md#${tool}___${query}\">e</a>"
        return
    fi

    # So we are an outlier, but is there actually any gold standard?
    if [[ $(wc -l < "$consensus_dir"/matching_tools) -gt 0 ]]; then
        echo "✗"
        return
    fi

    echo "?"
}

compile_row() {
    local query="$1"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local selector
    local query_name
    local tool
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td><a href=\"results/${query}.md\">${query_name}</a></td>"
    echo "<td><code>${selector}</code></td>"

    while IFS= read -r tool; do
        echo "<td>"
        give_mark "$query" "$tool"
        echo "</td>"
    done <<< "$(all_tools)"

    echo "</tr>"
}

tool_language_header() {
    local category_entry
    local category
    local count
    local i

    while IFS= read -r category_entry; do
        category="$(awk '{print $2}' <<< "$category_entry")"
        count="$(awk '{print $1}' <<< "$category_entry")"

        echo "<th colspan=\"${count}\">${category}</th>"
    done <<< "$(all_tools | sed "s/\([^_]*\)_.*/\1/" | uniq -c)"
}

header_row() {
    local tool

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    tool_language_header
    echo "</tr>"

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r tool; do
        echo "<th>"
        sed "s/[^_]*_\(.*\)/\1/" <<< "$tool"
        if [[ -f "./tools/${tool}/SCALARS_RETURNED_AS_ARRAY" ]]; then
            echo "¹"
        fi
        echo "</th>"
    done <<< "$(all_tools)"
    echo "</tr>"
}

compile_comparison() {
    echo "# Comparison of different implementations of JSONPath"
    echo
    echo "This sheet makes no statement on the correctness of any of the tools, it merely believes in what the majority says."
    echo
    echo "<table>"

    echo "<thead>"
    header_row
    echo "</thead>"

    echo "<tbody>"

    while IFS= read -r query; do
        compile_row "$query"
    done <<< "$(all_query_results)"

    echo "</tbody>"
    echo "</table>"
    echo "
## Explanation

- ✓, the result of this tool matches the majority of results (half of all tools + 1)
- ✗, the result does not match a majority
- ?, the results disagree, but there is no clear consensus amongst the implementations
- e, the tool failed executing the query and probably does not support this type of query
- ¹, those tools actually return a scalar as an array of one element. This difference is not included for the sake of this comparison."
}

main() {
    compile_comparison > "${target_dir}/README.md"
}

main
