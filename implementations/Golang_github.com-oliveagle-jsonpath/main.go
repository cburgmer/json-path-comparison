package main

import (
	"github.com/oliveagle/jsonpath"
	"encoding/json"
	"os"
	"io/ioutil"
	"fmt"
)

func main() {
	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		panic(err)
	}

	var json_data interface{}
	json.Unmarshal([]byte(data), &json_data)

	result, err := jsonpath.JsonPathLookup(json_data, selector)
	if err != nil {
		panic(err)
	}
	json_result, err := json.Marshal(result)
	fmt.Println(string(json_result))
}
