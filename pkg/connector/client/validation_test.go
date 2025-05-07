package client

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

type testTableCase struct {
	Name  string
	Input string
	Error string
}

func TestValidateUserName(t *testing.T) {
	cases := []testTableCase{
		{
			Name:  "success - valid username",
			Input: "example",
		},
		{
			Name:  "failure - username has whitespace",
			Input: "example username",
			Error: "cannot have any whitespaces",
		},
		{
			Name:  "failure - username has \\ character",
			Input: "exa\\mple",
			Error: "cannot contain any of these characters",
		},
		{
			Name:  "failure - username has + character",
			Input: "exa+mple",
			Error: "cannot contain any of these characters",
		},
		{
			Name:  "failure - username has uppercase letters",
			Input: "eXample",
			Error: "cannot have uppercase letters",
		},
		{
			Name:  "failure - username has uppercase letter Δ",
			Input: "exΔmple",
			Error: "cannot have uppercase letters",
		},
		{
			Name:  "failure - username is anonymous",
			Input: "anonymous",
			Error: "cannot be 'anonymous'",
		},
		{
			Name:  "failure - username is aNOnyMOUs",
			Input: "aNOnyMOUs",
			Error: "cannot be 'anonymous'",
		},
		{
			Name:  "failure - username is blank",
			Error: "cannot be blank",
		},
	}

	for _, tc := range cases {
		t.Run(tc.Name, func(t *testing.T) {
			err := validateUserName(tc.Input)
			if tc.Error == "" {
				assert.Nil(t, err)
			} else {
				assert.Contains(t, err.Error(), tc.Error)
			}
		})
	}
}

func TestValidateFullName(t *testing.T) {
	cases := []testTableCase{
		{
			Name:  "success - valid full name",
			Input: "John Smith",
		},
		{
			Name:  "failure - full name has \\ character",
			Input: "John Sm\\ith",
			Error: "cannot contain any of these characters",
		},
		{
			Name:  "failure - full name has + character",
			Input: "Jo+hn Smith",
			Error: "cannot contain any of these characters",
		},
		{
			Name:  "failure - full name is anonymous",
			Input: "anonymous",
			Error: "cannot be 'anonymous'",
		},
		{
			Name:  "failure - full name is aNOnyMOUs",
			Input: "aNOnyMOUs",
			Error: "cannot be 'anonymous'",
		},
		{
			Name:  "failure - full name is blank",
			Error: "cannot be blank",
		},
	}

	for _, tc := range cases {
		t.Run(tc.Name, func(t *testing.T) {
			err := validateFullName(tc.Input)
			if tc.Error == "" {
				assert.Nil(t, err)
			} else {
				assert.Contains(t, err.Error(), tc.Error)
			}
		})
	}
}

func TestValidateEmail(t *testing.T) {
	cases := []testTableCase{
		{
			Name:  "success - valid email address",
			Input: "john@example.com",
		},
		{
			Name:  "failure - email address has \\ character",
			Input: "john@\\example.com",
			Error: "email address is invalid",
		},
		{
			Name:  "failure - email address is blank",
			Error: "cannot be blank",
		},
	}

	for _, tc := range cases {
		t.Run(tc.Name, func(t *testing.T) {
			err := validateEmailAddress(tc.Input)
			if tc.Error == "" {
				assert.Nil(t, err)
			} else {
				assert.Contains(t, err.Error(), tc.Error)
			}
		})
	}
}
