#!/usr/bin/env python
import sys
import json

def main():
    j = json.loads(sys.stdin.read())

    assert type(j) == list
    assert len(j) == 1

    scalar = j[0]
    print(json.dumps(scalar))

if __name__ == '__main__':
    sys.exit(main())
