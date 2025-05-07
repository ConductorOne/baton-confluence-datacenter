package client

import (
	"fmt"
	"regexp"
)

var (
	forbiddenChars       = regexp.MustCompile(`\\|,|\+|<|>|'|"`)
	forbiddenName        = regexp.MustCompile(`(?mi)anonymous`)
	forbiddenUpperCase   = regexp.MustCompile(`(?m)\p{Lu}`)
	forbiddenWhitespaces = regexp.MustCompile(`(?m)\s`)
	validEmail           = regexp.MustCompile(`[A-Za-z0-9\._%+\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,}`)
)

func validateUserName(username string) error {
	if username == "" {
		return fmt.Errorf("username cannot be blank")
	}
	if forbiddenChars.MatchString(username) {
		return fmt.Errorf(`username cannot contain any of these characters: \ , + < > ' "`)
	}
	if forbiddenName.MatchString(username) {
		return fmt.Errorf("username cannot be 'anonymous'")
	}
	if forbiddenUpperCase.MatchString(username) {
		return fmt.Errorf("username cannot have uppercase letters")
	}
	if forbiddenWhitespaces.MatchString(username) {
		return fmt.Errorf("username cannot have any whitespaces")
	}

	return nil
}

func validateFullName(fullName string) error {
	if fullName == "" {
		return fmt.Errorf("full name cannot be blank")
	}
	if forbiddenChars.MatchString(fullName) {
		return fmt.Errorf(`full name cannot contain any of these characters: \ , + < > ' "`)
	}
	if forbiddenName.MatchString(fullName) {
		return fmt.Errorf("full name cannot be 'anonymous'")
	}

	return nil
}

func validateEmailAddress(email string) error {
	if email == "" {
		return fmt.Errorf("email address cannot be blank")
	}
	if !validEmail.MatchString(email) {
		return fmt.Errorf("email address is invalid")
	}

	return nil
}
