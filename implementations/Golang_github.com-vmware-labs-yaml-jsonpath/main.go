// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package main

import (
	"fmt"
	"io/ioutil"
	"os"

	"example.com/main/internal/wrapper"
)

func main() {
	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	jsonResult, errType, err := wrapper.Find(selector, data)
	if errType != wrapper.Ok {
		fmt.Fprintln(os.Stderr, err)
		switch errType {
		case wrapper.NotSupported:
			os.Exit(2) // not supported
		case wrapper.NotFound:
			os.Exit(3) // not found
		default:
			os.Exit(1) // general error
		}
	}

	fmt.Println(string(jsonResult))
}
