// Generated from Index.g4 by ANTLR 4.8
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class IndexLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, Index=4, INTEGER=5;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "Index", "INTEGER", "D", "E", "I", "N", "X", 
			"DIGIT", "NON_ZERO", "ZERO"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'$'", "'='", "'-'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, "Index", "INTEGER"
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


	public IndexLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "Index.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7D\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\3\2\3\2\3\3\3\3\3\4\3\4\3\5\3\5\3\5\3\5"+
		"\3\5\3\5\3\6\3\6\3\6\6\6-\n\6\r\6\16\6.\5\6\61\n\6\3\7\3\7\3\b\3\b\3\t"+
		"\3\t\3\n\3\n\3\13\3\13\3\f\3\f\5\f?\n\f\3\r\3\r\3\16\3\16\2\2\17\3\3\5"+
		"\4\7\5\t\6\13\7\r\2\17\2\21\2\23\2\25\2\27\2\31\2\33\2\3\2\t\4\2FFff\4"+
		"\2GGgg\4\2KKkk\4\2PPpp\4\2ZZzz\3\2\63;\3\2\62\62\2>\2\3\3\2\2\2\2\5\3"+
		"\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\3\35\3\2\2\2\5\37\3\2\2\2"+
		"\7!\3\2\2\2\t#\3\2\2\2\13\60\3\2\2\2\r\62\3\2\2\2\17\64\3\2\2\2\21\66"+
		"\3\2\2\2\238\3\2\2\2\25:\3\2\2\2\27>\3\2\2\2\31@\3\2\2\2\33B\3\2\2\2\35"+
		"\36\7&\2\2\36\4\3\2\2\2\37 \7?\2\2 \6\3\2\2\2!\"\7/\2\2\"\b\3\2\2\2#$"+
		"\5\21\t\2$%\5\23\n\2%&\5\r\7\2&\'\5\17\b\2\'(\5\25\13\2(\n\3\2\2\2)\61"+
		"\5\27\f\2*,\5\31\r\2+-\5\27\f\2,+\3\2\2\2-.\3\2\2\2.,\3\2\2\2./\3\2\2"+
		"\2/\61\3\2\2\2\60)\3\2\2\2\60*\3\2\2\2\61\f\3\2\2\2\62\63\t\2\2\2\63\16"+
		"\3\2\2\2\64\65\t\3\2\2\65\20\3\2\2\2\66\67\t\4\2\2\67\22\3\2\2\289\t\5"+
		"\2\29\24\3\2\2\2:;\t\6\2\2;\26\3\2\2\2<?\5\33\16\2=?\5\31\r\2><\3\2\2"+
		"\2>=\3\2\2\2?\30\3\2\2\2@A\t\7\2\2A\32\3\2\2\2BC\t\b\2\2C\34\3\2\2\2\6"+
		"\2.\60>\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}