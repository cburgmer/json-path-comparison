// Copyright 2020 VMware, Inc.
// SPDX-License-Identifier: GPL-3.0

package wrapper_test

import (
	"testing"

	"example.com/main/internal/wrapper"
	"github.com/stretchr/testify/require"
)

func TestFind(t *testing.T) {
	cases := []struct {
		name            string
		selector        string
		input           string
		expected        string
		expectedErrType wrapper.ErrorType
		focus           bool // if true, run only tests with focus set to true
	}{
		{
			name:     "basic",
			selector: "$[1]",
			input:    "[0, 42]",
			expected: "[42]",
		},
		{
			name:     "complex",
			selector: "$.*",
			input:    `["string",42,{"key":"value"},[0,1]]`,
			expected: `["string",42,{"key":"value"},[0,1]]`,
		},
		{
			name:            "unsupported selector",
			selector:        "[",
			input:           "[0, 42]",
			expected:        "[42]",
			expectedErrType: wrapper.NotSupported,
		},
	}

	focussed := false
	for _, tc := range cases {
		if tc.focus {
			focussed = true
			break
		}
	}

	for _, tc := range cases {
		if focussed && !tc.focus {
			continue
		}
		t.Run(tc.name, func(t *testing.T) {
			jsonResult, errType, err := wrapper.Find(tc.selector, []byte(tc.input))
			require.Equal(t, tc.expectedErrType, errType)
			if tc.expectedErrType == wrapper.Ok {
				require.NoError(t, err)
				require.Equal(t, tc.expected, string(jsonResult))
			}
		})
	}

	if focussed {
		t.Fatalf("testcase(s) still focussed")
	}
}
