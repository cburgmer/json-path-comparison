#!/usr/bin/env python3
import sys
import json
import rfc8785

def main():
    try:
        j = json.loads(sys.stdin.read())
    except Exception as e:
        print(e)
        sys.exit(1)

    print(rfc8785.dumps(j).decode('utf8'))

if __name__ == '__main__':
    sys.exit(main())
