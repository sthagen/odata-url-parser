// Code generated from Count.g4 by ANTLR 4.8. DO NOT EDIT.

package count // Count
import "github.com/antlr/antlr4/runtime/Go/antlr"

// BaseCountListener is a complete listener for a parse tree produced by CountParser.
type BaseCountListener struct{}

var _ CountListener = &BaseCountListener{}

// VisitTerminal is called when a terminal node is visited.
func (s *BaseCountListener) VisitTerminal(node antlr.TerminalNode) {}

// VisitErrorNode is called when an error node is visited.
func (s *BaseCountListener) VisitErrorNode(node antlr.ErrorNode) {}

// EnterEveryRule is called when any rule is entered.
func (s *BaseCountListener) EnterEveryRule(ctx antlr.ParserRuleContext) {}

// ExitEveryRule is called when any rule is exited.
func (s *BaseCountListener) ExitEveryRule(ctx antlr.ParserRuleContext) {}

// EnterCount is called when production count is entered.
func (s *BaseCountListener) EnterCount(ctx *CountContext) {}

// ExitCount is called when production count is exited.
func (s *BaseCountListener) ExitCount(ctx *CountContext) {}
