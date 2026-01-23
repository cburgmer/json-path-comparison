#!/usr/bin/env node

import { evaluate } from '@swaggerexpert/jsonpath';

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
        if (result === undefined) {
            console.error(result);
            process.exit(1);
        }
        stdout.write(JSON.stringify(result));
    } catch (e) {
        console.error(e.message);
        process.exit(1);
    }
});
