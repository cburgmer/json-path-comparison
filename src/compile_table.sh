#!/bin/bash
set -euo pipefail

readonly results_dir="$1"
readonly consensus_dir="$2"
readonly implementations_matching_majority_dir="$3"

. src/shared.sh

all_implementations() {
    find ./implementations -name run.sh -maxdepth 2 -print0 | xargs -0 -n1 dirname | xargs -n1 basename | sort
}

all_queries() {
    find ./queries -type d -maxdepth 1 -mindepth 1 -print0 | xargs -0 -n1 basename | ./src/sort_queries.py
}

is_in_majority() {
    local query="$1"
    local implementation="$2"
    grep "^${implementation}\$" < "${implementations_matching_majority_dir}/${query}"> /dev/null
}

has_consensus() {
    local query="$1"
    test -s "${consensus_dir}/${query}"
}

give_mark() {
    local query="$1"
    local implementation="$2"

    # Error?
    if is_query_error "${results_dir}/${query}/${implementation}"; then
        echo "<a href=\"results/${query}.html#${implementation}\">e</a>"
        return
    fi

    if is_in_majority "$query" "$implementation"; then
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.html#consensus\">✓</a>"
        else
            echo "<a href=\"results/${query}.html#${implementation}\">➚</a>"
        fi
    else
        # So we are an outlier, but is there actually any gold standard?
        if has_consensus "$query"; then
            echo "<a href=\"results/${query}.html#${implementation}\">✗</a>"
        else
            echo "<a href=\"results/${query}.html#${implementation}\">➘</a>"
        fi
    fi
}

fix_line_break_on_osx() {
    tr -d '\n'
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
    echo "<a href=\"results/${query}.html\">${query_name}</a>"
    if [[ -f "${query_dir}/ALLOW_UNORDERED" ]]; then
        echo "⁴"
    fi
    echo "</td>"
    echo "<td>"
    if [[ -z "$selector" ]]; then
        echo "<em>n/a</em>"
    else
        echo -n "<code>"
        echo -n "$selector" | html_escape | fix_line_break_on_osx
        echo "</code>"
    fi
    echo "</td>"

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
    local path="$1"
    if [[ -f "${path}/LINK" ]]; then
        echo "<a href=\"$(cat "${path}/LINK")\">"
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
        echo "<div style=\"writing-mode: vertical-rl; white-space: nowrap;\">"
        sed "s/[^_]*_\(.*\)/\1/" <<< "$implementation" | wrap_with_link "./implementations/${implementation}"
        if implementation_returns_scalar_for_single_possible_match "$implementation"; then
            echo "¹"
        fi
        if implementation_returns_not_found_as_error "$implementation"; then
            echo "²"
        fi
        if implementation_returns_not_found_for_scalar_queries_as_error "$implementation"; then
            echo "³"
        fi
        echo "</div>"
        echo "</th>"
    done <<< "$(all_implementations)"

    echo "</tr>"
}

table() {
    echo "<h1>JSONPath Comparison</h1>

<p>See how <a href=\"https://www.rfc-editor.org/rfc/rfc9535\">JSONPath</a> is implemented across different languages.
See the <a href=\"https://github.com/cburgmer/json-path-comparison/blob/master/FAQ.md\">FAQ</a> for why we are doing this and where the results come from.</p>
"
    echo "
<h2>Explanation</h2>

<ul>
<li>✓ The result of this implementation matches the consensus of results.</li>
<li>✗ The result does not match the consensus.</li>
<li>➚ and ➘: no clear consensus amongst the implementations, but ➚ indicates a majority (and possible future consensus).</li>
<li>e The implementation failed executing the query.</li>
<li>¹ This implementation returns a single value where only one match is possible (instead of an array of a single value).</li>
<li>² This implementation returns a specific <em>not found</em> value if a query doesn't result in any matches.</li>
<li>³ This implementation returns a specific <em>not found</em> value if a query that would regularly return a single match results in no match.</li>
<li>⁴ It is unclear whether results for this query have a defined order, and some implementations might apply different and even non-deterministic ordering. For comparison the results are sorted into a canonical order.</li>
</ul>
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
}

adjust_css() {
    cat
    cat <<EOF
<style>
/* Make room for more columns */
.markdown-body table td, .markdown-body table th {
  padding: 6px 9px;
}
</style>
EOF
}

table_consensus_colouring() {
    cat
    # Make sure the selector is more specific than the markdown CSS
    cat <<EOF
<style>
.markdown-body tbody tr.consensus:nth-child(2n+1) {
  background: #eff;
}
.markdown-body tbody tr.consensus:nth-child(2n) {
  background: #e9f8fa;
}
.markdown-body tbody tr.no_consensus {
  background: #fff;
}
</style>
EOF
}

highlight_effect() {
    cat
    cat <<EOF
<style>
h3:target,
h4:target,
tbody tr:target,
tbody tr:hover {
  background-color: #ffa !important;
}
</style>
EOF
}

enhance_table_experience() {
    cat
    cat <<'EOF'
<style>
:root {
  --control-surface: #f9fafb;
  --border-color: #e1e4e8;
  --pill-bg: #eef2f7;
  --pill-border: #d5dce5;
  --pill-text: #111827;
  --accent: #2563eb;
  --muted: #475467;
}

.markdown-body {
  scroll-padding-top: 90px;
}

.markdown-body .table-shell {
  margin-top: 12px;
  border: 1px solid var(--border-color);
  border-radius: 10px;
  background: #fff;
  box-shadow: 0 8px 22px rgba(0, 0, 0, 0.04);
  overflow: hidden;
  border-top: 3px solid #0f172a0f;
}

.markdown-body .table-scroll {
  overflow: auto;
  height: calc(100vh - 12px);
}

.markdown-body table {
  width: 100%;
  margin: 0;
  border-collapse: collapse;
}

.markdown-body .comparison-controls {
  background: var(--control-surface);
  border-bottom: 1px solid var(--border-color);
  padding: 10px 12px;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.markdown-body .control-row {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-end;
  gap: 10px;
  row-gap: 12px;
}

.markdown-body .control-row .field {
  display: flex;
  flex-direction: column;
  gap: 4px;
  min-width: min(420px, 100%);
}

.markdown-body .field-label {
  font-size: 13px;
  color: #475467;
}

.markdown-body .control-row input[type="search"] {
  padding: 10px 12px;
  border: 1px solid #cfd7e3;
  border-radius: 8px;
  font-size: 14px;
  min-width: min(520px, 100%);
}

.markdown-body .control-row button {
  border: 1px solid #cdd5e1;
  background: #fff;
  padding: 8px 12px;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.12s ease-in-out;
  font-weight: 600;
  color: #0f172a;
}

.markdown-body .control-row button:hover {
  border-color: #94a3b8;
  background: #e2e8f0;
}

.markdown-body .implementation-actions button {
  border: 1px solid #cdd5e1;
  background: #fff;
  padding: 6px 10px;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.12s ease-in-out;
  font-weight: 600;
  color: #0f172a;
}

.markdown-body .implementation-actions button:hover {
  border-color: #94a3b8;
  background: #e2e8f0;
}

.markdown-body .checkbox {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 8px 10px;
  border-radius: 10px;
  background: #fff;
  border: 1px solid var(--pill-border);
  font-weight: 600;
}

.markdown-body .filter-panel {
  border: 1px solid var(--border-color);
  border-radius: 12px;
  background: #fff;
  padding: 6px 10px 10px;
}

.markdown-body .filter-panel summary {
  cursor: pointer;
  font-weight: 700;
  color: #0f172a;
  display: flex;
  align-items: center;
  gap: 6px;
}

.markdown-body .filter-panel summary::-webkit-details-marker {
  color: var(--muted);
}

.markdown-body .filter-panel .panel-body {
  margin-top: 10px;
  display: grid;
  gap: 10px;
}

.markdown-body .result-count {
  font-size: 14px;
  color: #1f2937;
  font-weight: 600;
  align-self: center;
}

.markdown-body details.implementation-panel {
  border: 1px solid var(--border-color);
  border-radius: 10px;
  background: #fff;
  padding: 10px 12px;
  overflow: hidden;
}

.markdown-body details.implementation-panel > summary,
.markdown-body details.filter-panel > summary {
  cursor: pointer;
  font-weight: 600;
  margin-bottom: 6px;
  color: #0f172a;
  list-style: none;
  position: relative;
  padding-left: 16px;
}

.markdown-body details.implementation-panel > summary::before,
.markdown-body details.filter-panel > summary::before {
  content: '▸';
  position: absolute;
  left: 0;
  top: 1px;
  color: var(--muted);
  transition: transform 0.12s ease-in-out;
}

.markdown-body details.implementation-panel[open] > summary::before,
.markdown-body details.filter-panel[open] > summary::before {
  transform: rotate(90deg);
}

.markdown-body .implementation-actions {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
  margin-bottom: 8px;
}

.markdown-body .implementation-actions button {
  background: #fff;
}

.markdown-body .implementation-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  align-items: stretch;
  justify-content: flex-start;
}

.markdown-body .implementation-grid .chip {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 6px 8px;
  border-radius: 10px;
  background: var(--pill-bg);
  border: 1px solid var(--pill-border);
  font-size: 13px;
  color: var(--pill-text);
  min-width: 0;
  min-height: 32px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.markdown-body .implementation-grid .chip .chip-meta {
  font-size: 12px;
  color: var(--muted);
  background: #fff;
  border: 1px solid var(--pill-border);
  border-radius: 999px;
  padding: 2px 6px;
  margin-left: auto;
}

.markdown-body .implementation-grid .chip.disabled {
  opacity: 0.45;
  text-decoration: line-through;
}

.markdown-body .col-hidden {
  max-width: 0 !important;
  width: 0 !important;
  min-width: 0 !important;
  padding: 0 !important;
  border: 0 !important;
  font-size: 0 !important;
}

.markdown-body .col-hidden a,
.markdown-body .col-hidden span,
.markdown-body .col-hidden code {
  display: none !important;
}

.markdown-body tbody tr:hover td {
  background-color: #ffa !important;
}

.markdown-body .col-highlight {
  background-color: #ffe6b3 !important;
}

@media (max-width: 960px) {
  .markdown-body table td, .markdown-body table th {
    padding: 6px 6px;
    font-size: 13px;
  }
  .markdown-body .table-scroll {
    height: auto;
  }
  .markdown-body thead span {
    writing-mode: horizontal-tb !important;
  }
}

@media (max-width: 640px) {
  .markdown-body .comparison-controls {
    position: sticky;
    top: 0;
    z-index: 7;
  }
  .github-corner {
    display: none;
  }
}
</style>
<script>
(function() {
  const article = document.querySelector('.markdown-body');
  const table = article ? article.querySelector('table') : null;
  if (!article || !table) return;

  const parent = table.parentNode;
  const shell = document.createElement('div');
  shell.className = 'table-shell';
  const controls = document.createElement('section');
  controls.className = 'comparison-controls';
  const scroller = document.createElement('div');
  scroller.className = 'table-scroll';

  parent.insertBefore(shell, table);
  shell.appendChild(controls);
  shell.appendChild(scroller);
  scroller.appendChild(table);

  const rows = Array.from(table.querySelectorAll('tbody tr'));
  const totalRows = rows.length;
  rows.forEach((row) => {
    const text = [
      row.cells[0] ? row.cells[0].innerText : '',
      row.cells[1] ? row.cells[1].innerText : ''
    ].join(' ').toLowerCase().replace(/\s+/g, ' ').trim();
    row.dataset.searchText = text;
  });

  controls.innerHTML = `
    <details class="filter-panel">
      <summary>Query filters</summary>
      <div class="panel-body">
        <div class="control-row">
          <label class="field">
            <span class="field-label">Search queries / selectors</span>
            <input type="search" id="query-search" placeholder="Filter by query name or selector" autocomplete="off">
          </label>
          <button type="button" id="reset-filters">Reset</button>
        </div>
        <div class="control-row">
          <label class="checkbox"><input type="checkbox" id="consensus-toggle" checked> Show consensus</label>
          <label class="checkbox"><input type="checkbox" id="no-consensus-toggle" checked> Show non-consensus</label>
          <span class="result-count" id="row-count"></span>
        </div>
      </div>
    </details>
    <details class="implementation-panel">
      <summary>Visible implementations</summary>
      <div class="implementation-actions">
        <button type="button" id="show-all-columns">Show all</button>
        <button type="button" id="hide-all-columns">Hide all</button>
      </div>
      <div class="implementation-grid" data-impl-list></div>
    </details>
  `;

  const searchInput = controls.querySelector('#query-search');
  const resetButton = controls.querySelector('#reset-filters');
  const consensusToggle = controls.querySelector('#consensus-toggle');
  const noConsensusToggle = controls.querySelector('#no-consensus-toggle');
  const rowCount = controls.querySelector('#row-count');
  const implList = controls.querySelector('[data-impl-list]');
  const showAllBtn = controls.querySelector('#show-all-columns');
  const hideAllBtn = controls.querySelector('#hide-all-columns');
  const languagePanel = document.createElement('details');
  languagePanel.className = 'implementation-panel';
  languagePanel.open = false;
  languagePanel.innerHTML = `
    <summary>Visible languages</summary>
    <div class="implementation-actions">
      <button type="button" id="show-all-languages">Show all</button>
      <button type="button" id="hide-all-languages">Hide all</button>
    </div>
    <div class="implementation-grid" data-language-list></div>
  `;
  controls.appendChild(languagePanel);
  const languageList = languagePanel.querySelector('[data-language-list]');
  const showAllLangBtn = languagePanel.querySelector('#show-all-languages');
  const hideAllLangBtn = languagePanel.querySelector('#hide-all-languages');
  const headerRow = table.querySelector('thead tr:nth-child(2)');
  const implementationCells = headerRow ? Array.from(headerRow.cells).slice(2) : [];
  const columns = implementationCells.map((cell, index) => {
    const label = cell.innerText.trim().replace(/\s+/g, ' ') || `Implementation ${index + 1}`;
    const columnIndex = index + 2;
    const cells = rows.map((row) => row.cells[columnIndex]).filter(Boolean);
    return { label, columnIndex, headerCell: cell, cells };
  });

  const languageHeaderRow = table.querySelector('thead tr:first-child');
  const languageCells = languageHeaderRow ? Array.from(languageHeaderRow.cells).slice(2) : [];
  const languages = [];
  const languageByIndex = [];
  const languageHeaders = new Map();
  let cursor = 0;
  languageCells.forEach((cell) => {
    const span = Number(cell.getAttribute('colspan') || 1);
    const lang = (cell.innerText || '').trim().replace(/\s+/g, ' ') || `Language ${languages.length + 1}`;
    if (!languages.includes(lang)) {
      languages.push(lang);
      languageHeaders.set(lang, cell);
    }
    for (let i = 0; i < span; i += 1) {
      languageByIndex[cursor] = lang;
      cursor += 1;
    }
  });
  columns.forEach((col, idx) => {
    col.language = languageByIndex[idx] || 'Other';
  });

  const columnByIndex = new Map(columns.map((c) => [c.columnIndex, c]));
  const languageState = new Map(languages.map((lang) => [lang, true]));
  const columnState = new Map(columns.map((c) => [c.columnIndex, true]));
  const columnsByLanguage = new Map(languages.map((lang) => [lang, []]));
  columns.forEach((col) => {
    columnsByLanguage.get(col.language).push(col);
  });

  function columnVisible(column) {
    return columnState.get(column.columnIndex) !== false && languageState.get(column.language) !== false;
  }

  function applyColumnVisibility() {
    columns.forEach((column) => {
      const visible = columnVisible(column);
      const targets = [column.headerCell, ...column.cells];
      targets.forEach((cell) => {
        if (!cell) return;
        cell.classList.toggle('col-hidden', !visible);
      });
    });

    languages.forEach((lang) => {
      const headerCell = languageHeaders.get(lang);
      if (!headerCell) return;
      const hasVisible = columns.some((c) => c.language === lang && columnVisible(c));
      headerCell.classList.toggle('col-hidden', !hasVisible);
    });
  }

  function syncLanguageState(lang) {
    const enabled = languageState.get(lang) !== false;
    (columnsByLanguage.get(lang) || []).forEach((col) => {
      if (col.checkboxInput) {
        col.checkboxInput.disabled = !enabled;
        col.chipEl?.classList.toggle('disabled', !enabled);
      }
    });
  }

  function applyRowFilters() {
    const term = searchInput.value.trim().toLowerCase();
    const showConsensus = consensusToggle.checked;
    const showNonConsensus = noConsensusToggle.checked;
    let visibleCount = 0;

    rows.forEach((row) => {
      const matchesText = !term || row.dataset.searchText.includes(term);
      const isConsensus = row.classList.contains('consensus');
      const matchesConsensus = (isConsensus && showConsensus) || (!isConsensus && showNonConsensus);
      const show = matchesText && matchesConsensus;
      row.style.display = show ? '' : 'none';
      if (show) visibleCount += 1;
    });

    rowCount.textContent = `${visibleCount} / ${totalRows} queries shown`;
  }

  function buildImplementationFilters() {
    const fragment = document.createDocumentFragment();
    columns.forEach((col) => {
      const label = document.createElement('label');
      label.className = 'chip';
      label.dataset.language = col.language;
      const input = document.createElement('input');
      input.type = 'checkbox';
      input.checked = true;
      input.dataset.columnIndex = col.columnIndex;
      input.addEventListener('change', () => {
        columnState.set(col.columnIndex, input.checked);
        applyColumnVisibility();
      });
      const meta = document.createElement('span');
      meta.className = 'chip-meta';
      meta.textContent = col.language;
      const text = document.createElement('span');
      text.textContent = col.label;
      label.appendChild(input);
      label.appendChild(meta);
      label.appendChild(text);
      fragment.appendChild(label);
      col.checkboxInput = input;
      col.chipEl = label;
    });
    implList.appendChild(fragment);
  }

  function buildLanguageFilters() {
    const fragment = document.createDocumentFragment();
    languages.forEach((lang) => {
      const label = document.createElement('label');
      label.className = 'chip';
      const input = document.createElement('input');
      input.type = 'checkbox';
      input.checked = true;
      input.dataset.language = lang;
      input.addEventListener('change', () => {
        languageState.set(lang, input.checked);
        syncLanguageState(lang);
        applyColumnVisibility();
      });
      const text = document.createElement('span');
      text.textContent = lang;
      label.appendChild(input);
      label.appendChild(text);
      fragment.appendChild(label);
    });
    languageList.appendChild(fragment);
  }

  searchInput.addEventListener('input', applyRowFilters);
  consensusToggle.addEventListener('change', applyRowFilters);
  noConsensusToggle.addEventListener('change', applyRowFilters);
  resetButton.addEventListener('click', () => {
    searchInput.value = '';
    consensusToggle.checked = true;
    noConsensusToggle.checked = true;
    implList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      input.checked = true;
      const columnIdx = Number(input.dataset.columnIndex);
      columnState.set(columnIdx, true);
    });
    languageList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      input.checked = true;
      languageState.set(input.dataset.language, true);
      syncLanguageState(input.dataset.language);
    });
    applyColumnVisibility();
    applyRowFilters();
  });

  showAllBtn.addEventListener('click', () => {
    implList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      if (!input.checked) input.checked = true;
      const columnIdx = Number(input.dataset.columnIndex);
      columnState.set(columnIdx, true);
    });
    applyColumnVisibility();
  });

  hideAllBtn.addEventListener('click', () => {
    implList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      if (input.checked) input.checked = false;
      const columnIdx = Number(input.dataset.columnIndex);
      columnState.set(columnIdx, false);
    });
    applyColumnVisibility();
  });

  showAllLangBtn.addEventListener('click', () => {
    languageList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      if (!input.checked) input.checked = true;
      languageState.set(input.dataset.language, true);
      syncLanguageState(input.dataset.language);
    });
    applyColumnVisibility();
  });

  hideAllLangBtn.addEventListener('click', () => {
    languageList.querySelectorAll('input[type="checkbox"]').forEach((input) => {
      if (input.checked) input.checked = false;
      languageState.set(input.dataset.language, false);
      syncLanguageState(input.dataset.language);
    });
    applyColumnVisibility();
  });

  buildImplementationFilters();
  buildLanguageFilters();
  languages.forEach(syncLanguageState);
  applyColumnVisibility();
  applyRowFilters();

  const columnCells = new Map();
  const highlightHeaderRow = table.querySelector('thead tr:nth-child(2)');
  if (highlightHeaderRow) {
    Array.from(highlightHeaderRow.cells).forEach((cell, idx) => {
      if (idx >= 2) {
        if (!columnCells.has(idx)) columnCells.set(idx, []);
        columnCells.get(idx).push(cell);
      }
    });
  }
  rows.forEach((row) => {
    Array.from(row.cells).forEach((cell, idx) => {
      if (idx >= 2) {
        if (!columnCells.has(idx)) columnCells.set(idx, []);
        columnCells.get(idx).push(cell);
      }
    });
  });

  let activeColumn = null;
  function highlightColumn(idx) {
    if (activeColumn !== null && columnCells.has(activeColumn)) {
      columnCells.get(activeColumn).forEach((cell) => cell.classList.remove('col-highlight'));
    }
    activeColumn = idx;
    if (idx !== null && columnCells.has(idx)) {
      columnCells.get(idx).forEach((cell) => cell.classList.add('col-highlight'));
    }
  }

  table.addEventListener('mouseover', (e) => {
    const cell = e.target.closest('td,th');
    if (!cell || !table.contains(cell)) return;
    if (cell.cellIndex < 2) {
      highlightColumn(null);
      return;
    }
    highlightColumn(cell.cellIndex);
  });

  table.addEventListener('mouseout', (e) => {
    const related = e.relatedTarget;
    if (related && table.contains(related) && related.closest('td,th')) return;
    highlightColumn(null);
  });

})();
</script>
EOF
}

main() {
    table | beautiful_html | adjust_css | table_consensus_colouring | highlight_effect | enhance_table_experience
}

main
