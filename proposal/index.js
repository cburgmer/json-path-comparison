const Tracer = require("pegjs-backtrace");
const { parse } = require("./selector");
const execute = require("./operators");

class SyntaxError extends Error {
  constructor(backtrace) {
    super("\n" + backtrace);
    this.name = "SyntaxError";
  }
}
const jsonpath = (selector, json) => {
  let operators;
  const tracer = new Tracer(selector);
  try {
    operators = parse(selector, { tracer });
  } catch (e) {
    throw new SyntaxError(tracer.getBacktraceString());
  }

  return execute(json, operators);
};

module.exports = jsonpath;
