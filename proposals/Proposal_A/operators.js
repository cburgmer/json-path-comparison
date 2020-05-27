const {
  isArray,
  isObject,
  isSameType,
  absoluteArrayIndex,
  valueOrDefault,
  range,
} = require("./utils");

const childrenIndexOperator = (current, root, [relativeIndex]) => {
  if (!isArray(current)) {
    return [];
  }

  const absoluteIndex = absoluteArrayIndex(relativeIndex, current.length);
  if (absoluteIndex < 0 || absoluteIndex >= current.length) {
    return [];
  }

  return [current[absoluteIndex]];
};

const childrenNameOperator = (current, root, [child]) => {
  if (!isObject(current) || current[child] === undefined) {
    return [];
  }
  return [current[child]];
};

const allChildren = (value) => {
  if (isArray(value)) {
    return value;
  } else if (isObject(value)) {
    return Object.values(value);
  }

  return [];
};

const childrenAllOperator = (current) => {
  return allChildren(current);
};

const childrenSliceOperator = (current, root, [start, end, step]) => {
  if (!isArray(current)) {
    return [];
  }

  const stepNumber = valueOrDefault(step, 1);

  const absoluteStart = absoluteArrayIndex(
    valueOrDefault(start, 0),
    current.length
  );
  const absoluteEnd = absoluteArrayIndex(
    valueOrDefault(end, current.length),
    current.length
  );

  return range(absoluteStart, absoluteEnd, stepNumber)
    .filter((idx) => 0 <= idx && idx < current.length)
    .map((idx) => current[idx]);
};

const executeScalar = (value, operators) => {
  const results = execute(value, operators);
  if (results.length > 1) {
    throw new Error(
      "Internal error, selector for scalar value returned multiple results"
    );
  }
  return results[0];
};

const filterValueOperators = {
  constant: (current, root, parameter) => parameter,
  current: (current, root, parameter) => executeScalar(current, parameter),
  root: (current, root, parameter) => executeScalar(root, parameter),
};

const executeFilterValue = (
  current,
  root,
  [valueOperatorName, valueParameters]
) => {
  const valueOperator = filterValueOperators[valueOperatorName];

  if (!valueOperator) {
    throw new Error("Internal error, unknown operator");
  }

  return valueOperator(current, root, valueParameters);
};

const filterOperators = {
  hasValue: (result) => result !== undefined,
  not: (result) => !result,
  and: (...results) => results.every((x) => x === true),
  or: (...results) => results.some((x) => x === true),
  equals: (left, right) => JSON.stringify(left) === JSON.stringify(right),
  notEquals: (left, right) => JSON.stringify(left) !== JSON.stringify(right),
  lessThan: (left, right) => isSameType(left, right) && left < right,
  greaterThan: (left, right) => isSameType(left, right) && left > right,
  lessThanOrEqual: (left, right) => isSameType(left, right) && left <= right,
  greaterThanOrEqual: (left, right) => isSameType(left, right) && left >= right,
};

const executeFilterExpression = (
  current,
  root,
  [filterOperator, ...argOperators]
) => {
  const operator = filterOperators[filterOperator];

  if (!operator) {
    throw new Error("Internal error, unknown operator");
  }

  const arguments = argOperators.map(([type, argOp]) => {
    if (type === "value") {
      return executeFilterValue(current, root, argOp);
    }
    if (type === "expression") {
      return executeFilterExpression(current, root, argOp);
    }
    throw new Error("Internal error, unknown type");
  });
  return operator(...arguments);
};

const childrenFilterOperator = (current, root, [filterExpression]) => {
  return allChildren(current).filter((child) =>
    executeFilterExpression(child, root, filterExpression)
  );
};

const childrenSubOperators = {
  index: childrenIndexOperator,
  name: childrenNameOperator,
  all: childrenAllOperator,
  slice: childrenSliceOperator,
  filter: childrenFilterOperator,
};

const childrenOperator = (current, root, children) => {
  return flatMap(children, ([subOperatorName, ...parameters]) => {
    const subOperator = childrenSubOperators[subOperatorName];

    if (!subOperator) {
      throw new Error("Internal error, unknown operator");
    }

    return subOperator(current, root, parameters);
  });
};

const recursiveDescentOperator = (current) => {
  const descendants = flatMap(allChildren(current), (child) =>
    recursiveDescentOperator(child)
  );
  return [current].concat(descendants);
};

const operators = {
  children: childrenOperator,
  recursiveDescent: recursiveDescentOperator,
};

const executeOperator = (current, root, [operatorName, parameter]) => {
  const operator = operators[operatorName];
  if (!operator) {
    throw new Error("Internal error, unknown operator");
  }
  return operator(current, root, parameter);
};

// flatMap not available in node 10 which sadly still ships in Ubuntu 20.
const flatMap = (list, func) =>
  list.map(func).reduce((a, e) => [...a, ...e], []);

const execute = (root, operators) => {
  return operators.reduce(
    (results, operator) =>
      flatMap(results, (current) => executeOperator(current, root, operator)),
    [root]
  );
};

module.exports = execute;
