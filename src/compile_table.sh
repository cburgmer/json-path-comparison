#!/bin/bash
set -euo pipefail

readonly results_dir="$1"
readonly majority_dir="$2"
readonly consensus_dir="$3"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

group_queries_by_functionality() {
    # For sorting assume max. 4 selector segments and a pair (2) of
    # base selector + selector option. Finally the 'on' part => 9 columns
    xargs -n1 -I% ./src/split_query_name.py % | sort -t$'\t' -k1 -k2 -k3 -k4 -k5 -k6 -k7 -k8 -k9 | tr -d $'\t'
}

all_queries() {
    find ./queries -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | group_queries_by_functionality
}

is_in_majority() {
    local query="$1"
    local implementation="$2"
    grep "^${implementation}\$" < "${majority_dir}/${query}" > /dev/null
}

has_consensus() {
    local query="$1"
    test -s "${consensus_dir}/${query}"
}

give_mark() {
    local query="$1"
    local implementation="$2"

    # Error?
    if ! is_query_result_ok "${results_dir}/${query}/${implementation}"; then
        echo "<a href=\"results/${query}.md#${implementation}\">e</a>"
        return
    fi

    if is_in_majority "$query" "$implementation"; then
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.md#consensus\">✓</a>"
        else
            echo "<a href=\"results/${query}.md#${implementation}\">➚</a>"
        fi
    else
        # So we are an outlier, but is there actually any gold standard?
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.md#${implementation}\">✗</a>"
        else
            echo "<a href=\"results/${query}.md#${implementation}\">➘</a>"
        fi
    fi

}

compile_row() {
    local query="$1"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local selector
    local query_name
    local implementation
    local status
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    if has_consensus "$query"; then
        status="consensus"
    else
        status="no_consensus"
    fi;

    echo "<tr id=\"${query}\" class=\"${status}\">"
    echo "<td>"
    echo "<a href=\"#${query}\" style=\"color: lightgrey;\">#</a>"
    echo "<a href=\"results/${query}.md\">${query_name}</a>"
    if [[ -f "${query_dir}/ALLOW_UNORDERED" ]]; then
        echo "²"
    fi
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

        echo "<th style=\"position: sticky; top: 0; background: #ffffffaa;\" colspan=\"${count}\">"
        echo "<span style=\"writing-mode: vertical-rl;\">"
        echo "${category}"
        echo "</span>"
        echo "</th>"
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

    echo "<tr style=\"background: none\">"
    echo "<th style=\"background: #ffffffaa;\"></th>"
    echo "<th style=\"background: #ffffffaa;\"></th>"
    implementation_language_header
    echo "</tr>"

    echo "<tr style=\"background: none\">"
    echo "<th style=\"background: #f6f8faaa;\"></th>"
    echo "<th style=\"background: #f6f8faaa;\"></th>"
    while IFS= read -r implementation; do
        echo "<th style=\"background: #f6f8faaa;\">"
        echo "<div style=\"writing-mode: vertical-rl;\">"
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
    echo "# JSONPath Comparison

See how [JSONPath](https://goessner.net/articles/JsonPath/) is implemented across different languages.
See the [FAQ](https://github.com/cburgmer/json-path-comparison/blob/master/FAQ.md) for why we are doing this and where the results come from.
"
    echo
    echo "<table style=\"overflow: unset;\">" # Need to reset style for sticky headers

    echo "<thead style=\"position: sticky; top: 0;\">"
    header_row
    echo "</thead>"

    echo "<tbody>"

    while IFS= read -r query; do
        compile_row "$query"
    done <<< "$(all_queries)"

    echo "</tbody>"
    echo "</table>"
    echo "
## Explanation

- ✓ The result of this implementation matches the consensus of results.
- ✗ The result does not match the consensus.
- ➚ and ➘: no clear consensus amongst the implementations (the results disagree and/or a lot of implementations error), but ➚ indicates a majority (and probable future consensus).
- e The implementation failed executing the query and probably does not support this type of query.
- ¹ This implementation returns queries with only a single possible match as a scalar element (e.g. <code>\$[0] => 42</code>). For the sake of comparing to other implementations these results are converted and wrapped in an array here.
- ² It is unclear whether results for this query have a defined order, and some implementations might apply different and even non-deterministic ordering. For comparison the results are sorted into a canonical order.
"
}

main
