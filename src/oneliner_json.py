#!/usr/bin/env python
import sys
import json

def main():
    j = json.loads(sys.stdin.read())
    print(json.dumps(j))

if __name__ == '__main__':
    sys.exit(main())
