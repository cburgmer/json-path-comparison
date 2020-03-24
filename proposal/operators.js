module.exports.childrenOperator = (value, children) => {
  return children.flatMap((child) => {
    if (Array.isArray(value)) {
      const index = child - 0; // HACKY way to convert complete string to int
      const realIndex = index >= 0 ? index : value.length + index;
      if (value[realIndex]) {
        return [value[realIndex]];
      } else {
        return [];
      }
    } else if (typeof value === "object" && value[child] !== undefined) {
      return [value[child]];
    }
    return [];
  });
};

module.exports.allOperator = (value) => {
  if (Array.isArray(value)) {
    return value;
  } else if (typeof value === "object" && value !== null) {
    return Object.values(value);
  }

  return [];
};

const recursiveDescentOperator = (value) => {
  if (Array.isArray(value)) {
    return [value].concat(value.flatMap((v) => recursiveDescentOperator(v)));
  } else if (typeof value === "object" && value !== null) {
    return [value].concat(
      Object.values(value).flatMap((v) => recursiveDescentOperator(v))
    );
  }
  return [value];
};

module.exports.recursiveDescentOperator = recursiveDescentOperator;
