const { isArray, isObject } = require("util");

const realIndex = (sliceIndex, length) => {
  if (sliceIndex < 0) {
    return Math.max(0, length + sliceIndex);
  }
  return sliceIndex;
};

const childrenIndexOperator = (value, [child]) => {
  if (isArray(value)) {
    const index = parseInt(child, 10);
    const realIdx = realIndex(index, value.length);
    if (realIdx >= 0 && realIdx < value.length) {
      return [value[realIdx]];
    }
  } else if (isObject(value)) {
    if (value[child] !== undefined) {
      return [value[child]];
    }
  }
  return [];
};

const childrenAllOperator = (value) => {
  if (isArray(value)) {
    return value;
  } else if (isObject(value)) {
    return Object.values(value);
  }

  return [];
};

const sliceValueOrDefault = (sliceValue, defaultValue) => {
  if (sliceValue === null) {
    return defaultValue;
  }
  return parseInt(sliceValue, 10);
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

module.exports.childrenOperator = (value, children) => {
  return children.flatMap(([subOperator, ...parameters]) => {
    if (subOperator === "index") {
      return childrenIndexOperator(value, parameters);
    } else if (subOperator === "all") {
      return childrenAllOperator(value);
    } else if (subOperator === "slice") {
      return childrenSliceOperator(value, parameters);
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

module.exports.recursiveDescentOperator = recursiveDescentOperator;
