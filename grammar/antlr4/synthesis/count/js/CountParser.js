// Generated from Count.g4 by ANTLR 4.8
// jshint ignore: start
var antlr4 = require('antlr4/index');
var CountListener = require('./CountListener').CountListener;
var grammarFileName = "Count.g4";


var serializedATN = ["\u0003\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964",
    "\u0003\u0007\f\u0004\u0002\t\u0002\u0003\u0002\u0005\u0002\u0006\n\u0002",
    "\u0003\u0002\u0003\u0002\u0003\u0002\u0003\u0002\u0003\u0002\u0002\u0002",
    "\u0003\u0002\u0002\u0003\u0003\u0002\u0006\u0007\u0002\u000b\u0002\u0005",
    "\u0003\u0002\u0002\u0002\u0004\u0006\u0007\u0003\u0002\u0002\u0005\u0004",
    "\u0003\u0002\u0002\u0002\u0005\u0006\u0003\u0002\u0002\u0002\u0006\u0007",
    "\u0003\u0002\u0002\u0002\u0007\b\u0007\u0005\u0002\u0002\b\t\u0007\u0004",
    "\u0002\u0002\t\n\t\u0002\u0002\u0002\n\u0003\u0003\u0002\u0002\u0002",
    "\u0003\u0005"].join("");


var atn = new antlr4.atn.ATNDeserializer().deserialize(serializedATN);

var decisionsToDFA = atn.decisionToState.map( function(ds, index) { return new antlr4.dfa.DFA(ds, index); });

var sharedContextCache = new antlr4.PredictionContextCache();

var literalNames = [ null, "'$'", "'='" ];

var symbolicNames = [ null, null, null, "Count", "True_", "False_" ];

var ruleNames =  [ "count" ];

function CountParser (input) {
	antlr4.Parser.call(this, input);
    this._interp = new antlr4.atn.ParserATNSimulator(this, atn, decisionsToDFA, sharedContextCache);
    this.ruleNames = ruleNames;
    this.literalNames = literalNames;
    this.symbolicNames = symbolicNames;
    return this;
}

CountParser.prototype = Object.create(antlr4.Parser.prototype);
CountParser.prototype.constructor = CountParser;

Object.defineProperty(CountParser.prototype, "atn", {
	get : function() {
		return atn;
	}
});

CountParser.EOF = antlr4.Token.EOF;
CountParser.T__0 = 1;
CountParser.T__1 = 2;
CountParser.Count = 3;
CountParser.True_ = 4;
CountParser.False_ = 5;

CountParser.RULE_count = 0;


function CountContext(parser, parent, invokingState) {
	if(parent===undefined) {
	    parent = null;
	}
	if(invokingState===undefined || invokingState===null) {
		invokingState = -1;
	}
	antlr4.ParserRuleContext.call(this, parent, invokingState);
    this.parser = parser;
    this.ruleIndex = CountParser.RULE_count;
    return this;
}

CountContext.prototype = Object.create(antlr4.ParserRuleContext.prototype);
CountContext.prototype.constructor = CountContext;

CountContext.prototype.Count = function() {
    return this.getToken(CountParser.Count, 0);
};

CountContext.prototype.True_ = function() {
    return this.getToken(CountParser.True_, 0);
};

CountContext.prototype.False_ = function() {
    return this.getToken(CountParser.False_, 0);
};

CountContext.prototype.enterRule = function(listener) {
    if(listener instanceof CountListener ) {
        listener.enterCount(this);
	}
};

CountContext.prototype.exitRule = function(listener) {
    if(listener instanceof CountListener ) {
        listener.exitCount(this);
	}
};




CountParser.CountContext = CountContext;

CountParser.prototype.count = function() {

    var localctx = new CountContext(this, this._ctx, this.state);
    this.enterRule(localctx, 0, CountParser.RULE_count);
    var _la = 0; // Token type
    try {
        this.enterOuterAlt(localctx, 1);
        this.state = 3;
        this._errHandler.sync(this);
        _la = this._input.LA(1);
        if(_la===CountParser.T__0) {
            this.state = 2;
            this.match(CountParser.T__0);
        }

        this.state = 5;
        this.match(CountParser.Count);
        this.state = 6;
        this.match(CountParser.T__1);
        this.state = 7;
        _la = this._input.LA(1);
        if(!(_la===CountParser.True_ || _la===CountParser.False_)) {
        this._errHandler.recoverInline(this);
        }
        else {
        	this._errHandler.reportMatch(this);
            this.consume();
        }
    } catch (re) {
    	if(re instanceof antlr4.error.RecognitionException) {
	        localctx.exception = re;
	        this._errHandler.reportError(this, re);
	        this._errHandler.recover(this, re);
	    } else {
	    	throw re;
	    }
    } finally {
        this.exitRule();
    }
    return localctx;
};


exports.CountParser = CountParser;
