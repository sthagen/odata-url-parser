// Generated from SkipTop.g4 by ANTLR 4.8
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SkipTopParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, Skip=3, Top=4, INTEGER=5;
	public static final int
		RULE_skip_top = 0, RULE_skip = 1, RULE_top = 2;
	private static String[] makeRuleNames() {
		return new String[] {
			"skip_top", "skip", "top"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'$'", "'='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, "Skip", "Top", "INTEGER"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "SkipTop.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public SkipTopParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class Skip_topContext extends ParserRuleContext {
		public SkipContext skip() {
			return getRuleContext(SkipContext.class,0);
		}
		public TopContext top() {
			return getRuleContext(TopContext.class,0);
		}
		public Skip_topContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_skip_top; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).enterSkip_top(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).exitSkip_top(this);
		}
	}

	public final Skip_topContext skip_top() throws RecognitionException {
		Skip_topContext _localctx = new Skip_topContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_skip_top);
		try {
			setState(8);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(6);
				skip();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(7);
				top();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SkipContext extends ParserRuleContext {
		public TerminalNode Skip() { return getToken(SkipTopParser.Skip, 0); }
		public TerminalNode INTEGER() { return getToken(SkipTopParser.INTEGER, 0); }
		public SkipContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_skip; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).enterSkip(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).exitSkip(this);
		}
	}

	public final SkipContext skip() throws RecognitionException {
		SkipContext _localctx = new SkipContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_skip);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(11);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(10);
				match(T__0);
				}
			}

			setState(13);
			match(Skip);
			setState(14);
			match(T__1);
			setState(15);
			match(INTEGER);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TopContext extends ParserRuleContext {
		public TerminalNode Top() { return getToken(SkipTopParser.Top, 0); }
		public TerminalNode INTEGER() { return getToken(SkipTopParser.INTEGER, 0); }
		public TopContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_top; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).enterTop(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SkipTopListener ) ((SkipTopListener)listener).exitTop(this);
		}
	}

	public final TopContext top() throws RecognitionException {
		TopContext _localctx = new TopContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_top);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(18);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(17);
				match(T__0);
				}
			}

			setState(20);
			match(Top);
			setState(21);
			match(T__1);
			setState(22);
			match(INTEGER);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\7\33\4\2\t\2\4\3"+
		"\t\3\4\4\t\4\3\2\3\2\5\2\13\n\2\3\3\5\3\16\n\3\3\3\3\3\3\3\3\3\3\4\5\4"+
		"\25\n\4\3\4\3\4\3\4\3\4\3\4\2\2\5\2\4\6\2\2\2\32\2\n\3\2\2\2\4\r\3\2\2"+
		"\2\6\24\3\2\2\2\b\13\5\4\3\2\t\13\5\6\4\2\n\b\3\2\2\2\n\t\3\2\2\2\13\3"+
		"\3\2\2\2\f\16\7\3\2\2\r\f\3\2\2\2\r\16\3\2\2\2\16\17\3\2\2\2\17\20\7\5"+
		"\2\2\20\21\7\4\2\2\21\22\7\7\2\2\22\5\3\2\2\2\23\25\7\3\2\2\24\23\3\2"+
		"\2\2\24\25\3\2\2\2\25\26\3\2\2\2\26\27\7\6\2\2\27\30\7\4\2\2\30\31\7\7"+
		"\2\2\31\7\3\2\2\2\5\n\r\24";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}