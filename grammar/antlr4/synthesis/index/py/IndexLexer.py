# Generated from Index.g4 by ANTLR 4.8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7")
        buf.write("D\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r\t\r\4\16")
        buf.write("\t\16\3\2\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5")
        buf.write("\3\6\3\6\3\6\6\6-\n\6\r\6\16\6.\5\6\61\n\6\3\7\3\7\3\b")
        buf.write("\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\5\f?\n\f\3\r\3")
        buf.write("\r\3\16\3\16\2\2\17\3\3\5\4\7\5\t\6\13\7\r\2\17\2\21\2")
        buf.write("\23\2\25\2\27\2\31\2\33\2\3\2\t\4\2FFff\4\2GGgg\4\2KK")
        buf.write("kk\4\2PPpp\4\2ZZzz\3\2\63;\3\2\62\62\2>\2\3\3\2\2\2\2")
        buf.write("\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\3\35\3")
        buf.write("\2\2\2\5\37\3\2\2\2\7!\3\2\2\2\t#\3\2\2\2\13\60\3\2\2")
        buf.write("\2\r\62\3\2\2\2\17\64\3\2\2\2\21\66\3\2\2\2\238\3\2\2")
        buf.write("\2\25:\3\2\2\2\27>\3\2\2\2\31@\3\2\2\2\33B\3\2\2\2\35")
        buf.write("\36\7&\2\2\36\4\3\2\2\2\37 \7?\2\2 \6\3\2\2\2!\"\7/\2")
        buf.write("\2\"\b\3\2\2\2#$\5\21\t\2$%\5\23\n\2%&\5\r\7\2&\'\5\17")
        buf.write("\b\2\'(\5\25\13\2(\n\3\2\2\2)\61\5\27\f\2*,\5\31\r\2+")
        buf.write("-\5\27\f\2,+\3\2\2\2-.\3\2\2\2.,\3\2\2\2./\3\2\2\2/\61")
        buf.write("\3\2\2\2\60)\3\2\2\2\60*\3\2\2\2\61\f\3\2\2\2\62\63\t")
        buf.write("\2\2\2\63\16\3\2\2\2\64\65\t\3\2\2\65\20\3\2\2\2\66\67")
        buf.write("\t\4\2\2\67\22\3\2\2\289\t\5\2\29\24\3\2\2\2:;\t\6\2\2")
        buf.write(";\26\3\2\2\2<?\5\33\16\2=?\5\31\r\2><\3\2\2\2>=\3\2\2")
        buf.write("\2?\30\3\2\2\2@A\t\7\2\2A\32\3\2\2\2BC\t\b\2\2C\34\3\2")
        buf.write("\2\2\6\2.\60>\2")
        return buf.getvalue()


class IndexLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    T__0 = 1
    T__1 = 2
    T__2 = 3
    Index = 4
    INTEGER = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'$'", "'='", "'-'" ]

    symbolicNames = [ "<INVALID>",
            "Index", "INTEGER" ]

    ruleNames = [ "T__0", "T__1", "T__2", "Index", "INTEGER", "D", "E", 
                  "I", "N", "X", "DIGIT", "NON_ZERO", "ZERO" ]

    grammarFileName = "Index.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


