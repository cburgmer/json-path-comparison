// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"

	"github.com/theory/jsonpath"
)

func main() {
	selector := os.Args[1]

	data, err := io.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	var json_data any
	if err := json.Unmarshal([]byte(data), &json_data); err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(2)
	}

	path, err := jsonpath.Parse(selector)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(2)
	}

	json_result, err := json.Marshal(path.Select(json_data))
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(2)
	}
	fmt.Println(string(json_result))
}
