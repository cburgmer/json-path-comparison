// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"encoding/json"

	"github.com/ohler55/ojg/jp"
	"github.com/ohler55/ojg/oj"
)

func main() {
	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	x, err := jp.ParseString(selector)
	if err != nil {
		os.Exit(2) // not supported
	}

	obj, err := oj.ParseString(string(data[:]))
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	results := x.Get(obj)

	if results == nil {
		os.Exit(3) // not found
	}

	json_result, err := json.Marshal(results)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	fmt.Println(string(json_result))
}
