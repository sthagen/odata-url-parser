
// Generated from Count.g4 by ANTLR 4.8


#include "CountListener.h"

#include "CountParser.h"


using namespace antlrcpp;
using namespace antlr4;

CountParser::CountParser(TokenStream *input) : Parser(input) {
  _interpreter = new atn::ParserATNSimulator(this, _atn, _decisionToDFA, _sharedContextCache);
}

CountParser::~CountParser() {
  delete _interpreter;
}

std::string CountParser::getGrammarFileName() const {
  return "Count.g4";
}

const std::vector<std::string>& CountParser::getRuleNames() const {
  return _ruleNames;
}

dfa::Vocabulary& CountParser::getVocabulary() const {
  return _vocabulary;
}


//----------------- CountContext ------------------------------------------------------------------

CountParser::CountContext::CountContext(ParserRuleContext *parent, size_t invokingState)
  : ParserRuleContext(parent, invokingState) {
}

tree::TerminalNode* CountParser::CountContext::Count() {
  return getToken(CountParser::Count, 0);
}

tree::TerminalNode* CountParser::CountContext::True_() {
  return getToken(CountParser::True_, 0);
}

tree::TerminalNode* CountParser::CountContext::False_() {
  return getToken(CountParser::False_, 0);
}


size_t CountParser::CountContext::getRuleIndex() const {
  return CountParser::RuleCount;
}

void CountParser::CountContext::enterRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<CountListener *>(listener);
  if (parserListener != nullptr)
    parserListener->enterCount(this);
}

void CountParser::CountContext::exitRule(tree::ParseTreeListener *listener) {
  auto parserListener = dynamic_cast<CountListener *>(listener);
  if (parserListener != nullptr)
    parserListener->exitCount(this);
}

CountParser::CountContext* CountParser::count() {
  CountContext *_localctx = _tracker.createInstance<CountContext>(_ctx, getState());
  enterRule(_localctx, 0, CountParser::RuleCount);
  size_t _la = 0;

  auto onExit = finally([=] {
    exitRule();
  });
  try {
    enterOuterAlt(_localctx, 1);
    setState(3);
    _errHandler->sync(this);

    _la = _input->LA(1);
    if (_la == CountParser::T__0) {
      setState(2);
      match(CountParser::T__0);
    }
    setState(5);
    match(CountParser::Count);
    setState(6);
    match(CountParser::T__1);
    setState(7);
    _la = _input->LA(1);
    if (!(_la == CountParser::True_

    || _la == CountParser::False_)) {
    _errHandler->recoverInline(this);
    }
    else {
      _errHandler->reportMatch(this);
      consume();
    }
   
  }
  catch (RecognitionException &e) {
    _errHandler->reportError(this, e);
    _localctx->exception = std::current_exception();
    _errHandler->recover(this, _localctx->exception);
  }

  return _localctx;
}

// Static vars and initialization.
std::vector<dfa::DFA> CountParser::_decisionToDFA;
atn::PredictionContextCache CountParser::_sharedContextCache;

// We own the ATN which in turn owns the ATN states.
atn::ATN CountParser::_atn;
std::vector<uint16_t> CountParser::_serializedATN;

std::vector<std::string> CountParser::_ruleNames = {
  "count"
};

std::vector<std::string> CountParser::_literalNames = {
  "", "'$'", "'='"
};

std::vector<std::string> CountParser::_symbolicNames = {
  "", "", "", "Count", "True_", "False_"
};

dfa::Vocabulary CountParser::_vocabulary(_literalNames, _symbolicNames);

std::vector<std::string> CountParser::_tokenNames;

CountParser::Initializer::Initializer() {
	for (size_t i = 0; i < _symbolicNames.size(); ++i) {
		std::string name = _vocabulary.getLiteralName(i);
		if (name.empty()) {
			name = _vocabulary.getSymbolicName(i);
		}

		if (name.empty()) {
			_tokenNames.push_back("<INVALID>");
		} else {
      _tokenNames.push_back(name);
    }
	}

  _serializedATN = {
    0x3, 0x608b, 0xa72a, 0x8133, 0xb9ed, 0x417c, 0x3be7, 0x7786, 0x5964, 
    0x3, 0x7, 0xc, 0x4, 0x2, 0x9, 0x2, 0x3, 0x2, 0x5, 0x2, 0x6, 0xa, 0x2, 
    0x3, 0x2, 0x3, 0x2, 0x3, 0x2, 0x3, 0x2, 0x3, 0x2, 0x2, 0x2, 0x3, 0x2, 
    0x2, 0x3, 0x3, 0x2, 0x6, 0x7, 0x2, 0xb, 0x2, 0x5, 0x3, 0x2, 0x2, 0x2, 
    0x4, 0x6, 0x7, 0x3, 0x2, 0x2, 0x5, 0x4, 0x3, 0x2, 0x2, 0x2, 0x5, 0x6, 
    0x3, 0x2, 0x2, 0x2, 0x6, 0x7, 0x3, 0x2, 0x2, 0x2, 0x7, 0x8, 0x7, 0x5, 
    0x2, 0x2, 0x8, 0x9, 0x7, 0x4, 0x2, 0x2, 0x9, 0xa, 0x9, 0x2, 0x2, 0x2, 
    0xa, 0x3, 0x3, 0x2, 0x2, 0x2, 0x3, 0x5, 
  };

  atn::ATNDeserializer deserializer;
  _atn = deserializer.deserialize(_serializedATN);

  size_t count = _atn.getNumberOfDecisions();
  _decisionToDFA.reserve(count);
  for (size_t i = 0; i < count; i++) { 
    _decisionToDFA.emplace_back(_atn.getDecisionState(i), i);
  }
}

CountParser::Initializer CountParser::_init;
