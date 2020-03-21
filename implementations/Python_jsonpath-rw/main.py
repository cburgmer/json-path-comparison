import sys
import json
from jsonpath_rw import parse


def main():
    selector = sys.argv[1]
    try:
        query = parse(selector)
    except Exception as e:
        print(repr(e))
        sys.exit(1)

    j = json.loads(sys.stdin.read())
    try:
        results = [match.value for match in query.find(j)]
    except (IndexError, KeyError) as e:
        print(repr(e))
        sys.exit(1)

    print(json.dumps(results))

if __name__ == '__main__':
    sys.exit(main())
