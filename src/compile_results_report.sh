#!/usr/bin/env bash

set -euo pipefail

readonly results_dir="$1"
readonly implementations_matching_majority_dir="$2"
readonly consensus_dir="$3"
readonly query_dir="$4"
readonly query="$(basename "$query_dir")"

. src/shared.sh

all_implementations_and_proposals() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
    find ./proposals -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

is_in_majority() {
    local implementation="$1"
    grep "^${implementation}\$" < "${implementations_matching_majority_dir}/${query}" > /dev/null
}

has_consensus() {
    test -s "${consensus_dir}/${query}"
}

is_outlier() {
    local implementation="$1"
    ! is_query_error "${results_dir}/${query}/${implementation}" && (! has_consensus || ! is_in_majority "$implementation")
}

implementation_outliers() {
    local implementation
    while IFS= read -r implementation; do
        if is_outlier "$implementation"; then
            echo "$implementation"
        fi
    done <<< "$(all_implementations_and_proposals)"
}

implementation_errors() {
    local implementation
    while IFS= read -r implementation; do
        if is_query_error "${results_dir}/${query}/${implementation}"; then
            echo "$implementation"
        fi
    done <<< "$(all_implementations_and_proposals)"
}

output_setup() {
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local selector
    selector="$(cat "${selector_file}")"

    echo "Selector: \`${selector}\`"
    echo

    pre_block < "$document"
}

pretty_result() {
    local result="$1"

    if [[ "$result" == "NOT_SUPPORTED" ]]; then
        echo "Not supported"
        return
    fi

    if [[ "$result" == "NOT_FOUND" ]]; then
        echo "Not found"
        return
    fi

    ./src/pretty_json.py <<< "$result" | pre_block
}

consensus() {
    local line

    declare -A consensus_explanation
    consensus_explanation["scalar-consensus"]="The scalar consensus applies for implementations which return a single value where only one match is possible (instead of an array of a single value)."
    consensus_explanation["not-found-consensus"]="This consensus applies for implementations which return a specific *not found* value if no match exists."
    consensus_explanation["scalar-not-found-consensus"]="This consensus applies for implementations which returns a specific *not found* value when a query that would regularly return a single match results in no match."

    pretty_result "$(grep '^consensus' < "${consensus_dir}/${query}" | cut -f2)"

    while IFS= read -r line; do
        if [[ -z "$line" ]]; then
            break
        fi

        echo "<h4>"
        cut -f1 <<< "$(capitalize "$line")" | tr '-' ' '
        echo "</h4>"
        echo
        echo "${consensus_explanation[$(cut -f1 <<< "$line")]}"
        echo
        cut -f2 <<< "$line" | pre_block
    done <<< "$(grep -v '^consensus' < "${consensus_dir}/${query}" | grep consensus)"
}

implementation_header() {
    local implementation="$1"

    echo "<h4 id=\"$implementation\">"
    pretty_implementation_name "$implementation"
    if implementation_returns_scalar_for_single_possible_match "$implementation"; then
        echo "¹"
    fi
    if implementation_returns_not_found_as_error "$implementation"; then
        echo "²"
    fi
    if implementation_returns_not_found_for_scalar_queries_as_error "$implementation"; then
        echo "³"
    fi
    echo "</h4>"
}

main() {
    local implementation
    local outliers
    local errors

    echo "# $(pretty_query_name "$query")"
    echo

    echo "## Setup"
    output_setup
    echo

    echo "## Results"

    if has_consensus; then
        echo '<h3 id="consensus">Consensus</h3>'
        echo
        consensus
        echo
    fi

    outliers="$(implementation_outliers)"

    if [[ -n "$outliers" ]]; then
        echo "### Other responses"
        echo

        while IFS= read -r implementation; do
            implementation_header "$implementation"
            echo
            if is_query_not_supported "${results_dir}/${query}/${implementation}"; then
                pretty_result "NOT_SUPPORTED"
                echo
                query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
            else
                if is_query_result_not_found "${results_dir}/${query}/${implementation}"; then
                    pretty_result "NOT_FOUND"
                    echo
                    query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
                else
                    pretty_result "$(query_result_payload "${results_dir}/${query}/${implementation}")"
                fi
            fi
            echo
        done <<< "$outliers"
    fi

    errors="$(implementation_errors)"

    if [[ -n "$errors" ]]; then
        echo "### Errors"
        echo

        while IFS= read -r implementation; do
            implementation_header "$implementation"
            echo
            query_result_payload "${results_dir}/${query}/${implementation}" | pre_block
            echo
        done <<< "$errors"
    fi

    echo "
## Footnotes

- ¹ This implementation returns a single value where only one match is possible (instead of an array of a single value).
- ² This implementation returns a specific *not found* value if no match exists.
- ³ This implementation returns a specific *not found* value if a query that would regularly return a single match results in no match.
"
}

main
