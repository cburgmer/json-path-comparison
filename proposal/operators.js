const isArray = require("util").isArray;
const isObject = (value) => require("util").isObject(value) && !isArray(value);

const realIndex = (sliceIndex, length) => {
  if (sliceIndex < 0) {
    return Math.max(0, length + sliceIndex);
  }
  return sliceIndex;
};

const childrenIndexOperator = (current, root, [index]) => {
  if (isArray(current)) {
    const realIdx = realIndex(index, current.length);
    if (realIdx >= 0 && realIdx < current.length) {
      return [current[realIdx]];
    }
  }
  return [];
};

const childrenNameOperator = (current, root, [child]) => {
  if (isObject(current) && current[child] !== undefined) {
    return [current[child]];
  }
  return [];
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

const sliceValueOrDefault = (sliceValue, defaultValue) => {
  if (sliceValue === null) {
    return defaultValue;
  }
  return sliceValue;
};

const range = (start, end, step) => {
  const slice = [];
  if (step > 0) {
    for (let i = start; i < end; i += step) {
      slice.push(i);
    }
  } else {
    for (let i = start; i > end; i += step) {
      slice.push(i);
    }
  }
  return slice;
};

const childrenSliceOperator = (current, root, [start, end, step]) => {
  if (isArray(current)) {
    const stepNumber = sliceValueOrDefault(step, 1);

    const realStart = realIndex(sliceValueOrDefault(start, 0), current.length);
    const realEnd = realIndex(
      sliceValueOrDefault(end, current.length),
      current.length
    );

    return range(realStart, realEnd, stepNumber)
      .filter((i) => 0 <= i && i < current.length)
      .map((i) => current[i]);
  }

  return [];
};

const typeSafeComparison = (comparison) => {
  return (left, right) => {
    if (typeof left !== typeof right) {
      return false;
    }
    return comparison(left, right);
  };
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
  lessThan: typeSafeComparison((left, right) => left < right),
  greaterThan: typeSafeComparison((left, right) => left > right),
  lessThanOrEqual: typeSafeComparison((left, right) => left <= right),
  greaterThanOrEqual: typeSafeComparison((left, right) => left >= right),
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
