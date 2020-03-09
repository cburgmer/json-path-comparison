#!/usr/bin/env python3
import sys
import re

def split_on(q):
    fragments = q.split('_on_')
    if len(fragments) == 1:
        return q, ''
    else:
        # Split on the last _on_ to hopefully reduce surprises.
        # Assumption is that there's more (complex) text to the left than to the
        # right of it.
        return '_on_'.join(fragments[:-1]), fragments[-1]

def split_operators(selector_only_query):
    return selector_only_query.split(r'_after_')

def split_operator_parameter(selector_segment):
    return re.search(r'^(.+?)((?:_(?:with|without)_.+)?)$', selector_segment).groups()

def split_query(query):
    """
    Splits the query into it's components.

    E.g.
    "array slice without start and end after bracket notation with wildcard on
      nested arrays"
    returns
    ([("array slice", "without start and end"), ("bracket notation", "with wildcard")], "nested arrays")
    """
    selector_only_query, on_document_specifier = split_on(query)

    operators = split_operators(selector_only_query)
    parts = [split_operator_parameter(o) for o in operators]

    return tuple([parts, on_document_specifier])

def main():
    queries = [q.replace('\n', '') for q in sys.stdin]

    for query in sorted(queries, key=split_query):
        print(query)

if __name__ == '__main__':
    main()
