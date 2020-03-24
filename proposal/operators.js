const isArray = (v) => Array.isArray(v);
const isObject = (v) => !isArray(v) && typeof v === "object" && v !== null;

module.exports.childrenOperator = (value, children) => {
  return children.flatMap((child) => {
    if (isArray(value)) {
      const index = child - 0; // HACKY way to convert complete string to int
      const realIndex = index >= 0 ? index : value.length + index;
      if (value[realIndex]) {
        return [value[realIndex]];
      } else {
        return [];
      }
    } else if (isObject(value) && value[child] !== undefined) {
      return [value[child]];
    }
    return [];
  });
};

module.exports.allOperator = (value) => {
  if (isArray(value)) {
    return value;
  } else if (isObject(value)) {
    return Object.values(value);
  }

  return [];
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
