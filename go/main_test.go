package main

import (
	"os"
	"testing"
)

func TestMain(m *testing.M) {
	os.Args = []string{"ignore", "a", "b"}
	main()
}