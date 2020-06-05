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


def is_no_match(result_path):
    result_type, payload = query_result_payload(result_path)
    if result_type != "OK":
        return False

    return ((payload is None and is_from_scalar_implementation(result_path)) or
            (payload == [] and is_from_list_implementation(result_path)))

def build_histogram(pairs):
    histogram = defaultdict(lambda: [])
    for key, value in pairs:
        histogram[value].append(key)

    return histogram


def not_supported_majority(result_paths):
    result_paths_with_not_supported = []
    for result_path in result_paths:
        result_type, _ = query_result_payload(result_path)
        if result_type != "NOT_SUPPORTED":
            continue
        result_paths_with_not_supported.append(result_path)

    return [("not_supported", '', result_paths_with_not_supported)]

def no_match_majority(result_paths):
    result_paths_with_no_match = [path for path in result_paths if is_no_match(path)]

    canonical_consensus_candidate = "[]"
    return [("no_match", canonical_consensus_candidate, result_paths_with_no_match)]

def single_match_majority(result_paths):
    result_payloads = []
    for result_path in result_paths:
        result_type, payload = query_result_payload(result_path)
        if result_type != "OK":
            continue
        canonical_consensus_candidate = ([payload]
                                         if is_from_scalar_implementation(result_path)
                                         else payload)
        result_payloads.append(tuple([result_path, json.dumps(canonical_consensus_candidate)]))

    return [("single_match", canonical_payload, paths) for canonical_payload, paths in build_histogram(result_payloads).items()]

def multiple_matches_majority(result_paths):
    result_payloads = []
    for result_path in result_paths:
        result_type, payload = query_result_payload(result_path)
        if result_type != "OK":
            continue
        result_payloads.append(tuple([result_path, json.dumps(payload)]))

    return [("multiple_matches", payload, paths) for payload, paths in build_histogram(result_payloads).items()]

def calculate_majority_candidates(result_paths):
    majority_candidates = (multiple_matches_majority(result_paths) +
                           single_match_majority(result_paths) +
                           no_match_majority(result_paths) +
                           not_supported_majority(result_paths))

    unique_candidates = defaultdict(lambda: None)
    for match_type, canonical_consensus_candidate, paths in majority_candidates:
        key = tuple(sorted(paths))
        unique_candidates[key] = (unique_candidates[key] or
                                  {"type": match_type,
                                   "consensus": canonical_consensus_candidate,
                                   "paths": paths})

    return unique_candidates.values()

def is_clear_majority(candidate_ranking):
    return (len(candidate_ranking) < 2 or
            len(candidate_ranking[-1]["paths"]) != len(candidate_ranking[-2]["paths"]))


def multiple_matches_majority_result(canonical_consensus):
    return {
        "consensus": canonical_consensus
    }

def single_match_majority_result(canonical_consensus):
    j = json.loads(canonical_consensus, object_pairs_hook=OrderedDict)
    assert type(j) == list
    assert len(j) == 1

    scalar = j[0]
    return {
        "consensus": canonical_consensus,
        "scalar-consensus": json.dumps(scalar)
    }

def no_match_majority_result(canonical_consensus):
    assert canonical_consensus == "[]"
    return {
        "consensus": canonical_consensus,
        "scalar-consensus": "null"
    }

def not_supported_majority_result(canonical_consensus):
    return {
        "consensus": "NOT_SUPPORTED"
    }

def majority_result(majority_type, canonical_consensus):
    consensus_mapper = {
        "multiple_matches": multiple_matches_majority_result,
        "single_match": single_match_majority_result,
        "no_match": no_match_majority_result,
        "not_supported": not_supported_majority_result,
    }
    return consensus_mapper[majority_type](canonical_consensus)

def print_dict(d):
    for key, value in d.items():
        print(key + "\t" + value)


def main():
    result_paths = [line.rstrip('\n') for line in sys.stdin]

    majority_candidates = calculate_majority_candidates(result_paths)

    candidate_ranking = sorted(majority_candidates, key=lambda candidate: len(candidate["paths"]))
    if is_clear_majority(candidate_ranking):
        majority = candidate_ranking[-1]
        print_dict({
            "count": str(len(majority["paths"])),
            "type": majority["type"],
            **majority_result(majority["type"], majority["consensus"])
        })

if __name__ == '__main__':
    sys.exit(main())
