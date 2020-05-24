#!/usr/bin/env node

const jsonpath = require("./index");

const readStdin = () => {
  const stdin = process.stdin,
    stdout = process.stdout,
    inputChunks = [];

  stdin.resume();
  stdin.setEncoding("utf8");

  stdin.on("data", function (chunk) {
    inputChunks.push(chunk);
  });

  return new Promise((f) => {
    stdin.on("end", function () {
      f(inputChunks.join());
    });
  });
};

const main = async () => {
  const selector = process.argv[2];
  const json = JSON.parse(await readStdin());
  try {
    const results = jsonpath(selector, json);

    console.log(JSON.stringify(results));
  } catch (e) {
    console.error(e.message);
    if (e instanceof jsonpath.SyntaxError) {
      process.exit(2);
    } else {
      process.exit(1);
    }
  }
};

main();
