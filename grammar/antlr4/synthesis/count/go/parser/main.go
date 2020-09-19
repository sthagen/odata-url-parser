package main

import (
	"fmt"
	"github.com/antlr/antlr4/runtime/Go/antlr"
	"os"

	"github.com/sthagen/odata-url-parser/go/count"
)

type TreeShapeListener struct {
	count.CountListener
}

func NewTreeShapeListener() *TreeShapeListener {
	return new(TreeShapeListener)
}

func (this *TreeShapeListener) EnterEveryRule(ctx antlr.ParserRuleContext) {
	fmt.Printf("    %v\n", ctx.GetText())
}

func main() {
    for pos, arg := range os.Args[1:] {
        fmt.Println("Lexing", pos + 1, "-", arg, "::")
        input, _ := antlr.NewFileStream(arg)
        lexer := count.NewCountLexer(input)
        for {
            t := lexer.NextToken()
            if t.GetTokenType() == antlr.TokenEOF {
                break
            }
            fmt.Printf("    %s (%q)\n",
                lexer.SymbolicNames[t.GetTokenType()], t.GetText())
        }

		//fmt.Println("Parsing", pos + 1, "-", arg, "::")
		//input, _ = antlr.NewFileStream(arg)
		//lexer = count.NewCountLexer(input)
		//stream := antlr.NewCommonTokenStream(lexer, 0)
		//p := count.NewCountParser(stream)
		//p.AddErrorListener(antlr.NewDiagnosticErrorListener(true))
		//p.BuildParseTrees = true
		//tree := p.Count()
        //fmt.Printf("    %v\n", tree)
		//defer func()  {
		//	if r := recover(); r != nil {
		//		fmt.Println("    Recovered in antlr parser implementation", r)
		//	}
		//}()
		//antlr.ParseTreeWalkerDefault.Walk(NewTreeShapeListener(), tree)
    }
}
