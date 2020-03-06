# FAQ

## Why?

JSONPath feels like a simple enough query language to grok and is supported
across all major programming languages. Also it seems JSON is here to stay.

Let's just make sure it's implemented consistently so we can avoid surprises.

This comparison is meant to create visibility, help implementers find issues
by sharing test cases, and finally give guidance on interpretation of the
[initial posts by Goessner](https://goessner.net/articles/JsonPath/).


## Where are the expected results coming from?

Given there is no extensive test suite and implementations in the wild disagree
widely, we take the rather unorthodox approach and just look for a consensus.

The consensus is based on the majority across all supported implementations.
This is achieved by executing a query against all implementations and finally
comparing the results. If a majority of half of all implementations (rounded up)
plus one agree on an outcome we speak of a consensus. This guarantees difference
of at least 2 votes even in critical cases.

While this makes no statement of the correctness, we trust that if a majority
of authors agree on the same outcome they are very likely to have reached a
consistent interpretation useful for the user.


## If there's no correct implementation, isn't it incorrect to speak of a 'wrong' result?

This project has an ultimate goal: to help developers find a good implementation
that is also consistent in its interpretation, across all languages. Otherwise,
what's the point of learning it if the knowledge turns out wrong when jumping to
the next programming language.

In this context we assume that given a consensus, all other answers are plain
wrong, so long as the consensus cannot be tipped towards a different
implementation.


## Shouldn't Goessner's implementation be considered correct?

Most if not all implementations covered here seem to follow one of Goessner's
implementations. Some even claim to be evolved out of an original. So it's
safe to say this alignment is also reflected in the results here.

However, Goessner's implementations in JavaScript and PHP don't always agree
with each other. There are also cases (few though) where a consensus exists
amongst the other implementations which goes against the result of his own
implementations. Assuming the authors bothered to check with Goessner's own
take, we must conclude they decided to have a better suggestion.

The consensus gives the community an opportunity to move away in cases that are
doubtful or considered inconsistent and incorrect.


## Should I be forced to implement a certain interpretation if I don't agree with it?

We think not. The point of the consensus is to create room for alignment. If a
different solution exists, we would hope for a lively discussion and, given it
is deemed better, that eventually the majority of implementations will move
towards the better solution.


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


## Looks like you have it all figured out?

On the contrary, JSONPath is complex enough, many more edge cases exist and
haven't been captured yet. Please help out!
