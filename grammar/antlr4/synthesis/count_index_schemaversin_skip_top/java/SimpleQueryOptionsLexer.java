// Generated from SimpleQueryOptions.g4 by ANTLR 4.8
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SimpleQueryOptionsLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		UNRESERVED=1, BOOLEANVALUE=2, COUNT=3, INDEX=4, SCHEMAVERSION=5, SKIP_=6, 
		TOP=7, TRUE=8, FALSE=9, SIGN=10, DASH=11, DOLLAR=12, EQ=13, STAR=14, AMPERSAND=15, 
		ALPHA=16, DIGIT=17;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"UNRESERVED", "BOOLEANVALUE", "COUNT", "INDEX", "SCHEMAVERSION", "SKIP_", 
			"TOP", "TRUE", "FALSE", "SIGN", "DASH", "DOLLAR", "EQ", "STAR", "AMPERSAND", 
			"ALPHA", "DIGIT", "NON_ZERO", "ZERO", "A", "B", "C", "D", "E", "F", "G", 
			"H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", 
			"V", "W", "X", "Y", "Z"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, "'-'", 
			"'$'", "'='", "'*'", "'&'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "UNRESERVED", "BOOLEANVALUE", "COUNT", "INDEX", "SCHEMAVERSION", 
			"SKIP_", "TOP", "TRUE", "FALSE", "SIGN", "DASH", "DOLLAR", "EQ", "STAR", 
			"AMPERSAND", "ALPHA", "DIGIT"
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


	public SimpleQueryOptionsLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "SimpleQueryOptions.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\23\u00fb\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t"+
		" \4!\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t"+
		"+\4,\t,\4-\t-\4.\t.\3\2\3\2\3\2\3\2\5\2b\n\2\3\3\3\3\5\3f\n\3\3\4\3\4"+
		"\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3"+
		"\6\3\6\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3\t\3\t"+
		"\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\13\3\13\5\13\u0098\n\13\3\f\3\f"+
		"\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21\3\21\3\21\3\21\3\21\3\21\3"+
		"\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3"+
		"\21\3\21\3\21\3\21\3\21\3\21\5\21\u00be\n\21\3\22\3\22\5\22\u00c2\n\22"+
		"\3\23\3\23\3\24\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30\3\30\3\31\3\31"+
		"\3\32\3\32\3\33\3\33\3\34\3\34\3\35\3\35\3\36\3\36\3\37\3\37\3 \3 \3!"+
		"\3!\3\"\3\"\3#\3#\3$\3$\3%\3%\3&\3&\3\'\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3"+
		",\3,\3-\3-\3.\3.\2\2/\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27"+
		"\r\31\16\33\17\35\20\37\21!\22#\23%\2\'\2)\2+\2-\2/\2\61\2\63\2\65\2\67"+
		"\29\2;\2=\2?\2A\2C\2E\2G\2I\2K\2M\2O\2Q\2S\2U\2W\2Y\2[\2\3\2\37\5\2\60"+
		"\60aa\u0080\u0080\3\2\63;\3\2\62\62\4\2CCcc\4\2DDdd\4\2EEee\4\2FFff\4"+
		"\2GGgg\4\2HHhh\4\2IIii\4\2JJjj\4\2KKkk\4\2LLll\4\2MMmm\4\2NNnn\4\2OOo"+
		"o\4\2PPpp\4\2QQqq\4\2RRrr\4\2SSss\4\2TTtt\4\2UUuu\4\2VVvv\4\2WWww\4\2"+
		"XXxx\4\2YYyy\4\2ZZzz\4\2[[{{\4\2\\\\||\2\u00fd\2\3\3\2\2\2\2\5\3\2\2\2"+
		"\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3"+
		"\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2"+
		"\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\3a\3\2\2\2\5e\3\2\2"+
		"\2\7g\3\2\2\2\tm\3\2\2\2\13s\3\2\2\2\r\u0081\3\2\2\2\17\u0086\3\2\2\2"+
		"\21\u008a\3\2\2\2\23\u008f\3\2\2\2\25\u0097\3\2\2\2\27\u0099\3\2\2\2\31"+
		"\u009b\3\2\2\2\33\u009d\3\2\2\2\35\u009f\3\2\2\2\37\u00a1\3\2\2\2!\u00bd"+
		"\3\2\2\2#\u00c1\3\2\2\2%\u00c3\3\2\2\2\'\u00c5\3\2\2\2)\u00c7\3\2\2\2"+
		"+\u00c9\3\2\2\2-\u00cb\3\2\2\2/\u00cd\3\2\2\2\61\u00cf\3\2\2\2\63\u00d1"+
		"\3\2\2\2\65\u00d3\3\2\2\2\67\u00d5\3\2\2\29\u00d7\3\2\2\2;\u00d9\3\2\2"+
		"\2=\u00db\3\2\2\2?\u00dd\3\2\2\2A\u00df\3\2\2\2C\u00e1\3\2\2\2E\u00e3"+
		"\3\2\2\2G\u00e5\3\2\2\2I\u00e7\3\2\2\2K\u00e9\3\2\2\2M\u00eb\3\2\2\2O"+
		"\u00ed\3\2\2\2Q\u00ef\3\2\2\2S\u00f1\3\2\2\2U\u00f3\3\2\2\2W\u00f5\3\2"+
		"\2\2Y\u00f7\3\2\2\2[\u00f9\3\2\2\2]b\5!\21\2^b\5#\22\2_b\5\27\f\2`b\t"+
		"\2\2\2a]\3\2\2\2a^\3\2\2\2a_\3\2\2\2a`\3\2\2\2b\4\3\2\2\2cf\5\21\t\2d"+
		"f\5\23\n\2ec\3\2\2\2ed\3\2\2\2f\6\3\2\2\2gh\5-\27\2hi\5E#\2ij\5Q)\2jk"+
		"\5C\"\2kl\5O(\2l\b\3\2\2\2mn\59\35\2no\5C\"\2op\5/\30\2pq\5\61\31\2qr"+
		"\5W,\2r\n\3\2\2\2st\5M\'\2tu\5-\27\2uv\5\67\34\2vw\5\61\31\2wx\5A!\2x"+
		"y\5)\25\2yz\5S*\2z{\5\61\31\2{|\5K&\2|}\5M\'\2}~\59\35\2~\177\5E#\2\177"+
		"\u0080\5C\"\2\u0080\f\3\2\2\2\u0081\u0082\5M\'\2\u0082\u0083\5=\37\2\u0083"+
		"\u0084\59\35\2\u0084\u0085\5G$\2\u0085\16\3\2\2\2\u0086\u0087\5O(\2\u0087"+
		"\u0088\5E#\2\u0088\u0089\5G$\2\u0089\20\3\2\2\2\u008a\u008b\5O(\2\u008b"+
		"\u008c\5K&\2\u008c\u008d\5Q)\2\u008d\u008e\5\61\31\2\u008e\22\3\2\2\2"+
		"\u008f\u0090\5\63\32\2\u0090\u0091\5)\25\2\u0091\u0092\5? \2\u0092\u0093"+
		"\5M\'\2\u0093\u0094\5\61\31\2\u0094\24\3\2\2\2\u0095\u0098\7-\2\2\u0096"+
		"\u0098\5\27\f\2\u0097\u0095\3\2\2\2\u0097\u0096\3\2\2\2\u0098\26\3\2\2"+
		"\2\u0099\u009a\7/\2\2\u009a\30\3\2\2\2\u009b\u009c\7&\2\2\u009c\32\3\2"+
		"\2\2\u009d\u009e\7?\2\2\u009e\34\3\2\2\2\u009f\u00a0\7,\2\2\u00a0\36\3"+
		"\2\2\2\u00a1\u00a2\7(\2\2\u00a2 \3\2\2\2\u00a3\u00be\5)\25\2\u00a4\u00be"+
		"\5+\26\2\u00a5\u00be\5-\27\2\u00a6\u00be\5/\30\2\u00a7\u00be\5\61\31\2"+
		"\u00a8\u00be\5\63\32\2\u00a9\u00be\5\65\33\2\u00aa\u00be\5\67\34\2\u00ab"+
		"\u00be\59\35\2\u00ac\u00be\5;\36\2\u00ad\u00be\5=\37\2\u00ae\u00be\5?"+
		" \2\u00af\u00be\5A!\2\u00b0\u00be\5C\"\2\u00b1\u00be\5E#\2\u00b2\u00be"+
		"\5G$\2\u00b3\u00be\5I%\2\u00b4\u00be\5K&\2\u00b5\u00be\5M\'\2\u00b6\u00be"+
		"\5O(\2\u00b7\u00be\5Q)\2\u00b8\u00be\5S*\2\u00b9\u00be\5U+\2\u00ba\u00be"+
		"\5W,\2\u00bb\u00be\5Y-\2\u00bc\u00be\5[.\2\u00bd\u00a3\3\2\2\2\u00bd\u00a4"+
		"\3\2\2\2\u00bd\u00a5\3\2\2\2\u00bd\u00a6\3\2\2\2\u00bd\u00a7\3\2\2\2\u00bd"+
		"\u00a8\3\2\2\2\u00bd\u00a9\3\2\2\2\u00bd\u00aa\3\2\2\2\u00bd\u00ab\3\2"+
		"\2\2\u00bd\u00ac\3\2\2\2\u00bd\u00ad\3\2\2\2\u00bd\u00ae\3\2\2\2\u00bd"+
		"\u00af\3\2\2\2\u00bd\u00b0\3\2\2\2\u00bd\u00b1\3\2\2\2\u00bd\u00b2\3\2"+
		"\2\2\u00bd\u00b3\3\2\2\2\u00bd\u00b4\3\2\2\2\u00bd\u00b5\3\2\2\2\u00bd"+
		"\u00b6\3\2\2\2\u00bd\u00b7\3\2\2\2\u00bd\u00b8\3\2\2\2\u00bd\u00b9\3\2"+
		"\2\2\u00bd\u00ba\3\2\2\2\u00bd\u00bb\3\2\2\2\u00bd\u00bc\3\2\2\2\u00be"+
		"\"\3\2\2\2\u00bf\u00c2\5\'\24\2\u00c0\u00c2\5%\23\2\u00c1\u00bf\3\2\2"+
		"\2\u00c1\u00c0\3\2\2\2\u00c2$\3\2\2\2\u00c3\u00c4\t\3\2\2\u00c4&\3\2\2"+
		"\2\u00c5\u00c6\t\4\2\2\u00c6(\3\2\2\2\u00c7\u00c8\t\5\2\2\u00c8*\3\2\2"+
		"\2\u00c9\u00ca\t\6\2\2\u00ca,\3\2\2\2\u00cb\u00cc\t\7\2\2\u00cc.\3\2\2"+
		"\2\u00cd\u00ce\t\b\2\2\u00ce\60\3\2\2\2\u00cf\u00d0\t\t\2\2\u00d0\62\3"+
		"\2\2\2\u00d1\u00d2\t\n\2\2\u00d2\64\3\2\2\2\u00d3\u00d4\t\13\2\2\u00d4"+
		"\66\3\2\2\2\u00d5\u00d6\t\f\2\2\u00d68\3\2\2\2\u00d7\u00d8\t\r\2\2\u00d8"+
		":\3\2\2\2\u00d9\u00da\t\16\2\2\u00da<\3\2\2\2\u00db\u00dc\t\17\2\2\u00dc"+
		">\3\2\2\2\u00dd\u00de\t\20\2\2\u00de@\3\2\2\2\u00df\u00e0\t\21\2\2\u00e0"+
		"B\3\2\2\2\u00e1\u00e2\t\22\2\2\u00e2D\3\2\2\2\u00e3\u00e4\t\23\2\2\u00e4"+
		"F\3\2\2\2\u00e5\u00e6\t\24\2\2\u00e6H\3\2\2\2\u00e7\u00e8\t\25\2\2\u00e8"+
		"J\3\2\2\2\u00e9\u00ea\t\26\2\2\u00eaL\3\2\2\2\u00eb\u00ec\t\27\2\2\u00ec"+
		"N\3\2\2\2\u00ed\u00ee\t\30\2\2\u00eeP\3\2\2\2\u00ef\u00f0\t\31\2\2\u00f0"+
		"R\3\2\2\2\u00f1\u00f2\t\32\2\2\u00f2T\3\2\2\2\u00f3\u00f4\t\33\2\2\u00f4"+
		"V\3\2\2\2\u00f5\u00f6\t\34\2\2\u00f6X\3\2\2\2\u00f7\u00f8\t\35\2\2\u00f8"+
		"Z\3\2\2\2\u00f9\u00fa\t\36\2\2\u00fa\\\3\2\2\2\b\2ae\u0097\u00bd\u00c1"+
		"\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}