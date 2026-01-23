#!/usr/bin/env node

import { evaluate, JSONPathParseError } from '@swaggerexpert/jsonpath';

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
        const result = evaluate(json, selector);
        stdout.write(JSON.stringify(result));
    } catch (e) {
        if (e instanceof JSONPathParseError) {
            console.error(e.message);
            process.exit(2);
        }
        console.error(e.message);
        process.exit(1);
    }
});
