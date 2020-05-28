// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package wrapper

import (
	"encoding/json"

	"github.com/vmware-labs/yaml-jsonpath/pkg/yamlpath"
	"gopkg.in/yaml.v3"
)

// ErrorType indicates the kind of error
type ErrorType int

// Values of ErrorType
const (
	Ok ErrorType = iota
	WrapperErr
	NotSupported
	NotFound
)

// Find runs the given selector against the given input and returns the results or an error with an error type
func Find(selector string, input []byte) ([]byte, ErrorType, error) {
	var n yaml.Node
	if err := yaml.Unmarshal(input, &n); err != nil {
		return nil, WrapperErr, err
	}

	path, err := yamlpath.NewPath(selector)
	if err != nil {
		return nil, NotSupported, err
	}

	results, err := path.Find(&n)
	if err != nil {
		return nil, NotFound, err
	}

	out := []interface{}{}
	for _, a := range results {
		var b interface{}
		a.Decode(&b)
		if err != nil {
			return nil, WrapperErr, err
		}
		out = append(out, b)
	}

	jsonResult, err := json.Marshal(out)
	if err != nil {
		return nil, WrapperErr, err
	}
	return jsonResult, Ok, err
}
