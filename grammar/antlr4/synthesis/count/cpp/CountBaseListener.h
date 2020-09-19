
// Generated from Count.g4 by ANTLR 4.8

#pragma once


#include "antlr4-runtime.h"
#include "CountListener.h"


/**
 * This class provides an empty implementation of CountListener,
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
class  CountBaseListener : public CountListener {
public:

  virtual void enterCount(CountParser::CountContext * /*ctx*/) override { }
  virtual void exitCount(CountParser::CountContext * /*ctx*/) override { }


  virtual void enterEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void exitEveryRule(antlr4::ParserRuleContext * /*ctx*/) override { }
  virtual void visitTerminal(antlr4::tree::TerminalNode * /*node*/) override { }
  virtual void visitErrorNode(antlr4::tree::ErrorNode * /*node*/) override { }

};

