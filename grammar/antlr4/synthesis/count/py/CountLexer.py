# Generated from Count.g4 by ANTLR 4.8
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7")
        buf.write("N\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7")
        buf.write("\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r\t\r\4\16")
        buf.write("\t\16\4\17\t\17\4\20\t\20\4\21\t\21\3\2\3\2\3\3\3\3\3")
        buf.write("\4\3\4\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6")
        buf.write("\3\6\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13")
        buf.write("\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21\3")
        buf.write("\21\2\2\22\3\3\5\4\7\5\t\6\13\7\r\2\17\2\21\2\23\2\25")
        buf.write("\2\27\2\31\2\33\2\35\2\37\2!\2\3\2\r\4\2CCcc\4\2EEee\4")
        buf.write("\2GGgg\4\2HHhh\4\2NNnn\4\2PPpp\4\2QQqq\4\2TTtt\4\2UUu")
        buf.write("u\4\2VVvv\4\2WWww\2B\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2")
        buf.write("\2\2\t\3\2\2\2\2\13\3\2\2\2\3#\3\2\2\2\5%\3\2\2\2\7\'")
        buf.write("\3\2\2\2\t-\3\2\2\2\13\62\3\2\2\2\r8\3\2\2\2\17:\3\2\2")
        buf.write("\2\21<\3\2\2\2\23>\3\2\2\2\25@\3\2\2\2\27B\3\2\2\2\31")
        buf.write("D\3\2\2\2\33F\3\2\2\2\35H\3\2\2\2\37J\3\2\2\2!L\3\2\2")
        buf.write("\2#$\7&\2\2$\4\3\2\2\2%&\7?\2\2&\6\3\2\2\2\'(\5\17\b\2")
        buf.write("()\5\31\r\2)*\5!\21\2*+\5\27\f\2+,\5\37\20\2,\b\3\2\2")
        buf.write("\2-.\5\37\20\2./\5\33\16\2/\60\5!\21\2\60\61\5\21\t\2")
        buf.write("\61\n\3\2\2\2\62\63\5\23\n\2\63\64\5\r\7\2\64\65\5\25")
        buf.write("\13\2\65\66\5\35\17\2\66\67\5\21\t\2\67\f\3\2\2\289\t")
        buf.write("\2\2\29\16\3\2\2\2:;\t\3\2\2;\20\3\2\2\2<=\t\4\2\2=\22")
        buf.write("\3\2\2\2>?\t\5\2\2?\24\3\2\2\2@A\t\6\2\2A\26\3\2\2\2B")
        buf.write("C\t\7\2\2C\30\3\2\2\2DE\t\b\2\2E\32\3\2\2\2FG\t\t\2\2")
        buf.write("G\34\3\2\2\2HI\t\n\2\2I\36\3\2\2\2JK\t\13\2\2K \3\2\2")
        buf.write("\2LM\t\f\2\2M\"\3\2\2\2\3\2\2")
        return buf.getvalue()


class CountLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    T__0 = 1
    T__1 = 2
    Count = 3
    True_ = 4
    False_ = 5

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "'$'", "'='" ]

    symbolicNames = [ "<INVALID>",
            "Count", "True_", "False_" ]

    ruleNames = [ "T__0", "T__1", "Count", "True_", "False_", "A", "C", 
                  "E", "F", "L", "N", "O", "R", "S", "T", "U" ]

    grammarFileName = "Count.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


