const { parseFromRoot } = require("./parser");
const {
  childrenOperator,
  allOperator,
  recursiveDescentOperator,
} = require("./operators");

const executeQuery = (value, [operator, parameter]) => {
  if (operator === "children") {
    return childrenOperator(value, parameter);
  } else if (operator === "all") {
    return allOperator(value);
  } else if (operator === "recursiveDescent") {
    return recursiveDescentOperator(value);
  }
  throw new Error("Internal error, unknown operator");
};

module.exports = (selector, json) => {
  const operators = parseFromRoot(selector);
  return operators.reduce(
    (results, operator) => results.flatMap((r) => executeQuery(r, operator)),
    [json]
  );
};
