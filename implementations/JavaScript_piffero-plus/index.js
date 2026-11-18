#!/usr/bin/env node

const { Readable } = require('stream');
const { Piffero, PifferoJsonPathError } = require('piffero-plus');

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
    const input = inputChunks.join(''),
          json = JSON.parse(input);

    try {
        if (typeof Piffero.query === 'function' && typeof json === 'object' && json !== null) {
            const result = Piffero.query(json, selector);
            stdout.write(JSON.stringify(result));
            return;
        }

        Piffero.findAsString(
            function (result, err) {
                if (err) {
                    console.error(err.message || err);
                    process.exit(1);
                }
                stdout.write(result);
            },
            Readable.from([input]),
            selector
        );
    } catch (e) {
        if (e instanceof PifferoJsonPathError) {
            console.error(e.message);
            process.exit(2);
        }
        console.error(e.message);
        process.exit(1);
    }
});
