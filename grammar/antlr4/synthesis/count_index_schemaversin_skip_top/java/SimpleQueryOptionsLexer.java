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
		SIGNED_INTEGER=1, INTEGRAL_DIGITS=2, UNRESERVED=3, ALPHA=4, COUNT=5, INDEX=6, 
		SCHEMAVERSION=7, SKIP_=8, TOP=9, TRUE=10, FALSE=11, AMPERSAND=12, DASH=13, 
		DOLLAR=14, DOT=15, EQ=16, PLUS=17, STAR=18, TILDE=19, UNDER=20, DIGIT=21;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"SIGNED_INTEGER", "INTEGRAL_DIGITS", "UNRESERVED", "ALPHA", "COUNT", 
			"INDEX", "SCHEMAVERSION", "SKIP_", "TOP", "TRUE", "FALSE", "AMPERSAND", 
			"DASH", "DOLLAR", "DOT", "EQ", "PLUS", "STAR", "TILDE", "UNDER", "DIGIT", 
			"NON_ZERO", "ZERO", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
			"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", 
			"Y", "Z"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\27\u0113\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t"+
		" \4!\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t"+
		"+\4,\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\3\2\3\2\5\2h\n"+
		"\2\3\2\6\2k\n\2\r\2\16\2l\3\3\6\3p\n\3\r\3\16\3q\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\5\4z\n\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u0096\n\5\3\6\3\6\3"+
		"\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3\b\3\b\3\b"+
		"\3\b\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\13\3\13"+
		"\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17\3"+
		"\20\3\20\3\21\3\21\3\22\3\22\3\23\3\23\3\24\3\24\3\25\3\25\3\26\3\26\5"+
		"\26\u00da\n\26\3\27\3\27\3\30\3\30\3\31\3\31\3\32\3\32\3\33\3\33\3\34"+
		"\3\34\3\35\3\35\3\36\3\36\3\37\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#\3$\3$\3"+
		"%\3%\3&\3&\3\'\3\'\3(\3(\3)\3)\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3/\3/\3\60"+
		"\3\60\3\61\3\61\3\62\3\62\2\2\63\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23"+
		"\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\2/\2\61"+
		"\2\63\2\65\2\67\29\2;\2=\2?\2A\2C\2E\2G\2I\2K\2M\2O\2Q\2S\2U\2W\2Y\2["+
		"\2]\2_\2a\2c\2\3\2\36\3\2\63;\3\2\62\62\4\2CCcc\4\2DDdd\4\2EEee\4\2FF"+
		"ff\4\2GGgg\4\2HHhh\4\2IIii\4\2JJjj\4\2KKkk\4\2LLll\4\2MMmm\4\2NNnn\4\2"+
		"OOoo\4\2PPpp\4\2QQqq\4\2RRrr\4\2SSss\4\2TTtt\4\2UUuu\4\2VVvv\4\2WWww\4"+
		"\2XXxx\4\2YYyy\4\2ZZzz\4\2[[{{\4\2\\\\||\2\u0118\2\3\3\2\2\2\2\5\3\2\2"+
		"\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21"+
		"\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2"+
		"\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3"+
		"\2\2\2\2)\3\2\2\2\2+\3\2\2\2\3g\3\2\2\2\5o\3\2\2\2\7y\3\2\2\2\t\u0095"+
		"\3\2\2\2\13\u0097\3\2\2\2\r\u009d\3\2\2\2\17\u00a3\3\2\2\2\21\u00b1\3"+
		"\2\2\2\23\u00b6\3\2\2\2\25\u00ba\3\2\2\2\27\u00bf\3\2\2\2\31\u00c5\3\2"+
		"\2\2\33\u00c7\3\2\2\2\35\u00c9\3\2\2\2\37\u00cb\3\2\2\2!\u00cd\3\2\2\2"+
		"#\u00cf\3\2\2\2%\u00d1\3\2\2\2\'\u00d3\3\2\2\2)\u00d5\3\2\2\2+\u00d9\3"+
		"\2\2\2-\u00db\3\2\2\2/\u00dd\3\2\2\2\61\u00df\3\2\2\2\63\u00e1\3\2\2\2"+
		"\65\u00e3\3\2\2\2\67\u00e5\3\2\2\29\u00e7\3\2\2\2;\u00e9\3\2\2\2=\u00eb"+
		"\3\2\2\2?\u00ed\3\2\2\2A\u00ef\3\2\2\2C\u00f1\3\2\2\2E\u00f3\3\2\2\2G"+
		"\u00f5\3\2\2\2I\u00f7\3\2\2\2K\u00f9\3\2\2\2M\u00fb\3\2\2\2O\u00fd\3\2"+
		"\2\2Q\u00ff\3\2\2\2S\u0101\3\2\2\2U\u0103\3\2\2\2W\u0105\3\2\2\2Y\u0107"+
		"\3\2\2\2[\u0109\3\2\2\2]\u010b\3\2\2\2_\u010d\3\2\2\2a\u010f\3\2\2\2c"+
		"\u0111\3\2\2\2eh\5#\22\2fh\5\33\16\2ge\3\2\2\2gf\3\2\2\2hj\3\2\2\2ik\5"+
		"+\26\2ji\3\2\2\2kl\3\2\2\2lj\3\2\2\2lm\3\2\2\2m\4\3\2\2\2np\5+\26\2on"+
		"\3\2\2\2pq\3\2\2\2qo\3\2\2\2qr\3\2\2\2r\6\3\2\2\2sz\5\t\5\2tz\5+\26\2"+
		"uz\5\33\16\2vz\5\37\20\2wz\5)\25\2xz\5\'\24\2ys\3\2\2\2yt\3\2\2\2yu\3"+
		"\2\2\2yv\3\2\2\2yw\3\2\2\2yx\3\2\2\2z\b\3\2\2\2{\u0096\5\61\31\2|\u0096"+
		"\5\63\32\2}\u0096\5\65\33\2~\u0096\5\67\34\2\177\u0096\59\35\2\u0080\u0096"+
		"\5;\36\2\u0081\u0096\5=\37\2\u0082\u0096\5? \2\u0083\u0096\5A!\2\u0084"+
		"\u0096\5C\"\2\u0085\u0096\5E#\2\u0086\u0096\5G$\2\u0087\u0096\5I%\2\u0088"+
		"\u0096\5K&\2\u0089\u0096\5M\'\2\u008a\u0096\5O(\2\u008b\u0096\5Q)\2\u008c"+
		"\u0096\5S*\2\u008d\u0096\5U+\2\u008e\u0096\5W,\2\u008f\u0096\5Y-\2\u0090"+
		"\u0096\5[.\2\u0091\u0096\5]/\2\u0092\u0096\5_\60\2\u0093\u0096\5a\61\2"+
		"\u0094\u0096\5c\62\2\u0095{\3\2\2\2\u0095|\3\2\2\2\u0095}\3\2\2\2\u0095"+
		"~\3\2\2\2\u0095\177\3\2\2\2\u0095\u0080\3\2\2\2\u0095\u0081\3\2\2\2\u0095"+
		"\u0082\3\2\2\2\u0095\u0083\3\2\2\2\u0095\u0084\3\2\2\2\u0095\u0085\3\2"+
		"\2\2\u0095\u0086\3\2\2\2\u0095\u0087\3\2\2\2\u0095\u0088\3\2\2\2\u0095"+
		"\u0089\3\2\2\2\u0095\u008a\3\2\2\2\u0095\u008b\3\2\2\2\u0095\u008c\3\2"+
		"\2\2\u0095\u008d\3\2\2\2\u0095\u008e\3\2\2\2\u0095\u008f\3\2\2\2\u0095"+
		"\u0090\3\2\2\2\u0095\u0091\3\2\2\2\u0095\u0092\3\2\2\2\u0095\u0093\3\2"+
		"\2\2\u0095\u0094\3\2\2\2\u0096\n\3\2\2\2\u0097\u0098\5\65\33\2\u0098\u0099"+
		"\5M\'\2\u0099\u009a\5Y-\2\u009a\u009b\5K&\2\u009b\u009c\5W,\2\u009c\f"+
		"\3\2\2\2\u009d\u009e\5A!\2\u009e\u009f\5K&\2\u009f\u00a0\5\67\34\2\u00a0"+
		"\u00a1\59\35\2\u00a1\u00a2\5_\60\2\u00a2\16\3\2\2\2\u00a3\u00a4\5U+\2"+
		"\u00a4\u00a5\5\65\33\2\u00a5\u00a6\5? \2\u00a6\u00a7\59\35\2\u00a7\u00a8"+
		"\5I%\2\u00a8\u00a9\5\61\31\2\u00a9\u00aa\5[.\2\u00aa\u00ab\59\35\2\u00ab"+
		"\u00ac\5S*\2\u00ac\u00ad\5U+\2\u00ad\u00ae\5A!\2\u00ae\u00af\5M\'\2\u00af"+
		"\u00b0\5K&\2\u00b0\20\3\2\2\2\u00b1\u00b2\5U+\2\u00b2\u00b3\5E#\2\u00b3"+
		"\u00b4\5A!\2\u00b4\u00b5\5O(\2\u00b5\22\3\2\2\2\u00b6\u00b7\5W,\2\u00b7"+
		"\u00b8\5M\'\2\u00b8\u00b9\5O(\2\u00b9\24\3\2\2\2\u00ba\u00bb\5W,\2\u00bb"+
		"\u00bc\5S*\2\u00bc\u00bd\5Y-\2\u00bd\u00be\59\35\2\u00be\26\3\2\2\2\u00bf"+
		"\u00c0\5;\36\2\u00c0\u00c1\5\61\31\2\u00c1\u00c2\5G$\2\u00c2\u00c3\5U"+
		"+\2\u00c3\u00c4\59\35\2\u00c4\30\3\2\2\2\u00c5\u00c6\7(\2\2\u00c6\32\3"+
		"\2\2\2\u00c7\u00c8\7/\2\2\u00c8\34\3\2\2\2\u00c9\u00ca\7&\2\2\u00ca\36"+
		"\3\2\2\2\u00cb\u00cc\7\60\2\2\u00cc \3\2\2\2\u00cd\u00ce\7?\2\2\u00ce"+
		"\"\3\2\2\2\u00cf\u00d0\7-\2\2\u00d0$\3\2\2\2\u00d1\u00d2\7,\2\2\u00d2"+
		"&\3\2\2\2\u00d3\u00d4\7\u0080\2\2\u00d4(\3\2\2\2\u00d5\u00d6\7a\2\2\u00d6"+
		"*\3\2\2\2\u00d7\u00da\5/\30\2\u00d8\u00da\5-\27\2\u00d9\u00d7\3\2\2\2"+
		"\u00d9\u00d8\3\2\2\2\u00da,\3\2\2\2\u00db\u00dc\t\2\2\2\u00dc.\3\2\2\2"+
		"\u00dd\u00de\t\3\2\2\u00de\60\3\2\2\2\u00df\u00e0\t\4\2\2\u00e0\62\3\2"+
		"\2\2\u00e1\u00e2\t\5\2\2\u00e2\64\3\2\2\2\u00e3\u00e4\t\6\2\2\u00e4\66"+
		"\3\2\2\2\u00e5\u00e6\t\7\2\2\u00e68\3\2\2\2\u00e7\u00e8\t\b\2\2\u00e8"+
		":\3\2\2\2\u00e9\u00ea\t\t\2\2\u00ea<\3\2\2\2\u00eb\u00ec\t\n\2\2\u00ec"+
		">\3\2\2\2\u00ed\u00ee\t\13\2\2\u00ee@\3\2\2\2\u00ef\u00f0\t\f\2\2\u00f0"+
		"B\3\2\2\2\u00f1\u00f2\t\r\2\2\u00f2D\3\2\2\2\u00f3\u00f4\t\16\2\2\u00f4"+
		"F\3\2\2\2\u00f5\u00f6\t\17\2\2\u00f6H\3\2\2\2\u00f7\u00f8\t\20\2\2\u00f8"+
		"J\3\2\2\2\u00f9\u00fa\t\21\2\2\u00faL\3\2\2\2\u00fb\u00fc\t\22\2\2\u00fc"+
		"N\3\2\2\2\u00fd\u00fe\t\23\2\2\u00feP\3\2\2\2\u00ff\u0100\t\24\2\2\u0100"+
		"R\3\2\2\2\u0101\u0102\t\25\2\2\u0102T\3\2\2\2\u0103\u0104\t\26\2\2\u0104"+
		"V\3\2\2\2\u0105\u0106\t\27\2\2\u0106X\3\2\2\2\u0107\u0108\t\30\2\2\u0108"+
		"Z\3\2\2\2\u0109\u010a\t\31\2\2\u010a\\\3\2\2\2\u010b\u010c\t\32\2\2\u010c"+
		"^\3\2\2\2\u010d\u010e\t\33\2\2\u010e`\3\2\2\2\u010f\u0110\t\34\2\2\u0110"+
		"b\3\2\2\2\u0111\u0112\t\35\2\2\u0112d\3\2\2\2\t\2glqy\u0095\u00d9\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}