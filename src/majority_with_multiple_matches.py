#!/usr/bin/env python3
import sys
import json
from collections import OrderedDict, defaultdict
from itertools import groupby

def query_result_payload(result_path):
    f = open(result_path, 'r')
    f.readline() # skip result type
    return json.loads(f.read(), object_pairs_hook=OrderedDict)

def canonical_result_payload(result_path):
    return json.dumps(query_result_payload(result_path))

def build_histogram(result_path):
    histogram = defaultdict(lambda: [])
    for path in result_path:
        payload = canonical_result_payload(path)
        histogram[payload].append(path)
    return histogram

def main():
    result_paths = [line.rstrip('\n') for line in sys.stdin]
    result_groups = build_histogram(result_paths).values()

    ranking = sorted(result_groups, key=len)

    if len(ranking) > 1 and len(ranking[-1]) == len(ranking[-2]):
        # No majority if 2 top results have same count
        return

    print("\n".join(ranking[-1]))

if __name__ == '__main__':
    sys.exit(main())
