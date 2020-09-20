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
		SIGNED_INTEGER=1, INTEGRAL_DIGITS=2, UNRESERVED=3, ALPHA=4, COUNT=5, INDEX=6, 
		SCHEMAVERSION=7, SKIP_=8, TOP=9, TRUE=10, FALSE=11, AMPERSAND=12, DASH=13, 
		DOLLAR=14, DOT=15, EQ=16, PLUS=17, STAR=18, TILDE=19, UNDER=20, DIGIT=21;
	public static final int
		RULE_queryoptions = 0, RULE_queryoption = 1, RULE_inlinecount = 2, RULE_index_ = 3, 
		RULE_schemaversion = 4, RULE_skip = 5, RULE_top = 6, RULE_booleanExpr = 7, 
		RULE_integralExpr = 8, RULE_signedIntExpr = 9, RULE_versionExpr = 10;
	private static String[] makeRuleNames() {
		return new String[] {
			"queryoptions", "queryoption", "inlinecount", "index_", "schemaversion", 
			"skip", "top", "booleanExpr", "integralExpr", "signedIntExpr", "versionExpr"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"'&'", "'-'", "'$'", "'.'", "'='", "'+'", "'*'", "'~'", "'_'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "SIGNED_INTEGER", "INTEGRAL_DIGITS", "UNRESERVED", "ALPHA", "COUNT", 
			"INDEX", "SCHEMAVERSION", "SKIP_", "TOP", "TRUE", "FALSE", "AMPERSAND", 
			"DASH", "DOLLAR", "DOT", "EQ", "PLUS", "STAR", "TILDE", "UNDER", "DIGIT"
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
			setState(22);
			queryoption();
			setState(27);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==AMPERSAND) {
				{
				{
				setState(23);
				match(AMPERSAND);
				setState(24);
				queryoption();
				}
				}
				setState(29);
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
			setState(35);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(30);
				inlinecount();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(31);
				index_();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(32);
				schemaversion();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(33);
				skip();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(34);
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
		public BooleanExprContext booleanExpr() {
			return getRuleContext(BooleanExprContext.class,0);
		}
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
			setState(38);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(37);
				match(DOLLAR);
				}
			}

			setState(40);
			match(COUNT);
			setState(41);
			match(EQ);
			setState(42);
			booleanExpr();
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
		public SignedIntExprContext signedIntExpr() {
			return getRuleContext(SignedIntExprContext.class,0);
		}
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
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
			setState(45);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(44);
				match(DOLLAR);
				}
			}

			setState(47);
			match(INDEX);
			setState(48);
			match(EQ);
			setState(49);
			signedIntExpr();
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
		public VersionExprContext versionExpr() {
			return getRuleContext(VersionExprContext.class,0);
		}
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
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
			setState(52);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(51);
				match(DOLLAR);
				}
			}

			setState(54);
			match(SCHEMAVERSION);
			setState(55);
			match(EQ);
			setState(56);
			versionExpr();
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
		public IntegralExprContext integralExpr() {
			return getRuleContext(IntegralExprContext.class,0);
		}
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
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
			setState(59);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(58);
				match(DOLLAR);
				}
			}

			setState(61);
			match(SKIP_);
			setState(62);
			match(EQ);
			setState(63);
			integralExpr();
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
		public IntegralExprContext integralExpr() {
			return getRuleContext(IntegralExprContext.class,0);
		}
		public TerminalNode DOLLAR() { return getToken(SimpleQueryOptionsParser.DOLLAR, 0); }
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
			setState(66);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==DOLLAR) {
				{
				setState(65);
				match(DOLLAR);
				}
			}

			setState(68);
			match(TOP);
			setState(69);
			match(EQ);
			setState(70);
			integralExpr();
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

	public static class BooleanExprContext extends ParserRuleContext {
		public TerminalNode TRUE() { return getToken(SimpleQueryOptionsParser.TRUE, 0); }
		public TerminalNode FALSE() { return getToken(SimpleQueryOptionsParser.FALSE, 0); }
		public BooleanExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_booleanExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterBooleanExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitBooleanExpr(this);
		}
	}

	public final BooleanExprContext booleanExpr() throws RecognitionException {
		BooleanExprContext _localctx = new BooleanExprContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_booleanExpr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(72);
			_la = _input.LA(1);
			if ( !(_la==TRUE || _la==FALSE) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
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

	public static class IntegralExprContext extends ParserRuleContext {
		public TerminalNode INTEGRAL_DIGITS() { return getToken(SimpleQueryOptionsParser.INTEGRAL_DIGITS, 0); }
		public IntegralExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_integralExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterIntegralExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitIntegralExpr(this);
		}
	}

	public final IntegralExprContext integralExpr() throws RecognitionException {
		IntegralExprContext _localctx = new IntegralExprContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_integralExpr);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(74);
			match(INTEGRAL_DIGITS);
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

	public static class SignedIntExprContext extends ParserRuleContext {
		public TerminalNode INTEGRAL_DIGITS() { return getToken(SimpleQueryOptionsParser.INTEGRAL_DIGITS, 0); }
		public TerminalNode SIGNED_INTEGER() { return getToken(SimpleQueryOptionsParser.SIGNED_INTEGER, 0); }
		public SignedIntExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_signedIntExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterSignedIntExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitSignedIntExpr(this);
		}
	}

	public final SignedIntExprContext signedIntExpr() throws RecognitionException {
		SignedIntExprContext _localctx = new SignedIntExprContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_signedIntExpr);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(76);
			_la = _input.LA(1);
			if ( !(_la==SIGNED_INTEGER || _la==INTEGRAL_DIGITS) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
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

	public static class VersionExprContext extends ParserRuleContext {
		public TerminalNode STAR() { return getToken(SimpleQueryOptionsParser.STAR, 0); }
		public List<TerminalNode> UNRESERVED() { return getTokens(SimpleQueryOptionsParser.UNRESERVED); }
		public TerminalNode UNRESERVED(int i) {
			return getToken(SimpleQueryOptionsParser.UNRESERVED, i);
		}
		public VersionExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_versionExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).enterVersionExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SimpleQueryOptionsListener ) ((SimpleQueryOptionsListener)listener).exitVersionExpr(this);
		}
	}

	public final VersionExprContext versionExpr() throws RecognitionException {
		VersionExprContext _localctx = new VersionExprContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_versionExpr);
		int _la;
		try {
			setState(84);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case STAR:
				enterOuterAlt(_localctx, 1);
				{
				setState(78);
				match(STAR);
				}
				break;
			case UNRESERVED:
				enterOuterAlt(_localctx, 2);
				{
				setState(80); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(79);
					match(UNRESERVED);
					}
					}
					setState(82); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==UNRESERVED );
				}
				break;
			default:
				throw new NoViableAltException(this);
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\27Y\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4"+
		"\f\t\f\3\2\3\2\3\2\7\2\34\n\2\f\2\16\2\37\13\2\3\3\3\3\3\3\3\3\3\3\5\3"+
		"&\n\3\3\4\5\4)\n\4\3\4\3\4\3\4\3\4\3\5\5\5\60\n\5\3\5\3\5\3\5\3\5\3\6"+
		"\5\6\67\n\6\3\6\3\6\3\6\3\6\3\7\5\7>\n\7\3\7\3\7\3\7\3\7\3\b\5\bE\n\b"+
		"\3\b\3\b\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\6\fS\n\f\r\f\16\fT"+
		"\5\fW\n\f\3\f\2\2\r\2\4\6\b\n\f\16\20\22\24\26\2\4\3\2\f\r\3\2\3\4\2Y"+
		"\2\30\3\2\2\2\4%\3\2\2\2\6(\3\2\2\2\b/\3\2\2\2\n\66\3\2\2\2\f=\3\2\2\2"+
		"\16D\3\2\2\2\20J\3\2\2\2\22L\3\2\2\2\24N\3\2\2\2\26V\3\2\2\2\30\35\5\4"+
		"\3\2\31\32\7\16\2\2\32\34\5\4\3\2\33\31\3\2\2\2\34\37\3\2\2\2\35\33\3"+
		"\2\2\2\35\36\3\2\2\2\36\3\3\2\2\2\37\35\3\2\2\2 &\5\6\4\2!&\5\b\5\2\""+
		"&\5\n\6\2#&\5\f\7\2$&\5\16\b\2% \3\2\2\2%!\3\2\2\2%\"\3\2\2\2%#\3\2\2"+
		"\2%$\3\2\2\2&\5\3\2\2\2\')\7\20\2\2(\'\3\2\2\2()\3\2\2\2)*\3\2\2\2*+\7"+
		"\7\2\2+,\7\22\2\2,-\5\20\t\2-\7\3\2\2\2.\60\7\20\2\2/.\3\2\2\2/\60\3\2"+
		"\2\2\60\61\3\2\2\2\61\62\7\b\2\2\62\63\7\22\2\2\63\64\5\24\13\2\64\t\3"+
		"\2\2\2\65\67\7\20\2\2\66\65\3\2\2\2\66\67\3\2\2\2\678\3\2\2\289\7\t\2"+
		"\29:\7\22\2\2:;\5\26\f\2;\13\3\2\2\2<>\7\20\2\2=<\3\2\2\2=>\3\2\2\2>?"+
		"\3\2\2\2?@\7\n\2\2@A\7\22\2\2AB\5\22\n\2B\r\3\2\2\2CE\7\20\2\2DC\3\2\2"+
		"\2DE\3\2\2\2EF\3\2\2\2FG\7\13\2\2GH\7\22\2\2HI\5\22\n\2I\17\3\2\2\2JK"+
		"\t\2\2\2K\21\3\2\2\2LM\7\4\2\2M\23\3\2\2\2NO\t\3\2\2O\25\3\2\2\2PW\7\24"+
		"\2\2QS\7\5\2\2RQ\3\2\2\2ST\3\2\2\2TR\3\2\2\2TU\3\2\2\2UW\3\2\2\2VP\3\2"+
		"\2\2VR\3\2\2\2W\27\3\2\2\2\13\35%(/\66=DTV";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}