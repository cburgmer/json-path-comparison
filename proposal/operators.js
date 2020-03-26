const isArray = (v) => Array.isArray(v);
const isObject = (v) => !isArray(v) && typeof v === "object" && v !== null;

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

const childrenSliceOperator = (value, [start, end, step]) => {
  if (isArray(value)) {
    const slice = [];

    const stepNumber = sliceValueOrDefault(step, 1);

    const realStart = realIndex(sliceValueOrDefault(start, 0), value.length);
    const realEnd = realIndex(
      sliceValueOrDefault(end, value.length),
      value.length
    );

    for (let i = realStart; i < realEnd; i += stepNumber) {
      if (0 <= i && i < value.length) {
        slice.push(value[i]);
      }
    }
    return slice;
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
