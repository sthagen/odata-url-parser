# Generated from SkipTop.g4 by ANTLR 4.8
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
        buf.write("\33\4\2\t\2\4\3\t\3\4\4\t\4\3\2\3\2\5\2\13\n\2\3\3\5\3")
        buf.write("\16\n\3\3\3\3\3\3\3\3\3\3\4\5\4\25\n\4\3\4\3\4\3\4\3\4")
        buf.write("\3\4\2\2\5\2\4\6\2\2\2\32\2\n\3\2\2\2\4\r\3\2\2\2\6\24")
        buf.write("\3\2\2\2\b\13\5\4\3\2\t\13\5\6\4\2\n\b\3\2\2\2\n\t\3\2")
        buf.write("\2\2\13\3\3\2\2\2\f\16\7\3\2\2\r\f\3\2\2\2\r\16\3\2\2")
        buf.write("\2\16\17\3\2\2\2\17\20\7\5\2\2\20\21\7\4\2\2\21\22\7\7")
        buf.write("\2\2\22\5\3\2\2\2\23\25\7\3\2\2\24\23\3\2\2\2\24\25\3")
        buf.write("\2\2\2\25\26\3\2\2\2\26\27\7\6\2\2\27\30\7\4\2\2\30\31")
        buf.write("\7\7\2\2\31\7\3\2\2\2\5\n\r\24")
        return buf.getvalue()


class SkipTopParser ( Parser ):

    grammarFileName = "SkipTop.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'$'", "'='" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "Skip", "Top", 
                      "INTEGER" ]

    RULE_skip_top = 0
    RULE_skip = 1
    RULE_top = 2

    ruleNames =  [ "skip_top", "skip", "top" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    Skip=3
    Top=4
    INTEGER=5

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class Skip_topContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def skip(self):
            return self.getTypedRuleContext(SkipTopParser.SkipContext,0)


        def top(self):
            return self.getTypedRuleContext(SkipTopParser.TopContext,0)


        def getRuleIndex(self):
            return SkipTopParser.RULE_skip_top

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSkip_top" ):
                listener.enterSkip_top(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSkip_top" ):
                listener.exitSkip_top(self)




    def skip_top(self):

        localctx = SkipTopParser.Skip_topContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_skip_top)
        try:
            self.state = 8
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,0,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 6
                self.skip()
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 7
                self.top()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class SkipContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Skip(self):
            return self.getToken(SkipTopParser.Skip, 0)

        def INTEGER(self):
            return self.getToken(SkipTopParser.INTEGER, 0)

        def getRuleIndex(self):
            return SkipTopParser.RULE_skip

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSkip" ):
                listener.enterSkip(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSkip" ):
                listener.exitSkip(self)




    def skip(self):

        localctx = SkipTopParser.SkipContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_skip)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 11
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==SkipTopParser.T__0:
                self.state = 10
                self.match(SkipTopParser.T__0)


            self.state = 13
            self.match(SkipTopParser.Skip)
            self.state = 14
            self.match(SkipTopParser.T__1)
            self.state = 15
            self.match(SkipTopParser.INTEGER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TopContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Top(self):
            return self.getToken(SkipTopParser.Top, 0)

        def INTEGER(self):
            return self.getToken(SkipTopParser.INTEGER, 0)

        def getRuleIndex(self):
            return SkipTopParser.RULE_top

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTop" ):
                listener.enterTop(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTop" ):
                listener.exitTop(self)




    def top(self):

        localctx = SkipTopParser.TopContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_top)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 18
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==SkipTopParser.T__0:
                self.state = 17
                self.match(SkipTopParser.T__0)


            self.state = 20
            self.match(SkipTopParser.Top)
            self.state = 21
            self.match(SkipTopParser.T__1)
            self.state = 22
            self.match(SkipTopParser.INTEGER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





