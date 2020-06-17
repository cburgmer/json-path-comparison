const isArray = (v) => Array.isArray(v);
module.exports.isArray = isArray;

const isObject = (v) => !isArray(v) && typeof v === "object" && v !== null;
module.exports.isObject = isObject;

const isSameType = (left, right) => typeof left === typeof right;
module.exports.isSameType = isSameType;

const absoluteArrayIndex = (sliceIndex, length) => {
  if (sliceIndex < 0) {
    return length + sliceIndex;
  }
  return sliceIndex;
};
module.exports.absoluteArrayIndex = absoluteArrayIndex;

const valueOrDefault = (value, defaultValue) => {
  if (value === null) {
    return defaultValue;
  }
  return value;
};
module.exports.valueOrDefault = valueOrDefault;

const effectiveArrayBoundary = (boundary, length) =>
  Math.min(Math.max(-1, boundary), length);
module.exports.effectiveArrayBoundary = effectiveArrayBoundary;

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
module.exports.range = range;
