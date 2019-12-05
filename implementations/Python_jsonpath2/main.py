import sys
import json
from jsonpath2.path import Path

def main():
    selector = sys.argv[1]

    j = json.loads(sys.stdin.read())
    try:
        path = Path.parse_str(selector)
        results = path.match(j)

        print(json.dumps([entry.current_value for entry in results]))
    except Exception as e:
        print(repr(e))
        sys.exit(1)

if __name__ == '__main__':
    sys.exit(main())
