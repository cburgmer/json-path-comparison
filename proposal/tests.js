#!/usr/bin/env node

const testSuite = process.argv[2];

const fs = require("fs");
const assert = require("assert");
const YAML = require("yaml");
const jsonpath = require("./index.js");

const regressionYaml = fs.readFileSync(testSuite, "utf-8");
const queries = YAML.parse(regressionYaml).queries;

const canonicalOrderForUnorderedResults = (array) => {
  array.sort((a, b) => {
    const aJson = JSON.stringify(a);
    const bJson = JSON.stringify(b);
    if (aJson < bJson) {
      return -1;
    }
    if (bJson > aJson) {
      return 1;
    }
    return 0;
  });
  return array;
};

const deepEquals = (a, b) => {
  try {
    assert.deepStrictEqual(a, b);
    return true;
  } catch (_) {
    return false;
  }
};

console.log(`Processing ${testSuite}...`);
const failed = queries
  .filter((query) => query.consensus)
  .filter((query) => {
    try {
      const result = jsonpath(query.selector, query.document);

      const canonicalResult =
        query.ordered === false
          ? canonicalOrderForUnorderedResults(result)
          : result;

      if (!deepEquals(canonicalResult, query.consensus)) {
        console.warn(
          [
            `Failed for ${query.id}, selector ${
              query.selector
            }, document ${JSON.stringify(query.document)}:`,
            `Expected: ${JSON.stringify(query.consensus)}`,
            `Received: ${JSON.stringify(canonicalResult)}`,
            "",
          ].join("\n")
        );
        return true;
      }
    } catch (e) {
      console.warn(
        [
          `Error for ${query.id}, selector ${
            query.selector
          }, document ${JSON.stringify(query.document)}:`,
          `Expected: ${JSON.stringify(query.consensus)}`,
          `Received: ${e}`,
          "",
        ].join("\n")
      );
      return true;
    }
  });

process.exit(failed.length > 0 ? 1 : 0);
