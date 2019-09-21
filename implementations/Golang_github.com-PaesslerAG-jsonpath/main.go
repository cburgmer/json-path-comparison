package main

import (
	"github.com/PaesslerAG/jsonpath"
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

	var json_data interface{}
	json.Unmarshal([]byte(data), &json_data)

	result, err := jsonpath.Get(selector, json_data)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	json_result, err := json.Marshal(result)
	fmt.Println(string(json_result))
}
