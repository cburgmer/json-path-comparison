import sys
import json
from jsonpath import jsonpath

def main():
    selector = sys.argv[1]

    j = json.loads(sys.stdin.read())
    results = jsonpath(j, selector, 'VALUE')

    if not results:
        sys.exit(1)

    print(json.dumps(results))

if __name__ == '__main__':
    sys.exit(main())
