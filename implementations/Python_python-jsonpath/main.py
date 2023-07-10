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

    try:
        results = path.findall(sys.stdin.read())
    except json.JSONDecodeError as e:
        print("Invalid JSON document -", e)
        sys.exit(1)
    except Exception as e:
        print(repr(e))
        sys.exit(1)

    print(json.dumps(results))


if __name__ == "__main__":
    sys.exit(main())
