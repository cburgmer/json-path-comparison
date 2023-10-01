#!/usr/bin/env node

const jp = require("jsonpathly");

const selector = process.argv[2];

const stdin = process.stdin,
	stdout = process.stdout,
	inputChunks = [];

stdin.resume();
stdin.setEncoding("utf8");

stdin.on("data", function (chunk) {
	inputChunks.push(chunk);
});

stdin.on("end", function () {
	const input = inputChunks.join(),
		json = JSON.parse(input);

	try {
		const result = jp.query(json, selector, { returnArray: true });
		if (result === undefined) {
			console.error(result);
			process.exit(1);
		}
		stdout.write(JSON.stringify(result));
	} catch (e) {
		console.error(e.message);
		if (
			/missing/.test(e.message) ||
			/mismatched input/.test(e.message) ||
			/extraneous input/.test(e.message)
		) {
			process.exit(2);
		} else {
			process.exit(1);
		}
	}
});

