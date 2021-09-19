// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package main

import (
	"fmt"
	"io/ioutil"
	"os"

	"github.com/ohler55/ojg/jp"
	"github.com/ohler55/ojg/oj"
)

func main() {
	defer func() {
		if err := recover(); err != nil {
			fmt.Fprintf(os.Stderr, "Exception: %v\n", err)
			os.Exit(1)
		}
	}()

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

	obj, err := oj.Parse(data[:])
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	// A slice of []interface{} is always returned even if the slice is
	// nil. Treat it like a slice and all will be fine. For example
	// len(results) even if nil returns 0.
	results := x.Get(obj)

	json_result := oj.JSON(results)
	fmt.Println(string(json_result))
}
