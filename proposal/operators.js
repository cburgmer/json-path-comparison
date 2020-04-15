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
    .map((idx) => current[i]);
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

const filterArgumentOperators = {
  value: (current, root, parameter) => parameter,
  current: (current, root, parameter) => executeScalar(current, parameter),
  root: (current, root, parameter) => executeScalar(root, parameter),
};

const executeFilterArgument = (
  current,
  root,
  [argumentOperatorName, argumentParameters]
) => {
  const argumentOperator = filterArgumentOperators[argumentOperatorName];

  if (!argumentOperator) {
    throw new Error("Internal error, unknown operator");
  }

  return argumentOperator(current, root, argumentParameters);
};

const filterOperators = {
  hasValue: (results) => results !== undefined,
  equals: (left, right) => JSON.stringify(left) === JSON.stringify(right),
  notEquals: (left, right) => JSON.stringify(left) !== JSON.stringify(right),
  lessThan: (left, right) => isSameType(left, right) && left < right,
  greaterThan: (left, right) => isSameType(left, right) && left > right,
  lessThanOrEqual: (left, right) => isSameType(left, right) && left <= right,
  greaterThanOrEqual: (left, right) => isSameType(left, right) && left >= right,
};

const childrenFilterOperator = (
  current,
  root,
  [[filterOperator, ...argOperators]]
) => {
  const operator = filterOperators[filterOperator];

  if (!operator) {
    throw new Error("Internal error, unknown operator");
  }

  return allChildren(current).filter((v) => {
    const arguments = argOperators.map((argOp) =>
      executeFilterArgument(v, root, argOp)
    );
    return operator(...arguments);
  });
};

const childrenSubOperators = {
  index: childrenIndexOperator,
  name: childrenNameOperator,
  all: childrenAllOperator,
  slice: childrenSliceOperator,
  filter: childrenFilterOperator,
};

const childrenOperator = (current, root, children) => {
  return children.flatMap(([subOperatorName, ...parameters]) => {
    const subOperator = childrenSubOperators[subOperatorName];

    if (!subOperator) {
      throw new Error("Internal error, unknown operator");
    }

    return subOperator(current, root, parameters);
  });
};

const recursiveDescentOperator = (current) => {
  if (isArray(current)) {
    return [current].concat(
      current.flatMap((v) => recursiveDescentOperator(v))
    );
  } else if (isObject(current)) {
    return [current].concat(
      Object.values(current).flatMap((v) => recursiveDescentOperator(v))
    );
  }
  return [current];
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

const execute = (root, operators) => {
  return operators.reduce(
    (results, operator) =>
      results.flatMap((current) => executeOperator(current, root, operator)),
    [root]
  );
};

module.exports = execute;
