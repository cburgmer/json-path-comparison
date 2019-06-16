import sys
import json
from jsonpath_rw import parse


def main():
    selector = sys.argv[1]
    query = parse(selector)

    j = json.loads(sys.stdin.read())
    results = [match.value for match in query.find(j)]

    print(json.dumps(results))

if __name__ == '__main__':
    sys.exit(main())
