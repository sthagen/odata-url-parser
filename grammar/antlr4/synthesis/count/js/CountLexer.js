// Generated from Count.g4 by ANTLR 4.8
// jshint ignore: start
var antlr4 = require('antlr4/index');



var serializedATN = ["\u0003\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964",
    "\u0002\u0007N\b\u0001\u0004\u0002\t\u0002\u0004\u0003\t\u0003\u0004",
    "\u0004\t\u0004\u0004\u0005\t\u0005\u0004\u0006\t\u0006\u0004\u0007\t",
    "\u0007\u0004\b\t\b\u0004\t\t\t\u0004\n\t\n\u0004\u000b\t\u000b\u0004",
    "\f\t\f\u0004\r\t\r\u0004\u000e\t\u000e\u0004\u000f\t\u000f\u0004\u0010",
    "\t\u0010\u0004\u0011\t\u0011\u0003\u0002\u0003\u0002\u0003\u0003\u0003",
    "\u0003\u0003\u0004\u0003\u0004\u0003\u0004\u0003\u0004\u0003\u0004\u0003",
    "\u0004\u0003\u0005\u0003\u0005\u0003\u0005\u0003\u0005\u0003\u0005\u0003",
    "\u0006\u0003\u0006\u0003\u0006\u0003\u0006\u0003\u0006\u0003\u0006\u0003",
    "\u0007\u0003\u0007\u0003\b\u0003\b\u0003\t\u0003\t\u0003\n\u0003\n\u0003",
    "\u000b\u0003\u000b\u0003\f\u0003\f\u0003\r\u0003\r\u0003\u000e\u0003",
    "\u000e\u0003\u000f\u0003\u000f\u0003\u0010\u0003\u0010\u0003\u0011\u0003",
    "\u0011\u0002\u0002\u0012\u0003\u0003\u0005\u0004\u0007\u0005\t\u0006",
    "\u000b\u0007\r\u0002\u000f\u0002\u0011\u0002\u0013\u0002\u0015\u0002",
    "\u0017\u0002\u0019\u0002\u001b\u0002\u001d\u0002\u001f\u0002!\u0002",
    "\u0003\u0002\r\u0004\u0002CCcc\u0004\u0002EEee\u0004\u0002GGgg\u0004",
    "\u0002HHhh\u0004\u0002NNnn\u0004\u0002PPpp\u0004\u0002QQqq\u0004\u0002",
    "TTtt\u0004\u0002UUuu\u0004\u0002VVvv\u0004\u0002WWww\u0002B\u0002\u0003",
    "\u0003\u0002\u0002\u0002\u0002\u0005\u0003\u0002\u0002\u0002\u0002\u0007",
    "\u0003\u0002\u0002\u0002\u0002\t\u0003\u0002\u0002\u0002\u0002\u000b",
    "\u0003\u0002\u0002\u0002\u0003#\u0003\u0002\u0002\u0002\u0005%\u0003",
    "\u0002\u0002\u0002\u0007\'\u0003\u0002\u0002\u0002\t-\u0003\u0002\u0002",
    "\u0002\u000b2\u0003\u0002\u0002\u0002\r8\u0003\u0002\u0002\u0002\u000f",
    ":\u0003\u0002\u0002\u0002\u0011<\u0003\u0002\u0002\u0002\u0013>\u0003",
    "\u0002\u0002\u0002\u0015@\u0003\u0002\u0002\u0002\u0017B\u0003\u0002",
    "\u0002\u0002\u0019D\u0003\u0002\u0002\u0002\u001bF\u0003\u0002\u0002",
    "\u0002\u001dH\u0003\u0002\u0002\u0002\u001fJ\u0003\u0002\u0002\u0002",
    "!L\u0003\u0002\u0002\u0002#$\u0007&\u0002\u0002$\u0004\u0003\u0002\u0002",
    "\u0002%&\u0007?\u0002\u0002&\u0006\u0003\u0002\u0002\u0002\'(\u0005",
    "\u000f\b\u0002()\u0005\u0019\r\u0002)*\u0005!\u0011\u0002*+\u0005\u0017",
    "\f\u0002+,\u0005\u001f\u0010\u0002,\b\u0003\u0002\u0002\u0002-.\u0005",
    "\u001f\u0010\u0002./\u0005\u001b\u000e\u0002/0\u0005!\u0011\u000201",
    "\u0005\u0011\t\u00021\n\u0003\u0002\u0002\u000223\u0005\u0013\n\u0002",
    "34\u0005\r\u0007\u000245\u0005\u0015\u000b\u000256\u0005\u001d\u000f",
    "\u000267\u0005\u0011\t\u00027\f\u0003\u0002\u0002\u000289\t\u0002\u0002",
    "\u00029\u000e\u0003\u0002\u0002\u0002:;\t\u0003\u0002\u0002;\u0010\u0003",
    "\u0002\u0002\u0002<=\t\u0004\u0002\u0002=\u0012\u0003\u0002\u0002\u0002",
    ">?\t\u0005\u0002\u0002?\u0014\u0003\u0002\u0002\u0002@A\t\u0006\u0002",
    "\u0002A\u0016\u0003\u0002\u0002\u0002BC\t\u0007\u0002\u0002C\u0018\u0003",
    "\u0002\u0002\u0002DE\t\b\u0002\u0002E\u001a\u0003\u0002\u0002\u0002",
    "FG\t\t\u0002\u0002G\u001c\u0003\u0002\u0002\u0002HI\t\n\u0002\u0002",
    "I\u001e\u0003\u0002\u0002\u0002JK\t\u000b\u0002\u0002K \u0003\u0002",
    "\u0002\u0002LM\t\f\u0002\u0002M\"\u0003\u0002\u0002\u0002\u0003\u0002",
    "\u0002"].join("");


var atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

var decisionsToDFA = atn.decisionToState.map( function(ds, index) { return new antlr4.dfa.DFA(ds, index); });

function CountLexer(input) {
	antlr4.Lexer.call(this, input);
    this._interp = new antlr4.atn.LexerATNSimulator(this, atn, decisionsToDFA, new antlr4.PredictionContextCache());
    return this;
}

CountLexer.prototype = Object.create(antlr4.Lexer.prototype);
CountLexer.prototype.constructor = CountLexer;

Object.defineProperty(CountLexer.prototype, "atn", {
        get : function() {
                return atn;
        }
});

CountLexer.EOF = antlr4.Token.EOF;
CountLexer.T__0 = 1;
CountLexer.T__1 = 2;
CountLexer.Count = 3;
CountLexer.True_ = 4;
CountLexer.False_ = 5;

CountLexer.prototype.channelNames = [ "DEFAULT_TOKEN_CHANNEL", "HIDDEN" ];

CountLexer.prototype.modeNames = [ "DEFAULT_MODE" ];

CountLexer.prototype.literalNames = [ null, "'$'", "'='" ];

CountLexer.prototype.symbolicNames = [ null, null, null, "Count", "True_", 
                                       "False_" ];

CountLexer.prototype.ruleNames = [ "T__0", "T__1", "Count", "True_", "False_", 
                                   "A", "C", "E", "F", "L", "N", "O", "R", 
                                   "S", "T", "U" ];

CountLexer.prototype.grammarFileName = "Count.g4";


exports.CountLexer = CountLexer;

