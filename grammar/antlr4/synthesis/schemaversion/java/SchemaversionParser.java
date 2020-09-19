// Generated from Schemaversion.g4 by ANTLR 4.8
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SchemaversionParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, Schemaversion=4, Unreserved=5, Alpha=6, Digit=7;
	public static final int
		RULE_schemaversion = 0;
	private static String[] makeRuleNames() {
		return new String[] {
			"schemaversion"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'$'", "'='", "'*'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, "Schemaversion", "Unreserved", "Alpha", "Digit"
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
	public String getGrammarFileName() { return "Schemaversion.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public SchemaversionParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class SchemaversionContext extends ParserRuleContext {
		public TerminalNode Schemaversion() { return getToken(SchemaversionParser.Schemaversion, 0); }
		public List<TerminalNode> Unreserved() { return getTokens(SchemaversionParser.Unreserved); }
		public TerminalNode Unreserved(int i) {
			return getToken(SchemaversionParser.Unreserved, i);
		}
		public SchemaversionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_schemaversion; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof SchemaversionListener ) ((SchemaversionListener)listener).enterSchemaversion(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof SchemaversionListener ) ((SchemaversionListener)listener).exitSchemaversion(this);
		}
	}

	public final SchemaversionContext schemaversion() throws RecognitionException {
		SchemaversionContext _localctx = new SchemaversionContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_schemaversion);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(3);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__0) {
				{
				setState(2);
				match(T__0);
				}
			}

			setState(5);
			match(Schemaversion);
			setState(6);
			match(T__1);
			setState(13);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__2:
				{
				setState(7);
				match(T__2);
				}
				break;
			case Unreserved:
				{
				setState(9); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(8);
					match(Unreserved);
					}
					}
					setState(11); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==Unreserved );
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

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\t\22\4\2\t\2\3\2"+
		"\5\2\6\n\2\3\2\3\2\3\2\3\2\6\2\f\n\2\r\2\16\2\r\5\2\20\n\2\3\2\2\2\3\2"+
		"\2\2\2\23\2\5\3\2\2\2\4\6\7\3\2\2\5\4\3\2\2\2\5\6\3\2\2\2\6\7\3\2\2\2"+
		"\7\b\7\6\2\2\b\17\7\4\2\2\t\20\7\5\2\2\n\f\7\7\2\2\13\n\3\2\2\2\f\r\3"+
		"\2\2\2\r\13\3\2\2\2\r\16\3\2\2\2\16\20\3\2\2\2\17\t\3\2\2\2\17\13\3\2"+
		"\2\2\20\3\3\2\2\2\5\5\r\17";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}