package app

import "testing"

func TestParseArgs(t *testing.T) {
	var app appEnv
	args := []string{"a", "b"}
	if err := app.ParseArgs(args); err != nil {
		t.Errorf("Parsing args (%q) failed", args)
	}
}
