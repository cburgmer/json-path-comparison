const isArray = (v) => Array.isArray(v);
const isObject = (v) => !isArray(v) && typeof v === "object" && v !== null;

const childrenIndexOperator = (value, child) => {
  if (isArray(value)) {
    const index = child - 0; // HACKY way to convert complete string to int
    const realIndex = index >= 0 ? index : value.length + index;
    if (realIndex >= 0 && realIndex < value.length) {
      return [value[realIndex]];
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

module.exports.childrenOperator = (value, children) => {
  return children.flatMap(([subOperator, child]) => {
    if (subOperator === "index") {
      return childrenIndexOperator(value, child);
    } else if (subOperator === "all") {
      return childrenAllOperator(value);
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
