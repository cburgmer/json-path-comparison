# FAQ

## Why?

JSONPath feels like a simple enough query language to grok and is supported
across all major programming languages. Also it seems JSON is here to stay -
being able to query it is valuable.

Let's just make sure it's implemented consistently so we can avoid surprises.

This comparison is meant to create visibility, help implementers find issues
by sharing test cases.


## Where are the expected results coming from?

Given that the
[initial posts by Goessner](https://goessner.net/articles/JsonPath/) left room
for interpretation, and
[a clear standard](https://www.rfc-editor.org/rfc/rfc9535) only emerged much
later (with a definitive reference implementation yet to be completed) we
took the rather unorthodox approach and just built on top of a consensus.

The consensus is based on the majority across all supported implementations.
This is achieved by executing a query against all implementations and finally
comparing the results. If a majority of half of all implementations (rounded up)
plus one agree on an outcome we speak of a consensus. This guarantees difference
of at least 2 votes even in critical cases.

The consensus however makes no statement of the correctness. One should rather
carefully read the [the RFC](https://www.rfc-editor.org/rfc/rfc9535).


## Shouldn't Goessner's implementation be considered correct?

Most if not all implementations covered here seem to follow one of Goessner's
implementations. Some even claim to be evolved out of an original. So it's
safe to say this alignment is also reflected in the results here.

However, Goessner's implementations in JavaScript and PHP don't always agree
with each other. There are also cases (few though) where a consensus exists
amongst the other implementations which goes against the result of his own
implementations. Assuming the authors bothered to check with Goessner's own
take, we must conclude they decided to have a better suggestion.

See [bug_reports/JavaScript_Goessner.md](bug_reports/JavaScript_Goessner.md)
for a potential bug report against Goessner's JavaScript implementation, if it
was to be judged against the consensus.

The consensus gives the community an opportunity to move away in cases that are
doubtful or considered inconsistent and incorrect.


## How do you handle differences in implementations when calculating the consensus?

As it turns out quite a few structural differences have come up across
implementations:

- Quite some implementations return a single element instead of an array with a
  single element, contrary to Goessner's examples.
- Many implementations have deviated from Goessner to return an empty array
  if no match is returned. Goessner returns `false` in such cases.
- A small number of implementations return an error if no match is found where
  otherwise a single element would be returned.

We still believe that we can derive a consensus in those cases. The intention
of the responses are the same, only the representation changes. To compare those
slightly different responses, we have implemented different rules to match
results:

1. "Multiple matches": this is the most basic rule which will compare all
   results without further pre-processing. This will match queries which return
   multiple results across all implementations, hence the name.
2. "Single match": the rule to capture different response patterns for a single
   match, e.g. `[42]` and `42`.
3. "No match": this rule captures responses where no match was found, e.g.
   `[]` and *not found* error.
4. "No scalar match": this rule is similar to the previous "no match" rule, but
   specifically handles responses where only one match is possible. This helps
   capture the special `null` response, e.g. `[]`, `null` and *not found* error.


## Aren't some of the queries somewhat contrived?

The queries in the table are meant to capture the different interpretations
found in the wild, with as little bias as possible. This includes examples that
may look outright incorrect - the consensus shall tell.

Also for the sake of understanding edge cases and providing the user a
consistent experience for any configuration of notations, the comparison will
call out a lot of queries probably not found in your average query.


## How can I use this table for my implementation?

The comparison table is mostly used for human consumption. For automated
testing, aka regression tests, the same is represented in machine readable YAML.


## Isn't adding a new implementation going to break the consensus?

Once more implementations start aligning on a shared understanding, we hope
a consensus will arise way above the mark of 51%, finally stabilising the
automated comparison.


## Should we ignore implementations that are "mostly wrong"?

Part of this project is to generate a wide alignment across implementations
keeping biases out as much as possible. Finding good criteria to separate "good"
from "bad" thus seems hard, and we would very much prefer putting this energy
into fixing issues :)


## What are the rules for other queries to be covered?

More queries can always be added. There's plenty of room for edge cases in
JSONPath.

Here's a few good indicators that the query you are looking at should be added:

- Implementations disagree on the results. This can be verified via
  `./src/one_off.sh`.
- The particular query isn't already covered by one of the existing ones.
  Similar queries are quickly found when naming one's query following
  QUERY_NAMING_PATTERN.md and following the alphabetic ordering in the
  comparison table.
- The query doesn't involve too many subsequent operators. A too long query
  should probably be broken down to narrow the area of test. Obviously a long
  query is good if a shorter version does not expose the same deviation in
  implementations' responses.
