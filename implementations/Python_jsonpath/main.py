import sys
import json
from jsonpath import jsonpath

def main():
    selector = sys.argv[1]

    j = json.loads(sys.stdin.read())
    try:
        results = jsonpath(j, selector, 'VALUE')
    except Exception as e:
        print(repr(e))
        sys.exit(1)

    if results is False:
        print('jsonpath returned false, this might indicate an error');
        sys.exit(3)

    print(json.dumps(results))

if __name__ == '__main__':
    sys.exit(main())
