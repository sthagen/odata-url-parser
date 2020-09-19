# Generated from SkipTop.g4 by ANTLR 4.8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7")
        buf.write("I\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r\t\r\4\16")
        buf.write("\t\16\4\17\t\17\3\2\3\2\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3")
        buf.write("\5\3\5\3\5\3\5\3\6\3\6\3\6\6\6\60\n\6\r\6\16\6\61\5\6")
        buf.write("\64\n\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f")
        buf.write("\3\f\3\r\3\r\5\rD\n\r\3\16\3\16\3\17\3\17\2\2\20\3\3\5")
        buf.write("\4\7\5\t\6\13\7\r\2\17\2\21\2\23\2\25\2\27\2\31\2\33\2")
        buf.write("\35\2\3\2\n\4\2KKkk\4\2MMmm\4\2QQqq\4\2RRrr\4\2UUuu\4")
        buf.write("\2VVvv\3\2\63;\3\2\62\62\2B\2\3\3\2\2\2\2\5\3\2\2\2\2")
        buf.write("\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\3\37\3\2\2\2\5!\3")
        buf.write("\2\2\2\7#\3\2\2\2\t(\3\2\2\2\13\63\3\2\2\2\r\65\3\2\2")
        buf.write("\2\17\67\3\2\2\2\219\3\2\2\2\23;\3\2\2\2\25=\3\2\2\2\27")
        buf.write("?\3\2\2\2\31C\3\2\2\2\33E\3\2\2\2\35G\3\2\2\2\37 \7&\2")
        buf.write("\2 \4\3\2\2\2!\"\7?\2\2\"\6\3\2\2\2#$\5\25\13\2$%\5\17")
        buf.write("\b\2%&\5\r\7\2&\'\5\23\n\2\'\b\3\2\2\2()\5\27\f\2)*\5")
        buf.write("\21\t\2*+\5\23\n\2+\n\3\2\2\2,\64\5\31\r\2-/\5\33\16\2")
        buf.write(".\60\5\31\r\2/.\3\2\2\2\60\61\3\2\2\2\61/\3\2\2\2\61\62")
        buf.write("\3\2\2\2\62\64\3\2\2\2\63,\3\2\2\2\63-\3\2\2\2\64\f\3")
        buf.write("\2\2\2\65\66\t\2\2\2\66\16\3\2\2\2\678\t\3\2\28\20\3\2")
        buf.write("\2\29:\t\4\2\2:\22\3\2\2\2;<\t\5\2\2<\24\3\2\2\2=>\t\6")
        buf.write("\2\2>\26\3\2\2\2?@\t\7\2\2@\30\3\2\2\2AD\5\35\17\2BD\5")
        buf.write("\33\16\2CA\3\2\2\2CB\3\2\2\2D\32\3\2\2\2EF\t\b\2\2F\34")
        buf.write("\3\2\2\2GH\t\t\2\2H\36\3\2\2\2\6\2\61\63C\2")
        return buf.getvalue()


class SkipTopLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    T__0 = 1
    T__1 = 2
    Skip = 3
    Top = 4
    INTEGER = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'$'", "'='" ]

    symbolicNames = [ "<INVALID>",
            "Skip", "Top", "INTEGER" ]

    ruleNames = [ "T__0", "T__1", "Skip", "Top", "INTEGER", "I", "K", "O", 
                  "P", "S", "T", "DIGIT", "NON_ZERO", "ZERO" ]

    grammarFileName = "SkipTop.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


