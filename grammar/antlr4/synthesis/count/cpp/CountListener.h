
// Generated from Count.g4 by ANTLR 4.8

#pragma once


#include "antlr4-runtime.h"
#include "CountParser.h"


/**
 * This interface defines an abstract listener for a parse tree produced by CountParser.
 */
class  CountListener : public antlr4::tree::ParseTreeListener {
public:

  virtual void enterCount(CountParser::CountContext *ctx) = 0;
  virtual void exitCount(CountParser::CountContext *ctx) = 0;


};

