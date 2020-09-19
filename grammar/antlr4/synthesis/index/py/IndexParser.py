# Generated from Index.g4 by ANTLR 4.8
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
        buf.write("\17\4\2\t\2\3\2\5\2\6\n\2\3\2\3\2\3\2\5\2\13\n\2\3\2\3")
        buf.write("\2\3\2\2\2\3\2\2\2\2\17\2\5\3\2\2\2\4\6\7\3\2\2\5\4\3")
        buf.write("\2\2\2\5\6\3\2\2\2\6\7\3\2\2\2\7\b\7\6\2\2\b\n\7\4\2\2")
        buf.write("\t\13\7\5\2\2\n\t\3\2\2\2\n\13\3\2\2\2\13\f\3\2\2\2\f")
        buf.write("\r\7\7\2\2\r\3\3\2\2\2\4\5\n")
        return buf.getvalue()


class IndexParser ( Parser ):

    grammarFileName = "Index.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'$'", "'='", "'-'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "Index", "INTEGER" ]

    RULE_index = 0

    ruleNames =  [ "index" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    Index=4
    INTEGER=5

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class IndexContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Index(self):
            return self.getToken(IndexParser.Index, 0)

        def INTEGER(self):
            return self.getToken(IndexParser.INTEGER, 0)

        def getRuleIndex(self):
            return IndexParser.RULE_index

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIndex" ):
                listener.enterIndex(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIndex" ):
                listener.exitIndex(self)




    def index(self):

        localctx = IndexParser.IndexContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_index)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 3
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==IndexParser.T__0:
                self.state = 2
                self.match(IndexParser.T__0)


            self.state = 5
            self.match(IndexParser.Index)
            self.state = 6
            self.match(IndexParser.T__1)
            self.state = 8
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==IndexParser.T__2:
                self.state = 7
                self.match(IndexParser.T__2)


            self.state = 10
            self.match(IndexParser.INTEGER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





