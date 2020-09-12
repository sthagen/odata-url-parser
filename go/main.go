package main

import (
	"os"

	"github.com/carlmjohnson/exitcode"
	"github.com/sthagen/odata-url-parser/go/app"
)

func main() {
	exitcode.Exit(app.CLI(os.Args[1:]))
}
