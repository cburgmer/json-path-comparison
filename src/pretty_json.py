#!/usr/bin/env python3
import sys
import json
from collections import OrderedDict

def main():
    j = json.loads(sys.stdin.read(), object_pairs_hook=OrderedDict)
    print(json.dumps(j, indent=2))

if __name__ == '__main__':
    sys.exit(main())
