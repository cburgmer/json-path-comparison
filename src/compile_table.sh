#!/bin/bash
set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"

. src/shared.sh

all_implementations() {
    find ./implementations -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | sort
}

all_query_results() {
    find "$results_dir" -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | sort
}

give_mark() {
    local query="$1"
    local implementation="$2"
    local matching_implementations="${consensus_dir}/${query}"

    # Matching consensus?
    if grep "^${implementation}\$" < "$matching_implementations" > /dev/null; then
        echo "✓"
        return
    fi

    # Error?

    if ! is_query_result_ok "${results_dir}/${query}/${implementation}"; then
        echo "<a href=\"errors.md#${implementation}___${query}\">e</a>"
        return
    fi

    # So we are an outlier, but is there actually any gold standard?
    if [[ -s "$matching_implementations" ]]; then
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

    echo "<tr id=\"${query}\">"
    echo "<td>"
    echo "<a href=\"#${query}\" style=\"color: lightgrey;\">#</a>"
    echo "<a href=\"results/${query}.md\">${query_name}</a>"
    echo "</td>"
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

wrap_with_link() {
    local implementation="$1"
    if [[ -f "./implementations/${implementation}/LINK" ]]; then
        echo "<a href=\"$(cat "./implementations/${implementation}/LINK")\">"
        cat
        echo "</a>"
    else
        cat
    fi
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
        echo "<div style=\"writing-mode: vertical-lr;\">"
        sed "s/[^_]*_\(.*\)/\1/" <<< "$implementation" | wrap_with_link "$implementation"
        if [[ -f "./implementations/${implementation}/SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR" ]]; then
            echo "¹"
        fi
        echo "</div>"
        echo "</th>"
    done <<< "$(all_implementations)"
    echo "</tr>"
}

main() {
    echo "# Comparison of different implementations of JSONPath

## How

We execute all available implementations against the same queries.
Outcomes are compared across implementations, and judged based on a simple consensus:
a majority of half of all implementations (rounded up) plus one is required
(guarantees difference of 2 votes even in critical cases).
This table makes no statement on the correctness of any of the implementations.

## Goal

This comparison is meant to create visibility,
help implementers find issues by sharing test cases,
and finally give guidance on interpretation of the [initial posts by Goessner](https://goessner.net/articles/JsonPath/).
The motivation of the consensus in particular is to drive the discussion towards a shared understanding of the JSONPath proposal.

## Comparison
"
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
- ¹, this implementation returns queries with only a single possible match as a scalar element (e.g. '\$[0]' => '42'). For the sake of comparing to other implementations these results are converted and wrapped in a list here.

## Contribute

Please help to add more queries, extend the list of implementations or fix errors. See [https://github.com/cburgmer/json-path-comparison](https://github.com/cburgmer/json-path-comparison).
"
}

main
