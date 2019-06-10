#!/bin/bash
set -euo pipefail

readonly tmp_result_dir="$1"
readonly tmp_results_report_dir="$2"
readonly target_dir="$3"

. src/shared.sh


tools_diverging_from() {
    local results_dir="$1"
    local tool="$2"
    local other_tool

    while IFS= read -r other_tool; do
        if ! diff "${results_dir}/${tool}" "${results_dir}/${other_tool}" > /dev/null; then
            echo "$other_tool"
        fi
    done <<< "$(find "$results_dir" -type f -print0 | xargs -0 -n1 basename | grep -v "^$tool\$")"
}

compare_results() {
    local results_dir="$1"
    local tool="$2"
    local results_count
    results_count="$(find "$results_dir" -type f | wc -l)"

    if [[ $results_count -eq 1 ]]; then
        # nothing to compare to, might or might not be correct
        echo "?"
        return 0
    fi

    if [[ $results_count -eq 2 ]]; then
        # 2 items should match to get a check mark
        if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -eq 0 ]]; then
            echo "✓"
            return 0
        else
            echo "?"
            return 1
        fi
    fi

    # If everybody agrees with me except one we are in a safe majority
    if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -lt 2 ]]; then
        echo "✓"
        return 0
    else
        echo "✗"
        return 1
    fi
}

compile_row() {
    local query="$1"
    local query_dir="./queries/${query}"
    local selector_file="$query_dir"/selector
    local results_dir="${tmp_result_dir}/${query}"
    local results_report_dir="${tmp_results_report_dir}/${query}"
    local selector
    local query_name
    local tool
    local error_key
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td><a href=\"results/${query}.md\">${query_name}</a></td>"
    echo "<td><code>${selector}</code></td>"

    mkdir -p "$results_report_dir"

    while IFS= read -r tool; do
        error_key="${tool}___${query}"
        echo "<td>"
        if [[ -f "${results_dir}/${tool}" ]]; then
            if compare_results "$results_dir" "$tool"; then
                cp "${results_dir}/${tool}" "${results_report_dir}/ Gold Standard_consensus"
            else
                cp "${results_dir}/${tool}" "${results_report_dir}/${tool}"
            fi
        else
            echo "<a href=\"errors.md#${error_key}\">e</a>"
        fi
        echo "</td>"
    done <<< "$(list_of_tools)"

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
    done <<< "$(list_of_tools)"
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
    done <<< "$(all_queries)"

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
