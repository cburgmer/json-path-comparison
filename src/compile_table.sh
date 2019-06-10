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

    if grep "^${tool}\$" < "$consensus_dir"/matching_tools > /dev/null; then
        echo "✓"
        return
    fi

    if [[ ! -f "${consensus_dir}/outliers/${tool}" ]]; then
        echo "<a href=\"errors.md#${tool}___${query}\">e</a>"
        return
    fi

    if [[ $(wc -l < "$consensus_dir"/matching_tools) -gt 0 ]]; then
        echo "✗"
        return
    fi

    if [[ $(find "${consensus_dir}/outliers/" -type f | wc -l) -lt 3 ]]; then
        # need at least 3 results to build consensus
        echo "?"
        return
    fi

    echo "✗"
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

header_row() {
    local tool
    local tool_name

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r tool; do
        tool_name="$(pretty_tool_name "$tool")"
        echo "<th>"
        echo "${tool_name}"
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

- ✓, the result of this tool matches what the majority says
- ✗, the result is different to multiple others
- ?, the results disagree, but there are not enough samples to be conclusive on which one is probably correct
- e, the tool failed executing the query and probably does not support this type of query
- ¹, those tools actually return a scalar as an array of one element. This difference is not included for the sake of this comparison."
}

main() {
    compile_comparison > "${target_dir}/README.md"
}

main
