#!/bin/bash
set -euo pipefail

readonly script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly tmp_error_report_dir="/tmp/compare_jsonpath.errors.$$"
readonly tmp_result_dir="/tmp/compare_jsonpath.results.$$"

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

run_query() {
    local tool="$1"
    local selector="$2"
    local document="$3"

    "${script_dir}/tools/${tool}"/run.sh "$selector" < "$document"
}

list_of_tools() {
    find "$script_dir"/tools -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

diff_multiple_files() {
    local results_dir="$1"
    local first_file
    local other_file
    {
        read -r first_file
        while IFS= read -r other_file; do
            if ! diff "$first_file" "$other_file" > /dev/null; then
                return 1
            fi
        done
    } <<< "$(find "$results_dir" -type f)"
    return 0
}

tools_diverging_from() {
    local results_dir="$1"
    local tool="$2"
    local other_tool

    while IFS= read -r other_tool; do
        if ! diff "${results_dir}/${tool}" "${results_dir}/${other_tool}" > /dev/null; then
            echo "$other_tool"
        fi
    done <<< "$(find "$results_dir" -type f -print0 | xargs -0 -n1 basename | grep -v "$tool")"
}

compare_results() {
    local results_dir="$1"
    local tool="$2"
    local results_count
    results_count="$(find "$results_dir" -type f | wc -l)"

    if [[ $results_count -eq 1 ]]; then
        # nothing to compare to, maybe, maybe not correct
        echo "(✓)"
        return
    fi

    if [[ $results_count -eq 2 ]]; then
        # 2 items should match to get a check mark
        if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -eq 0 ]]; then
            echo "✓"
        else
            echo "?"
        fi
        return
    fi

    # If everybody agrees with me except one we are in a safe majority
    if [[ $(tools_diverging_from "$results_dir" "$tool" | wc -l) -lt 2 ]]; then
        echo "✓"
    else
        echo "✗"
    fi
}

compile_row() {
    local query="$1"
    local query_dir="${script_dir}/queries/${query}"
    local selector_file="$query_dir"/selector
    local document="$query_dir"/document.json
    local results_dir="${tmp_result_dir}/${query}"
    local selector
    local query_name
    local tool
    local error_key
    selector="$(cat "${selector_file}")"
    query_name="$(pretty_query_name "$query")"

    echo "<tr>"
    echo "<td>${query_name}</td>"
    echo "<td><code>${selector}</code></td>"

    mkdir -p "$results_dir"

    while IFS= read -r tool; do
        error_key="${tool}___${query}"
        if run_query "$tool" "$selector" "$document" > "${results_dir}/${tool}" 2> "${tmp_error_report_dir}/${error_key}"; then
            rm "${tmp_error_report_dir}/${error_key}"

            jp < "${results_dir}/${tool}" > "${results_dir}/${tool}.json"
            mv "${results_dir}/${tool}.json" "${results_dir}/${tool}"
        else
            rm "${results_dir}/${tool}"
        fi
    done <<< "$(list_of_tools)"

    while IFS= read -r tool; do
        error_key="${tool}___${query}"
        echo "<td>"
        if [[ -f "${results_dir}/${tool}" ]]; then
            compare_results "$results_dir" "$tool"
        else
            echo "<a href=\"#${error_key}\">e</a>"
        fi
        echo "</td>"
    done <<< "$(list_of_tools)"

    echo "</tr>"
}

all_errors() {
    find "${tmp_error_report_dir}" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort
}

pre_block() {
    sed 's/^/    /'
}

nice_error_headline() {
    local error_key="$1"
    local query
    local tool
    query="$(sed "s/.*___\(.*\)/\1/" <<< "$error_key")"
    tool="$(sed "s/\(.*\)___.*/\1/" <<< "$error_key")"

    echo "$(pretty_tool_name "$tool"), $(pretty_query_name "$query")"
}

compile_error_report() {
    local error_key

    echo "## Errors"
    echo
    while IFS= read -r error_key; do
        echo "<h3 id=\"${error_key}\">"
        echo "$(nice_error_headline "$error_key")"
        echo "</h3>"
        echo
        pre_block < "${tmp_error_report_dir}/${error_key}"
        echo
    done <<< "$(all_errors)"
}

all_query_results() {
    find "${tmp_result_dir}" -type d -depth 1 -print0 | xargs -0 -n1 basename | sort
}

tool_results_for_query() {
    local query="$1"
    find "${tmp_result_dir}/${query}" -type f -depth 1 -print0 | xargs -0 -n1 basename | sort
}

compile_result_report() {
    local query
    local tool

    echo "## Results"
    echo
    while IFS= read -r query; do
        echo "<h3 id=\"${query}\">"
        echo "$(pretty_query_name "$query")"
        echo "</h3>"
        echo

        while IFS= read -r tool; do
            echo "<h4>"
            echo "$tool"
            echo "</h4>"
            pre_block < "${tmp_result_dir}/${query}/${tool}"
            echo
        done <<< "$(tool_results_for_query "$query")"
    done <<< "$(all_query_results)"
}

header_row() {
    local tool
    local tool_name

    echo "<tr>"
    echo "<th></th>"
    echo "<th></th>"
    while IFS= read -r tool; do
        tool_name="$(pretty_tool_name "$tool")"
        echo "<th>${tool_name}</th>"
    done <<< "$(list_of_tools)"
    echo "</tr>"
}

all_queries() {
    find "$script_dir"/queries -type d -depth 1 -print0 \
        | xargs -0 -n1 -I% sh -c 'echo "$(cat %/selector)\t%"' \
        | sort \
        | cut -f2 \
        | xargs -n1 basename
}

main() {
    mkdir -p "$tmp_error_report_dir"
    mkdir -p "$tmp_result_dir"

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
- ✗, a result is different to multiple others
- ?, the results disagree, but there are not enough samples to be conclusive on which one is probably correct
- (✓), there are not enough candidates available to check for correctness
- \`e\`, the tool failed executing the query and probably does not support this type of query"

    echo
    compile_result_report

    echo
    compile_error_report

    rm -r "$tmp_error_report_dir"
    rm -r "$tmp_result_dir"
}

main
