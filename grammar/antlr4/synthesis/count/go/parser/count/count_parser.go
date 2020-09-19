// Code generated from Count.g4 by ANTLR 4.8. DO NOT EDIT.

package count // Count
import (
	"fmt"
	"reflect"
	"strconv"

	"github.com/antlr/antlr4/runtime/Go/antlr"
)

// Suppress unused import errors
var _ = fmt.Printf
var _ = reflect.Copy
var _ = strconv.Itoa

var parserATN = []uint16{
	3, 24715, 42794, 33075, 47597, 16764, 15335, 30598, 22884, 3, 7, 12, 4,
	2, 9, 2, 3, 2, 5, 2, 6, 10, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 2, 2, 3, 2,
	2, 3, 3, 2, 6, 7, 2, 11, 2, 5, 3, 2, 2, 2, 4, 6, 7, 3, 2, 2, 5, 4, 3, 2,
	2, 2, 5, 6, 3, 2, 2, 2, 6, 7, 3, 2, 2, 2, 7, 8, 7, 5, 2, 2, 8, 9, 7, 4,
	2, 2, 9, 10, 9, 2, 2, 2, 10, 3, 3, 2, 2, 2, 3, 5,
}
var deserializer = antlr.NewATNDeserializer(nil)
var deserializedATN = deserializer.DeserializeFromUInt16(parserATN)

var literalNames = []string{
	"", "'$'", "'='",
}
var symbolicNames = []string{
	"", "", "", "Count", "True_", "False_",
}

var ruleNames = []string{
	"count",
}
var decisionToDFA = make([]*antlr.DFA, len(deserializedATN.DecisionToState))

func init() {
	for index, ds := range deserializedATN.DecisionToState {
		decisionToDFA[index] = antlr.NewDFA(ds, index)
	}
}

type CountParser struct {
	*antlr.BaseParser
}

func NewCountParser(input antlr.TokenStream) *CountParser {
	this := new(CountParser)

	this.BaseParser = antlr.NewBaseParser(input)

	this.Interpreter = antlr.NewParserATNSimulator(this, deserializedATN, decisionToDFA, antlr.NewPredictionContextCache())
	this.RuleNames = ruleNames
	this.LiteralNames = literalNames
	this.SymbolicNames = symbolicNames
	this.GrammarFileName = "Count.g4"

	return this
}

// CountParser tokens.
const (
	CountParserEOF    = antlr.TokenEOF
	CountParserT__0   = 1
	CountParserT__1   = 2
	CountParserCount  = 3
	CountParserTrue_  = 4
	CountParserFalse_ = 5
)

// CountParserRULE_count is the CountParser rule.
const CountParserRULE_count = 0

// ICountContext is an interface to support dynamic dispatch.
type ICountContext interface {
	antlr.ParserRuleContext

	// GetParser returns the parser.
	GetParser() antlr.Parser

	// IsCountContext differentiates from other interfaces.
	IsCountContext()
}

type CountContext struct {
	*antlr.BaseParserRuleContext
	parser antlr.Parser
}

func NewEmptyCountContext() *CountContext {
	var p = new(CountContext)
	p.BaseParserRuleContext = antlr.NewBaseParserRuleContext(nil, -1)
	p.RuleIndex = CountParserRULE_count
	return p
}

func (*CountContext) IsCountContext() {}

func NewCountContext(parser antlr.Parser, parent antlr.ParserRuleContext, invokingState int) *CountContext {
	var p = new(CountContext)

	p.BaseParserRuleContext = antlr.NewBaseParserRuleContext(parent, invokingState)

	p.parser = parser
	p.RuleIndex = CountParserRULE_count

	return p
}

func (s *CountContext) GetParser() antlr.Parser { return s.parser }

func (s *CountContext) Count() antlr.TerminalNode {
	return s.GetToken(CountParserCount, 0)
}

func (s *CountContext) True_() antlr.TerminalNode {
	return s.GetToken(CountParserTrue_, 0)
}

func (s *CountContext) False_() antlr.TerminalNode {
	return s.GetToken(CountParserFalse_, 0)
}

func (s *CountContext) GetRuleContext() antlr.RuleContext {
	return s
}

func (s *CountContext) ToStringTree(ruleNames []string, recog antlr.Recognizer) string {
	return antlr.TreesStringTree(s, ruleNames, recog)
}

func (s *CountContext) EnterRule(listener antlr.ParseTreeListener) {
	if listenerT, ok := listener.(CountListener); ok {
		listenerT.EnterCount(s)
	}
}

func (s *CountContext) ExitRule(listener antlr.ParseTreeListener) {
	if listenerT, ok := listener.(CountListener); ok {
		listenerT.ExitCount(s)
	}
}

func (p *CountParser) Count() (localctx ICountContext) {
	localctx = NewCountContext(p, p.GetParserRuleContext(), p.GetState())
	p.EnterRule(localctx, 0, CountParserRULE_count)
	var _la int

	defer func() {
		p.ExitRule()
	}()

	defer func() {
		if err := recover(); err != nil {
			if v, ok := err.(antlr.RecognitionException); ok {
				localctx.SetException(v)
				p.GetErrorHandler().ReportError(p, v)
				p.GetErrorHandler().Recover(p, v)
			} else {
				panic(err)
			}
		}
	}()

	p.EnterOuterAlt(localctx, 1)
	p.SetState(3)
	p.GetErrorHandler().Sync(p)
	_la = p.GetTokenStream().LA(1)

	if _la == CountParserT__0 {
		{
			p.SetState(2)
			p.Match(CountParserT__0)
		}

	}
	{
		p.SetState(5)
		p.Match(CountParserCount)
	}
	{
		p.SetState(6)
		p.Match(CountParserT__1)
	}
	{
		p.SetState(7)
		_la = p.GetTokenStream().LA(1)

		if !(_la == CountParserTrue_ || _la == CountParserFalse_) {
			p.GetErrorHandler().RecoverInline(p)
		} else {
			p.GetErrorHandler().ReportMatch(p)
			p.Consume()
		}
	}

	return localctx
}
