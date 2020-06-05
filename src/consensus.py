#!/usr/bin/env python3
import sys
import json
from collections import OrderedDict

def multiple_matches_majority(canonical_consensus):
    print("consensus" + "\t" + canonical_consensus)

def single_match_majority(canonical_consensus):
    j = json.loads(canonical_consensus, object_pairs_hook=OrderedDict)
    assert type(j) == list
    assert len(j) == 1

    print("consensus" + "\t" + canonical_consensus)

    scalar = j[0]
    print("scalar-consensus" + "\t" + json.dumps(scalar))

def no_match_majority(canonical_consensus):
    assert canonical_consensus == "[]"
    print("consensus" + "\t" + "[]")
    print("scalar-consensus" + "\t" + "null")

def not_supported_majority(canonical_consensus):
    assert canonical_consensus == ""
    print("consensus" + "\t" + "NOT_SUPPORTED")

def main():
    majority_type = sys.stdin.readline().rstrip('\n')
    canonical_consensus = sys.stdin.readline().rstrip('\n')

    consensus_mapper = {
        "multiple_matches": multiple_matches_majority,
        "single_match": single_match_majority,
        "no_match": no_match_majority,
        "not_supported": not_supported_majority
    }
    consensus_mapper[majority_type](canonical_consensus)

if __name__ == '__main__':
    sys.exit(main())
