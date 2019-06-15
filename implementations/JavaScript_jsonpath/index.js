#!/usr/bin/env node

const jp = require('jsonpath');

const selector = process.argv[2];

const stdin = process.stdin,
      stdout = process.stdout,
      inputChunks = [];

stdin.resume();
stdin.setEncoding('utf8');

stdin.on('data', function (chunk) {
    inputChunks.push(chunk);
});

stdin.on('end', function () {
    const input = inputChunks.join(),
          json = JSON.parse(input);

    try {
        const result = jp.query(json, selector);

        stdout.write(JSON.stringify(result));
    } catch(e) {
        console.error(e.message);
        process.exit(1);
    }
});
