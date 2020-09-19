# Generated from Count.g4 by ANTLR 4.8
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO


def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\7")
        buf.write("\f\4\2\t\2\3\2\5\2\6\n\2\3\2\3\2\3\2\3\2\3\2\2\2\3\2\2")
        buf.write("\3\3\2\6\7\2\13\2\5\3\2\2\2\4\6\7\3\2\2\5\4\3\2\2\2\5")
        buf.write("\6\3\2\2\2\6\7\3\2\2\2\7\b\7\5\2\2\b\t\7\4\2\2\t\n\t\2")
        buf.write("\2\2\n\3\3\2\2\2\3\5")
        return buf.getvalue()


class CountParser ( Parser ):

    grammarFileName = "Count.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'$'", "'='" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "Count", "True_", 
                      "False_" ]

    RULE_count = 0

    ruleNames =  [ "count" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    Count=3
    True_=4
    False_=5

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class CountContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Count(self):
            return self.getToken(CountParser.Count, 0)

        def True_(self):
            return self.getToken(CountParser.True_, 0)

        def False_(self):
            return self.getToken(CountParser.False_, 0)

        def getRuleIndex(self):
            return CountParser.RULE_count

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCount" ):
                listener.enterCount(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCount" ):
                listener.exitCount(self)




    def count(self):

        localctx = CountParser.CountContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_count)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 3
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==CountParser.T__0:
                self.state = 2
                self.match(CountParser.T__0)


            self.state = 5
            self.match(CountParser.Count)
            self.state = 6
            self.match(CountParser.T__1)
            self.state = 7
            _la = self._input.LA(1)
            if not(_la==CountParser.True_ or _la==CountParser.False_):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





