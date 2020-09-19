# Generated from Schemaversion.g4 by ANTLR 4.8
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
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\t")
        buf.write("\22\4\2\t\2\3\2\5\2\6\n\2\3\2\3\2\3\2\3\2\6\2\f\n\2\r")
        buf.write("\2\16\2\r\5\2\20\n\2\3\2\2\2\3\2\2\2\2\23\2\5\3\2\2\2")
        buf.write("\4\6\7\3\2\2\5\4\3\2\2\2\5\6\3\2\2\2\6\7\3\2\2\2\7\b\7")
        buf.write("\6\2\2\b\17\7\4\2\2\t\20\7\5\2\2\n\f\7\7\2\2\13\n\3\2")
        buf.write("\2\2\f\r\3\2\2\2\r\13\3\2\2\2\r\16\3\2\2\2\16\20\3\2\2")
        buf.write("\2\17\t\3\2\2\2\17\13\3\2\2\2\20\3\3\2\2\2\5\5\r\17")
        return buf.getvalue()


class SchemaversionParser ( Parser ):

    grammarFileName = "Schemaversion.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'$'", "'='", "'*'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "Schemaversion", "Unreserved", "Alpha", "Digit" ]

    RULE_schemaversion = 0

    ruleNames =  [ "schemaversion" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    Schemaversion=4
    Unreserved=5
    Alpha=6
    Digit=7

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.8")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class SchemaversionContext(ParserRuleContext):

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def Schemaversion(self):
            return self.getToken(SchemaversionParser.Schemaversion, 0)

        def Unreserved(self, i:int=None):
            if i is None:
                return self.getTokens(SchemaversionParser.Unreserved)
            else:
                return self.getToken(SchemaversionParser.Unreserved, i)

        def getRuleIndex(self):
            return SchemaversionParser.RULE_schemaversion

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSchemaversion" ):
                listener.enterSchemaversion(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSchemaversion" ):
                listener.exitSchemaversion(self)




    def schemaversion(self):

        localctx = SchemaversionParser.SchemaversionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_schemaversion)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 3
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==SchemaversionParser.T__0:
                self.state = 2
                self.match(SchemaversionParser.T__0)


            self.state = 5
            self.match(SchemaversionParser.Schemaversion)
            self.state = 6
            self.match(SchemaversionParser.T__1)
            self.state = 13
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [SchemaversionParser.T__2]:
                self.state = 7
                self.match(SchemaversionParser.T__2)
                pass
            elif token in [SchemaversionParser.Unreserved]:
                self.state = 9 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while True:
                    self.state = 8
                    self.match(SchemaversionParser.Unreserved)
                    self.state = 11 
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)
                    if not (_la==SchemaversionParser.Unreserved):
                        break

                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx





