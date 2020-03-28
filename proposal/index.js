const { parse } = require("./selector");
const execute = require("./operators");

const jsonpath = (selector, json) => {
  const operators = parse(selector);
  return execute(json, operators);
};

module.exports = jsonpath;
