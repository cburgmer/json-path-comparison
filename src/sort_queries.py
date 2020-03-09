#!/usr/bin/env python3
import sys
import re

MAX_SELECTOR_SEGMENTS=4

def split_on(q):
    fragments = q.split('_on_')
    if len(fragments) == 1:
        return q, ''
    else:
        return '_on_'.join(fragments[:-1]), '_on_' + fragments[-1]

def split_selector_segments(selector_only_query):
    return selector_only_query.split(r'_after_')

def split_with(selector_segment):
    return re.search(r'^(.+?)((?:_(?:with|without)_.+)?)$', selector_segment).groups()

def annotate_query(query):
    selector_only_query, on_document_specifier = split_on(query)

    selector_segments = split_selector_segments(selector_only_query)

    parts = []
    parts += split_with(selector_segments[0])

    for segment in selector_segments[1:]:
        base_selector, selector_option = split_with(segment)
        parts.append('_after_' + base_selector)
        parts.append(selector_option)

    # HACK move 'on' part to the very end to avoid it from clashing with the
    #  other sort keys.
    while len(parts) < 2 * MAX_SELECTOR_SEGMENTS:
        parts.append('')
    parts.append(on_document_specifier)

    return parts

def main():
    queries = []
    for query in sys.stdin:
        queries.append(tuple(annotate_query(query.replace('\n', ''))))

    for query in sorted(queries):
        print(''.join(query))

if __name__ == '__main__':
    main()
