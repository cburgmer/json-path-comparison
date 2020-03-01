package main

import (
	"github.com/oliveagle/jsonpath"
	"encoding/json"
	"os"
	"io/ioutil"
	"fmt"
)

func main() {
	defer func() {
		e := recover()
		if (e != nil) {
			fmt.Fprintln(os.Stderr, e)
			os.Exit(1)
		}
	}()

	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	var json_data interface{}
	json.Unmarshal([]byte(data), &json_data)

	result, err := jsonpath.JsonPathLookup(json_data, selector)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	json_result, err := json.Marshal(result)
	fmt.Println(string(json_result))
}
