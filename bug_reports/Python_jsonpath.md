Results do not match other implementations

The following queries provide results that do not match those of other implementations of JSONPath
(compare https://cburgmer.github.io/json-path-comparison/):

- [ ] `$['*']`
  Input:
  ```
  {"*": "value"}
  ```
  Expected output:
  ```
  ["value"]
  ```
  Error:
  ```
  Traceback (most recent call last):
    File "main.py", line 18, in <module>
      sys.exit(main())
    File "main.py", line 9, in main
      results = jsonpath(j, selector, 'VALUE')
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 316, in jsonpath
      trace(cleaned_expr, obj, '$')
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 148, in trace
      walk(loc, x, obj, path, f03)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 248, in walk
      funct(key, loc, expr, obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 147, in f03
      trace(s(key, expr), obj, path)
    File "/usr/local/lib/python2.7/site-packages/jsonpath.py", line 108, in s
      return str(x) + ';' + str(y)
  RuntimeError: maximum recursion depth exceeded while calling a Python object
  ```

- [ ] `$`
  Input:
  ```
  {"another key": {"complex": ["a", 1]}, "key": "value"}
  ```
  Expected output:
  ```
  [{"another key": {"complex": ["a", 1]}, "key": "value"}]
  ```
  Error:
  ```
  jsonpath returned false, this might indicate an error
  ```

- [ ] `$[*]`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  [42, [0, 1], {"key": "value"}, "string"]
  ```

- [ ] `$.*`
  Input:
  ```
  {"int": 42, "array": [0, 1], "object": {"key": "value"}, "some": "string"}
  ```
  Expected output:
  ```
  ["string", 42, {"key": "value"}, [0, 1]]
  ```
  Actual output:
  ```
  [42, [0, 1], {"key": "value"}, "string"]
  ```


For reference, the output was generated by the program in https://github.com/cburgmer/json-path-comparison/tree/master/implementations/Python_jsonpath.
