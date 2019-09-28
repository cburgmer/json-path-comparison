#!/usr/bin/env python3
import sys
import json

def main():
    try:
        j = json.loads(sys.stdin.read())
    except Exception as e:
        print(e)
        sys.exit(1)

    if type(j) == list:
        j.sort(key = json.dumps)

    print(json.dumps(j))

if __name__ == '__main__':
    sys.exit(main())
