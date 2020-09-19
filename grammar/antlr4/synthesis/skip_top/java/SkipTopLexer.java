// Generated from SkipTop.g4 by ANTLR 4.8
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class SkipTopLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, Skip=3, Top=4, INTEGER=5;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "Skip", "Top", "INTEGER", "I", "K", "O", "P", "S", "T", 
			"DIGIT", "NON_ZERO", "ZERO"
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


	public SkipTopLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "SkipTop.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\7I\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\3\2\3\2\3\3\3\3\3\4\3\4\3\4\3"+
		"\4\3\4\3\5\3\5\3\5\3\5\3\6\3\6\3\6\6\6\60\n\6\r\6\16\6\61\5\6\64\n\6\3"+
		"\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\r\3\r\5\rD\n\r\3\16"+
		"\3\16\3\17\3\17\2\2\20\3\3\5\4\7\5\t\6\13\7\r\2\17\2\21\2\23\2\25\2\27"+
		"\2\31\2\33\2\35\2\3\2\n\4\2KKkk\4\2MMmm\4\2QQqq\4\2RRrr\4\2UUuu\4\2VV"+
		"vv\3\2\63;\3\2\62\62\2B\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2"+
		"\2\2\13\3\2\2\2\3\37\3\2\2\2\5!\3\2\2\2\7#\3\2\2\2\t(\3\2\2\2\13\63\3"+
		"\2\2\2\r\65\3\2\2\2\17\67\3\2\2\2\219\3\2\2\2\23;\3\2\2\2\25=\3\2\2\2"+
		"\27?\3\2\2\2\31C\3\2\2\2\33E\3\2\2\2\35G\3\2\2\2\37 \7&\2\2 \4\3\2\2\2"+
		"!\"\7?\2\2\"\6\3\2\2\2#$\5\25\13\2$%\5\17\b\2%&\5\r\7\2&\'\5\23\n\2\'"+
		"\b\3\2\2\2()\5\27\f\2)*\5\21\t\2*+\5\23\n\2+\n\3\2\2\2,\64\5\31\r\2-/"+
		"\5\33\16\2.\60\5\31\r\2/.\3\2\2\2\60\61\3\2\2\2\61/\3\2\2\2\61\62\3\2"+
		"\2\2\62\64\3\2\2\2\63,\3\2\2\2\63-\3\2\2\2\64\f\3\2\2\2\65\66\t\2\2\2"+
		"\66\16\3\2\2\2\678\t\3\2\28\20\3\2\2\29:\t\4\2\2:\22\3\2\2\2;<\t\5\2\2"+
		"<\24\3\2\2\2=>\t\6\2\2>\26\3\2\2\2?@\t\7\2\2@\30\3\2\2\2AD\5\35\17\2B"+
		"D\5\33\16\2CA\3\2\2\2CB\3\2\2\2D\32\3\2\2\2EF\t\b\2\2F\34\3\2\2\2GH\t"+
		"\t\2\2H\36\3\2\2\2\6\2\61\63C\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}