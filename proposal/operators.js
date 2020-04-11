const { isArray, isObject } = require("util");

const realIndex = (sliceIndex, length) => {
  if (sliceIndex < 0) {
    return Math.max(0, length + sliceIndex);
  }
  return sliceIndex;
};

const childrenIndexOperator = (value, [index]) => {
  if (isArray(value)) {
    const realIdx = realIndex(index, value.length);
    if (realIdx >= 0 && realIdx < value.length) {
      return [value[realIdx]];
    }
  }
  return [];
};

const childrenNameOperator = (value, [child]) => {
  if (isObject(value) && value[child] !== undefined) {
    return [value[child]];
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

const childrenAllOperator = (value) => {
  return allChildren(value);
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

const childrenSliceOperator = (value, [start, end, step]) => {
  if (isArray(value)) {
    const stepNumber = sliceValueOrDefault(step, 1);

    const realStart = realIndex(sliceValueOrDefault(start, 0), value.length);
    const realEnd = realIndex(
      sliceValueOrDefault(end, value.length),
      value.length
    );

    return range(realStart, realEnd, stepNumber)
      .filter((i) => 0 <= i && i < value.length)
      .map((i) => value[i]);
  }

  return [];
};

const filterOperators = {
  hasValue: (results) => results.length > 0,
  equals: (left, right) => JSON.stringify(left) === JSON.stringify(right),
};

const childrenFilterOperator = (value, [[filterOperator, ...argOperators]]) => {
  const operator = filterOperators[filterOperator];

  return allChildren(value).filter((v) => {
    const arguments = argOperators.map((argOp) => execute(v, argOp));
    return operator(...arguments);
  });
};

const childrenOperator = (value, children) => {
  return children.flatMap(([subOperator, ...parameters]) => {
    if (subOperator === "index") {
      return childrenIndexOperator(value, parameters);
    } else if (subOperator === "name") {
      return childrenNameOperator(value, parameters);
    } else if (subOperator === "all") {
      return childrenAllOperator(value);
    } else if (subOperator === "slice") {
      return childrenSliceOperator(value, parameters);
    } else if (subOperator === "filter") {
      return childrenFilterOperator(value, parameters);
    }
    throw new Error("Internal error, unknown operator");
  });
};

const recursiveDescentOperator = (value) => {
  if (isArray(value)) {
    return [value].concat(value.flatMap((v) => recursiveDescentOperator(v)));
  } else if (isObject(value)) {
    return [value].concat(
      Object.values(value).flatMap((v) => recursiveDescentOperator(v))
    );
  }
  return [value];
};

const executeOperator = (value, [operator, parameter]) => {
  if (operator === "children") {
    return childrenOperator(value, parameter);
  } else if (operator === "recursiveDescent") {
    return recursiveDescentOperator(value);
  } else if (operator === "value") {
    return parameter;
  }
  throw new Error("Internal error, unknown operator");
};

const execute = (value, operators) => {
  return operators.reduce(
    (results, operator) => results.flatMap((r) => executeOperator(r, operator)),
    [value]
  );
};

module.exports = execute;
