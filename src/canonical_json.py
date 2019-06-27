#!/usr/bin/env python
import sys
import json

def main():
    try:
        j = json.loads(sys.stdin.read())
    except Exception as e:
        print e
        sys.exit(1)

    print(json.dumps(j, sort_keys=True, indent=2))

if __name__ == '__main__':
    sys.exit(main())
