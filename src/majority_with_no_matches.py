#!/usr/bin/env python3
import sys
import json
import os
from collections import OrderedDict, defaultdict
from itertools import groupby

def implementation_name(result_path):
    return os.path.basename(result_path)

def is_from_scalar_implementation(result_path):
    implementation = implementation_name(result_path)
    flag_path = os.path.join('implementations', implementation, 'SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR')
    return os.path.exists(flag_path)

def query_result_payload(result_path):
    f = open(result_path, 'r')
    result_type = f.readline().rstrip('\n')
    if result_type == 'OK':
        return result_type, json.loads(f.read(), object_pairs_hook=OrderedDict)
    else:
        return result_type, None

def canonical_result_payload(result_path):
    _, payload = query_result_payload(result_path)
    if payload == [None] and is_from_scalar_implementation(result_path):
        return json.dumps([])
    else:
        return json.dumps(payload)

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
