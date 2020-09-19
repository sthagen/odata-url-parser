// Code generated from Count.g4 by ANTLR 4.8. DO NOT EDIT.

package count

import (
	"fmt"
	"unicode"

	"github.com/antlr/antlr4/runtime/Go/antlr"
)

// Suppress unused import error
var _ = fmt.Printf
var _ = unicode.IsLetter

var serializedLexerAtn = []uint16{
	3, 24715, 42794, 33075, 47597, 16764, 15335, 30598, 22884, 2, 7, 78, 8,
	1, 4, 2, 9, 2, 4, 3, 9, 3, 4, 4, 9, 4, 4, 5, 9, 5, 4, 6, 9, 6, 4, 7, 9,
	7, 4, 8, 9, 8, 4, 9, 9, 9, 4, 10, 9, 10, 4, 11, 9, 11, 4, 12, 9, 12, 4,
	13, 9, 13, 4, 14, 9, 14, 4, 15, 9, 15, 4, 16, 9, 16, 4, 17, 9, 17, 3, 2,
	3, 2, 3, 3, 3, 3, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 4, 3, 5, 3, 5, 3, 5,
	3, 5, 3, 5, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 7, 3, 7, 3, 8, 3, 8,
	3, 9, 3, 9, 3, 10, 3, 10, 3, 11, 3, 11, 3, 12, 3, 12, 3, 13, 3, 13, 3,
	14, 3, 14, 3, 15, 3, 15, 3, 16, 3, 16, 3, 17, 3, 17, 2, 2, 18, 3, 3, 5,
	4, 7, 5, 9, 6, 11, 7, 13, 2, 15, 2, 17, 2, 19, 2, 21, 2, 23, 2, 25, 2,
	27, 2, 29, 2, 31, 2, 33, 2, 3, 2, 13, 4, 2, 67, 67, 99, 99, 4, 2, 69, 69,
	101, 101, 4, 2, 71, 71, 103, 103, 4, 2, 72, 72, 104, 104, 4, 2, 78, 78,
	110, 110, 4, 2, 80, 80, 112, 112, 4, 2, 81, 81, 113, 113, 4, 2, 84, 84,
	116, 116, 4, 2, 85, 85, 117, 117, 4, 2, 86, 86, 118, 118, 4, 2, 87, 87,
	119, 119, 2, 66, 2, 3, 3, 2, 2, 2, 2, 5, 3, 2, 2, 2, 2, 7, 3, 2, 2, 2,
	2, 9, 3, 2, 2, 2, 2, 11, 3, 2, 2, 2, 3, 35, 3, 2, 2, 2, 5, 37, 3, 2, 2,
	2, 7, 39, 3, 2, 2, 2, 9, 45, 3, 2, 2, 2, 11, 50, 3, 2, 2, 2, 13, 56, 3,
	2, 2, 2, 15, 58, 3, 2, 2, 2, 17, 60, 3, 2, 2, 2, 19, 62, 3, 2, 2, 2, 21,
	64, 3, 2, 2, 2, 23, 66, 3, 2, 2, 2, 25, 68, 3, 2, 2, 2, 27, 70, 3, 2, 2,
	2, 29, 72, 3, 2, 2, 2, 31, 74, 3, 2, 2, 2, 33, 76, 3, 2, 2, 2, 35, 36,
	7, 38, 2, 2, 36, 4, 3, 2, 2, 2, 37, 38, 7, 63, 2, 2, 38, 6, 3, 2, 2, 2,
	39, 40, 5, 15, 8, 2, 40, 41, 5, 25, 13, 2, 41, 42, 5, 33, 17, 2, 42, 43,
	5, 23, 12, 2, 43, 44, 5, 31, 16, 2, 44, 8, 3, 2, 2, 2, 45, 46, 5, 31, 16,
	2, 46, 47, 5, 27, 14, 2, 47, 48, 5, 33, 17, 2, 48, 49, 5, 17, 9, 2, 49,
	10, 3, 2, 2, 2, 50, 51, 5, 19, 10, 2, 51, 52, 5, 13, 7, 2, 52, 53, 5, 21,
	11, 2, 53, 54, 5, 29, 15, 2, 54, 55, 5, 17, 9, 2, 55, 12, 3, 2, 2, 2, 56,
	57, 9, 2, 2, 2, 57, 14, 3, 2, 2, 2, 58, 59, 9, 3, 2, 2, 59, 16, 3, 2, 2,
	2, 60, 61, 9, 4, 2, 2, 61, 18, 3, 2, 2, 2, 62, 63, 9, 5, 2, 2, 63, 20,
	3, 2, 2, 2, 64, 65, 9, 6, 2, 2, 65, 22, 3, 2, 2, 2, 66, 67, 9, 7, 2, 2,
	67, 24, 3, 2, 2, 2, 68, 69, 9, 8, 2, 2, 69, 26, 3, 2, 2, 2, 70, 71, 9,
	9, 2, 2, 71, 28, 3, 2, 2, 2, 72, 73, 9, 10, 2, 2, 73, 30, 3, 2, 2, 2, 74,
	75, 9, 11, 2, 2, 75, 32, 3, 2, 2, 2, 76, 77, 9, 12, 2, 2, 77, 34, 3, 2,
	2, 2, 3, 2, 2,
}

var lexerDeserializer = antlr.NewATNDeserializer(nil)
var lexerAtn = lexerDeserializer.DeserializeFromUInt16(serializedLexerAtn)

var lexerChannelNames = []string{
	"DEFAULT_TOKEN_CHANNEL", "HIDDEN",
}

var lexerModeNames = []string{
	"DEFAULT_MODE",
}

var lexerLiteralNames = []string{
	"", "'$'", "'='",
}

var lexerSymbolicNames = []string{
	"", "", "", "Count", "True_", "False_",
}

var lexerRuleNames = []string{
	"T__0", "T__1", "Count", "True_", "False_", "A", "C", "E", "F", "L", "N",
	"O", "R", "S", "T", "U",
}

type CountLexer struct {
	*antlr.BaseLexer
	channelNames []string
	modeNames    []string
	// TODO: EOF string
}

var lexerDecisionToDFA = make([]*antlr.DFA, len(lexerAtn.DecisionToState))

func init() {
	for index, ds := range lexerAtn.DecisionToState {
		lexerDecisionToDFA[index] = antlr.NewDFA(ds, index)
	}
}

func NewCountLexer(input antlr.CharStream) *CountLexer {

	l := new(CountLexer)

	l.BaseLexer = antlr.NewBaseLexer(input)
	l.Interpreter = antlr.NewLexerATNSimulator(l, lexerAtn, lexerDecisionToDFA, antlr.NewPredictionContextCache())

	l.channelNames = lexerChannelNames
	l.modeNames = lexerModeNames
	l.RuleNames = lexerRuleNames
	l.LiteralNames = lexerLiteralNames
	l.SymbolicNames = lexerSymbolicNames
	l.GrammarFileName = "Count.g4"
	// TODO: l.EOF = antlr.TokenEOF

	return l
}

// CountLexer tokens.
const (
	CountLexerT__0   = 1
	CountLexerT__1   = 2
	CountLexerCount  = 3
	CountLexerTrue_  = 4
	CountLexerFalse_ = 5
)
