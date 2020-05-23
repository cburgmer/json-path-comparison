#!/usr/bin/env python3
import sys
import os
import json
from collections import OrderedDict, defaultdict
from itertools import groupby

def implementation_name(result_path):
    return os.path.basename(result_path)

def query_result_payload(result_path):
    f = open(result_path, 'r')
    result_type = f.readline().rstrip('\n')
    if result_type == 'OK':
        return result_type, json.loads(f.read(), object_pairs_hook=OrderedDict)
    else:
        return result_type, None

def is_from_scalar_implementation(result_path):
    implementation = implementation_name(result_path)
    flag_path = os.path.join('implementations', implementation, 'SINGLE_POSSIBLE_MATCH_RETURNED_AS_SCALAR')
    return os.path.exists(flag_path)

def is_from_list_implementation(result_path):
    return not is_from_scalar_implementation(result_path)


def no_match(result_path):
    result_type, payload = query_result_payload(result_path)
    if result_type != "OK":
        return False

    return (payload == [None] and is_from_scalar_implementation(result_path) or
            payload == [] and is_from_list_implementation(result_path))


def no_match_majority(result_paths):
    result_paths_with_no_match = [path for path in result_paths if no_match(path)]

    return [result_paths_with_no_match]


def build_histogram(result_paths):
    histogram = defaultdict(lambda: [])
    for result_path in result_paths:
        result_type, payload = query_result_payload(result_path)
        if result_type != "OK":
            continue
        histogram[json.dumps(payload)].append(result_path)

    return histogram

def multiple_matches_majority(result_paths):
    return list(build_histogram(result_paths).values())


def calculate_majority_candidates(result_paths):
    majority_candidates = no_match_majority(result_paths) + multiple_matches_majority(result_paths)
    unique_candidates = set([tuple(sorted(candidate)) for candidate in majority_candidates])
    return unique_candidates

def is_clear_majority(ranking):
    return len(ranking) < 2 or len(ranking[-1]) != len(ranking[-2])


def main():
    result_paths = [line.rstrip('\n') for line in sys.stdin]

    majority_candidates = calculate_majority_candidates(result_paths)

    ranking = sorted(majority_candidates, key=len)
    if is_clear_majority(ranking):
        print("\n".join(ranking[-1]))

if __name__ == '__main__':
    sys.exit(main())
