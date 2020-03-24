const parseDotNotation = (remainingSelector) => {
  const match = remainingSelector.match(/^[\p{L}\d_-]+/u);
  if (!match) {
    throw new Error(
      `Invalid Selector: child name missing or invalid child name ${remainingSelector}`
    );
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

const parseRecursiveDescent = (remainingSelector) => {
  if (remainingSelector.startsWith("[*]")) {
    return [["all"], 3];
  } else if (remainingSelector.startsWith("[")) {
    const [children, selectorSubstrLength] = parseBrackets(remainingSelector);
    return [["children", children], selectorSubstrLength];
  } else if (remainingSelector.startsWith("*")) {
    return [["all"], 2];
  }

  const [child, selectorSubstrLength] = parseDotNotation(remainingSelector);
  return [["children", [child]], 1 + selectorSubstrLength];
};

const parseSelector = (selector) => {
  let i = 0;
  let operators = [];
  while (i < selector.length) {
    const remainingSelector = selector.substr(i);
    if (remainingSelector === "..") {
      operators.push(["recursiveDescent"]);
      i += 2;
    } else if (remainingSelector.startsWith("..")) {
      const [operator, selectorSubstrLength] = parseRecursiveDescent(
        remainingSelector.substr(2)
      );
      operators.push(["recursiveDescent"]);
      operators.push(operator);
      i += 2 + selectorSubstrLength;
    } else if (remainingSelector.startsWith(".*")) {
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

module.exports.parseFromRoot = parseFromRoot;
