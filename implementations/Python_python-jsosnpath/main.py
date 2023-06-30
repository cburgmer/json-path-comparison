import sys
import json
import jsonpath


def main():
    selector = sys.argv[1]
    try:
        path = jsonpath.compile(selector)
    except Exception as e:
        print(repr(e))
        sys.exit(2)

    j = json.loads(sys.stdin.read())
    try:
        results = path.findall(j)
    except (IndexError, KeyError) as e:
        print(repr(e))
        sys.exit(1)

    print(json.dumps(results))


if __name__ == "__main__":
    sys.exit(main())
