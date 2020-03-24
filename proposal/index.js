#!/usr/bin/env node

const readStdin = () => {
  const stdin = process.stdin,
    stdout = process.stdout,
    inputChunks = [];

  stdin.resume();
  stdin.setEncoding("utf8");

  stdin.on("data", function (chunk) {
    inputChunks.push(chunk);
  });

  return new Promise((f) => {
    stdin.on("end", function () {
      f(inputChunks.join());
    });
  });
};

const parseDotNotation = (remainingSelector) => {
  const match = remainingSelector.match(/^[\p{L}\d_-]+/u);
  if (!match) {
    throw new Error("Invalid Selector: child name missing");
  }
  return [match[0], match[0].length];
};

const parseBracketElement = (remainingSelector) => {
  if (remainingSelector.startsWith("'")) {
    let i = 1;
    while (i < remainingSelector.length) {
      if (remainingSelector[i] === "'") {
        break;
      } else if (remainingSelector[i] === "\\") {
        i += 2;
      } else {
        i += 1;
      }
    }
    return [remainingSelector.substring(1, i), i + 1];
  } else if (remainingSelector.startsWith('"')) {
    let i = 1;
    while (i < remainingSelector.length) {
      if (remainingSelector[i] === '"') {
        break;
      } else if (remainingSelector[i] === "\\") {
        i += 2;
      } else {
        i += 1;
      }
    }
    return [remainingSelector.substring(1, i), i + 1];
  }

  const match = remainingSelector.match(/^(-)?\d+/);
  if (!match) {
    throw new Error("Invalid Selector: expected quotes or a number");
  }
  return [match[0], match[0].length];
};

const parseBrackets = (selector) => {
  let i = 1;
  let bracketSubSelectors = [];
  while (i < selector.length) {
    const remainingSelector = selector.substr(i);
    [subSelector, selectorSubstrLength] = parseBracketElement(
      remainingSelector
    );
    bracketSubSelectors.push(subSelector);
    i += selectorSubstrLength;

    if (remainingSelector.substr(selectorSubstrLength).startsWith("]")) {
      return [bracketSubSelectors, i + 1];
    } else if (remainingSelector.substr(selectorSubstrLength).startsWith(",")) {
      i += 1;
    } else {
      throw new Error(
        "Invalid Selector: expected a closing bracket or a comma"
      );
    }
  }
  throw new Error(
    "Invalid Selector: expected a closing bracket somewhere along the way"
  );
};

const parseSelector = (selector) => {
  let i = 0;
  let operators = [];
  while (i < selector.length) {
    const remainingSelector = selector.substr(i);
    if (remainingSelector.startsWith(".*")) {
      operators.push(["all"]);
      i += 2;
    } else if (remainingSelector.startsWith(".")) {
      const [child, selectorSubstrLength] = parseDotNotation(
        remainingSelector.substr(1)
      );
      operators.push(["children", [child]]);
      i += 1 + selectorSubstrLength;
    } else if (remainingSelector.startsWith("[*]")) {
      operators.push(["all"]);
      i += 3;
    } else if (remainingSelector.startsWith("[")) {
      const [children, selectorSubstrLength] = parseBrackets(remainingSelector);
      operators.push(["children", children]);
      i += selectorSubstrLength;
    } else {
      throw new Error(
        `Invalid Selector: unknown operator: ${remainingSelector}`
      );
    }
  }
  return operators;
};

const parseFromRoot = (selector) => {
  if (selector.startsWith("$")) {
    return parseSelector(selector.substr(1));
  }
  throw new Error("Invalid Selector: expected a root");
};

const childrenOperator = (value, children) => {
  return children.flatMap((child) => {
    if (Array.isArray(value)) {
      const index = child - 0; // HACKY way to convert complete string to int
      const realIndex = index >= 0 ? index : value.length + index;
      if (value[realIndex]) {
        return [value[realIndex]];
      } else {
        return [];
      }
    }
    if (value[child] !== undefined) {
      return [value[child]];
    }
    return [];
  });
};

const allOperator = (value) => {
  if (Array.isArray(value)) {
    return value;
  } else if (typeof value === "object") {
    return Object.values(value);
  }

  return [];
};

const executeQuery = (value, [operator, parameter]) => {
  if (operator === "children") {
    return childrenOperator(value, parameter);
  } else if (operator === "all") {
    return allOperator(value);
  }
  throw new Error("Internal error, unknown operator");
};

const jsonpath = (selector, json) => {
  const operators = parseFromRoot(selector);
  return operators.reduce(
    (results, operator) => results.flatMap((r) => executeQuery(r, operator)),
    [json]
  );
};

module.exports = jsonpath;

const main = async () => {
  const selector = process.argv[2];
  const json = JSON.parse(await readStdin());
  try {
    const results = jsonpath(selector, json);

    console.log(JSON.stringify(results));
  } catch (e) {
    console.error(e);
  }
};

if (require.main === module) {
  main();
}
