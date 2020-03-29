const { parse } = require("./selector");
const { childrenOperator, recursiveDescentOperator } = require("./operators");

const executeQuery = (value, [operator, parameter]) => {
  if (operator === "children") {
    return childrenOperator(value, parameter);
  } else if (operator === "recursiveDescent") {
    return recursiveDescentOperator(value);
  }
  throw new Error("Internal error, unknown operator");
};

const jsonpath = (selector, json) => {
  const operators = parse(selector);
  return operators.reduce(
    (results, operator) => results.flatMap((r) => executeQuery(r, operator)),
    [json]
  );
};

module.exports = jsonpath;
