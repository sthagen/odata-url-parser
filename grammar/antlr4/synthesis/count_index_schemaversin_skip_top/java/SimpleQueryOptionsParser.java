// Generated from SimpleQueryOptions.g4 by ANTLR 4.8
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SimpleQueryOptionsParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		DIGIT=1, UNRESERVED=2, BOOLEANVALUE=3, COUNT=4, INDEX=5, SCHEMAVERSION=6, 
		SKIP_=7, TOP=8, TRUE=9, FALSE=10, SIGN=11, DASH=12, DOLLAR=13, EQ=14, 
		STAR=15, AMPERSAND=16, ALPHA=17;
	public static final int
		RULE_queryoptions = 0, RULE_queryoption = 1, RULE_inlinecount = 2, RULE_index_ = 3, 
		RULE_schemaversion = 4, RULE_skip = 5, RULE_top = 6;
	private static String[] makeRuleNames() {
		return new String[] {
			"queryoptions", "queryoption", "inlinecount", "index_", "schemaversion", 
			"skip", "top"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"'-'", "'$'", "'='", "'*'", "'&'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "DIGIT", "UNRESERVED", "BOOLEANVALUE", "COUNT", "INDEX", "SCHEMAVERSION", 
			"SKIP_", "TOP", "TRUE", "FALSE", "SIGN", "DASH", "DOLLAR", "EQ", "STAR", 
			"AMPERSAND", "ALPHA"
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
	public String getGrammarFileName() { return "SimpleQueryOptions.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public SimpleQueryOptionsParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class QueryoptionsContext extends ParserRuleContext {
		public List<QueryoptionContext> queryoption() {
			return getRuleContexts(QueryoptionContext.class);
		}
		public QueryoptionContext queryoption(int i) {
			return getRuleContext(QueryoptionContext.class,i);
		}
		public List<TerminalNode> AMPERSAND() { return getTokens(SimpleQueryOptionsParser.AMPERSAND); }
		public TerminalNode AMPERSAND(int i) {
			return getToken(SimpleQueryOptionsParser.AMPERSAND, i);
		}
		public QueryoptionsContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_queryoptions; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterQueryoptions(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitQueryoptions(this);
		}
	}

	public final QueryoptionsContext queryoptions() throws RecognitionException {
		QueryoptionsContext _localctx = new QueryoptionsContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_queryoptions);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(14);
			queryoption();
			setState(19);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==AMPERSAND) {
				{
				{
				setState(15);
				match(AMPERSAND);
				setState(16);
				queryoption();
				}
				}
				setState(21);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
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

	public static class QueryoptionContext extends ParserRuleContext {
		public InlinecountContext inlinecount() {
			return getRuleContext(InlinecountContext.class,0);
		}
		public Index_Context index_() {
			return getRuleContext(Index_Context.class,0);
		}
		public SchemaversionContext schemaversion() {
			return getRuleContext(SchemaversionContext.class,0);
		}
		public SkipContext skip() {
			return getRuleContext(SkipContext.class,0);
		}
		public TopContext top() {
			return getRuleContext(TopContext.class,0);
		}
		public QueryoptionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_queryoption; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterQueryoption(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitQueryoption(this);
		}
	}

	public final QueryoptionContext queryoption() throws RecognitionException {
		QueryoptionContext _localctx = new QueryoptionContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_queryoption);
		try {
			setState(27);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(22);
				inlinecount();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(23);
				index_();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(24);
				schemaversion();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(25);
				skip();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(26);
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

	public static class InlinecountContext extends ParserRuleContext {
		public TerminalNode COUNT() { return getToken(SimpleQueryOptionsParser.COUNT, 0); }
		public TerminalNode EQ() { return getToken(SimpleQueryOptionsParser.EQ, 0); }
		public TerminalNode BOOLEANVALUE() { return getToken(SimpleQueryOptionsParser.BOOLEANVALUE, 0); }
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
		public InlinecountContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_inlinecount; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterInlinecount(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitInlinecount(this);
		}
	}

	public final InlinecountContext inlinecount() throws RecognitionException {
		InlinecountContext _localctx = new InlinecountContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_inlinecount);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(30);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(29);
				match(DOLLAR);
				}
			}

			setState(32);
			match(COUNT);
			setState(33);
			match(EQ);
			setState(34);
			match(BOOLEANVALUE);
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

	public static class Index_Context extends ParserRuleContext {
		public TerminalNode INDEX() { return getToken(SimpleQueryOptionsParser.INDEX, 0); }
		public TerminalNode EQ() { return getToken(SimpleQueryOptionsParser.EQ, 0); }
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
		public TerminalNode DASH() { return getToken(SimpleQueryOptionsParser.DASH, 0); }
		public List<TerminalNode> DIGIT() { return getTokens(SimpleQueryOptionsParser.DIGIT); }
		public TerminalNode DIGIT(int i) {
			return getToken(SimpleQueryOptionsParser.DIGIT, i);
		}
		public Index_Context(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_index_; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterIndex_(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitIndex_(this);
		}
	}

	public final Index_Context index_() throws RecognitionException {
		Index_Context _localctx = new Index_Context(_ctx, getState());
		enterRule(_localctx, 6, RULE_index_);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(37);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(36);
				match(DOLLAR);
				}
			}

			setState(39);
			match(INDEX);
			setState(40);
			match(EQ);
			setState(42);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DASH) {
				{
				setState(41);
				match(DASH);
				}
			}

			setState(45); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(44);
				match(DIGIT);
				}
				}
				setState(47); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==DIGIT );
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

	public static class SchemaversionContext extends ParserRuleContext {
		public TerminalNode SCHEMAVERSION() { return getToken(SimpleQueryOptionsParser.SCHEMAVERSION, 0); }
		public TerminalNode EQ() { return getToken(SimpleQueryOptionsParser.EQ, 0); }
		public TerminalNode STAR() { return getToken(SimpleQueryOptionsParser.STAR, 0); }
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
		public List<TerminalNode> UNRESERVED() { return getTokens(SimpleQueryOptionsParser.UNRESERVED); }
		public TerminalNode UNRESERVED(int i) {
			return getToken(SimpleQueryOptionsParser.UNRESERVED, i);
		}
		public SchemaversionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_schemaversion; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterSchemaversion(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitSchemaversion(this);
		}
	}

	public final SchemaversionContext schemaversion() throws RecognitionException {
		SchemaversionContext _localctx = new SchemaversionContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_schemaversion);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(50);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(49);
				match(DOLLAR);
				}
			}

			setState(52);
			match(SCHEMAVERSION);
			setState(53);
			match(EQ);
			setState(60);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case STAR:
				{
				setState(54);
				match(STAR);
				}
				break;
			case UNRESERVED:
				{
				setState(56); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(55);
					match(UNRESERVED);
					}
					}
					setState(58); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==UNRESERVED );
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
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
		public TerminalNode SKIP_() { return getToken(SimpleQueryOptionsParser.SKIP_, 0); }
		public TerminalNode EQ() { return getToken(SimpleQueryOptionsParser.EQ, 0); }
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
		public List<TerminalNode> DIGIT() { return getTokens(SimpleQueryOptionsParser.DIGIT); }
		public TerminalNode DIGIT(int i) {
			return getToken(SimpleQueryOptionsParser.DIGIT, i);
		}
		public SkipContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_skip; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterSkip(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitSkip(this);
		}
	}

	public final SkipContext skip() throws RecognitionException {
		SkipContext _localctx = new SkipContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_skip);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(63);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(62);
				match(DOLLAR);
				}
			}

			setState(65);
			match(SKIP_);
			setState(66);
			match(EQ);
			setState(68); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(67);
				match(DIGIT);
				}
				}
				setState(70); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==DIGIT );
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
		public TerminalNode TOP() { return getToken(SimpleQueryOptionsParser.TOP, 0); }
		public TerminalNode EQ() { return getToken(SimpleQueryOptionsParser.EQ, 0); }
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
		public List<TerminalNode> DIGIT() { return getTokens(SimpleQueryOptionsParser.DIGIT); }
		public TerminalNode DIGIT(int i) {
			return getToken(SimpleQueryOptionsParser.DIGIT, i);
		}
		public TopContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_top; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterTop(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitTop(this);
		}
	}

	public final TopContext top() throws RecognitionException {
		TopContext _localctx = new TopContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_top);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(73);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(72);
				match(DOLLAR);
				}
			}

			setState(75);
			match(TOP);
			setState(76);
			match(EQ);
			setState(78); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(77);
				match(DIGIT);
				}
				}
				setState(80); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==DIGIT );
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\23U\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\3\2\3\2\3\2\7\2\24\n\2\f\2"+
		"\16\2\27\13\2\3\3\3\3\3\3\3\3\3\3\5\3\36\n\3\3\4\5\4!\n\4\3\4\3\4\3\4"+
		"\3\4\3\5\5\5(\n\5\3\5\3\5\3\5\5\5-\n\5\3\5\6\5\60\n\5\r\5\16\5\61\3\6"+
		"\5\6\65\n\6\3\6\3\6\3\6\3\6\6\6;\n\6\r\6\16\6<\5\6?\n\6\3\7\5\7B\n\7\3"+
		"\7\3\7\3\7\6\7G\n\7\r\7\16\7H\3\b\5\bL\n\b\3\b\3\b\3\b\6\bQ\n\b\r\b\16"+
		"\bR\3\b\2\2\t\2\4\6\b\n\f\16\2\2\2]\2\20\3\2\2\2\4\35\3\2\2\2\6 \3\2\2"+
		"\2\b\'\3\2\2\2\n\64\3\2\2\2\fA\3\2\2\2\16K\3\2\2\2\20\25\5\4\3\2\21\22"+
		"\7\22\2\2\22\24\5\4\3\2\23\21\3\2\2\2\24\27\3\2\2\2\25\23\3\2\2\2\25\26"+
		"\3\2\2\2\26\3\3\2\2\2\27\25\3\2\2\2\30\36\5\6\4\2\31\36\5\b\5\2\32\36"+
		"\5\n\6\2\33\36\5\f\7\2\34\36\5\16\b\2\35\30\3\2\2\2\35\31\3\2\2\2\35\32"+
		"\3\2\2\2\35\33\3\2\2\2\35\34\3\2\2\2\36\5\3\2\2\2\37!\7\17\2\2 \37\3\2"+
		"\2\2 !\3\2\2\2!\"\3\2\2\2\"#\7\6\2\2#$\7\20\2\2$%\7\5\2\2%\7\3\2\2\2&"+
		"(\7\17\2\2\'&\3\2\2\2\'(\3\2\2\2()\3\2\2\2)*\7\7\2\2*,\7\20\2\2+-\7\16"+
		"\2\2,+\3\2\2\2,-\3\2\2\2-/\3\2\2\2.\60\7\3\2\2/.\3\2\2\2\60\61\3\2\2\2"+
		"\61/\3\2\2\2\61\62\3\2\2\2\62\t\3\2\2\2\63\65\7\17\2\2\64\63\3\2\2\2\64"+
		"\65\3\2\2\2\65\66\3\2\2\2\66\67\7\b\2\2\67>\7\20\2\28?\7\21\2\29;\7\4"+
		"\2\2:9\3\2\2\2;<\3\2\2\2<:\3\2\2\2<=\3\2\2\2=?\3\2\2\2>8\3\2\2\2>:\3\2"+
		"\2\2?\13\3\2\2\2@B\7\17\2\2A@\3\2\2\2AB\3\2\2\2BC\3\2\2\2CD\7\t\2\2DF"+
		"\7\20\2\2EG\7\3\2\2FE\3\2\2\2GH\3\2\2\2HF\3\2\2\2HI\3\2\2\2I\r\3\2\2\2"+
		"JL\7\17\2\2KJ\3\2\2\2KL\3\2\2\2LM\3\2\2\2MN\7\n\2\2NP\7\20\2\2OQ\7\3\2"+
		"\2PO\3\2\2\2QR\3\2\2\2RP\3\2\2\2RS\3\2\2\2S\17\3\2\2\2\17\25\35 \',\61"+
		"\64<>AHKR";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}