package main

import (
	"github.com/spyzhov/ajson"
	"encoding/json"
	"os"
	"io/ioutil"
	"fmt"
)

func main() {
	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}


	nodes, err := ajson.JSONPath(data, selector)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	results := make([]interface{}, 0)

	for _, node := range nodes {
		value, err := node.Unpack()
		if err != nil {
			fmt.Fprintln(os.Stderr, err)
			os.Exit(1)
		}
		results = append(results, value)
	}

	json_result, err := json.Marshal(results)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	fmt.Println(string(json_result))
}
