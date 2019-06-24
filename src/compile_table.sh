#!/bin/bash
set -euo pipefail

readonly tmp_consensus_dir="$1"
readonly target_dir="$2"

. src/shared.sh

all_implementations() {
    find ./implementations -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

all_query_results() {
    find "$tmp_consensus_dir" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

give_mark() {
    local query="$1"
    local implementation="$2"
    local consensus_dir="${tmp_consensus_dir}/${query}"

    # Matching consensus?
    if grep "^${implementation}\$" < "$consensus_dir"/matching_implementations > /dev/null; then
        echo "✓"
        return
    fi

    # Neither matching consensus, nor found in outliers?
    if [[ ! -f "${consensus_dir}/outliers/${implementation}" ]]; then
        echo "<a href=\"errors.md#${implementation}___${query}\">e</a>"
        return
    fi

    # So we are an outlier, but is there actually any gold standard?
    if [[ $(wc -l < "$consensus_dir"/matching_implementations) -gt 0 ]]; then
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
    local implementation
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td><a href=\"results/${query}.md\">${query_name}</a></td>"
    echo "<td><code>${selector}</code></td>"

    while IFS= read -r implementation; do
        echo "<td>"
        give_mark "$query" "$implementation"
        echo "</td>"
    done <<< "$(all_implementations)"

    echo "</tr>"
}

implementation_language_header() {
    local category_entry
    local category
    local count

    while IFS= read -r category_entry; do
        category="$(awk '{print $2}' <<< "$category_entry")"
        count="$(awk '{print $1}' <<< "$category_entry")"

        echo "<th colspan=\"${count}\">${category}</th>"
    done <<< "$(all_implementations | sed "s/\([^_]*\)_.*/\1/" | uniq -c)"
}

header_row() {
    local implementation

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    implementation_language_header
    echo "</tr>"

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r implementation; do
        echo "<th>"
        sed "s/[^_]*_\(.*\)/\1/" <<< "$implementation"
        if [[ -f "./implementations/${implementation}/SCALARS_RETURNED_AS_ARRAY" ]]; then
            echo "¹"
        fi
        echo "</th>"
    done <<< "$(all_implementations)"
    echo "</tr>"
}

compile_comparison() {
    echo "# Comparison of different implementations of JSONPath

This table makes no statement on the correctness of any of the implementations.
Outcomes are compared to the pool of other implementations, and judged based on a simple consensus.
A majority has to consist of half of all implementations (rounded up) + 1.
This guarantees that in case of a split on two sides, the majority wins by two votes."
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

- ✓, the result of this implementation matches the majority of results
- ✗, the result does not match a majority
- ?, no clear consensus amongst the implementations (the results disagree and/or a lot of implementations error)
- e, the implementation failed executing the query and probably does not support this type of query
- ¹, those implementations actually return a scalar as an array of one element. This difference is not included for the sake of this comparison."
}

main() {
    compile_comparison > "${target_dir}/index.md"
}

main
