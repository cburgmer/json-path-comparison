import sys
import json
from jsonpath_ng import jsonpath, parse


def main():
    selector = sys.argv[1]
    try:
        jsonpath_expr = parse(selector)
    except Exception as e:
        print(repr(e))
        sys.exit(2)

    j = json.loads(sys.stdin.read())
    try:
        results = [match.value for match in jsonpath_expr.find(j)]
    except (IndexError, KeyError, ValueError) as e:
        print(repr(e))
        sys.exit(1)

    print(json.dumps(results))

if __name__ == '__main__':
    sys.exit(main())
