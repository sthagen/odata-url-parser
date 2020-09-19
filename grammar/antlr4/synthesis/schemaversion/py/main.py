# -*- coding: utf-8 -*-
# pylint: disable=missing-docstring
"""Test driver for the Schemaversion ANTLR4 grammar."""
import os
import sys
from antlr4 import *
import SchemaversionLexer as schemaversion_lexer
import SchemaversionParser as schemaversion_parser

DEBUG_VAR = "SCHEMAVERSION_DEBUG"
DEBUG = os.getenv(DEBUG_VAR, "")
if DEBUG:
    print(f'Entering debug mode ({DEBUG_VAR} == {DEBUG})')


def main(argv=None):
    argv = argv if argv is not None else sys.argv[1:]
    max_len = max(len(arg) for arg in argv)
    for arg in argv:
        DEBUG and print(f'Parsing {arg :{max_len}s} as count schemaversion option:', end=' ')
        input_stream = FileStream(arg)
        lexer = schemaversion_lexer.SchemaversionLexer(input_stream)
        stream = CommonTokenStream(lexer)
        parser = schemaversion_parser.SchemaversionParser(stream)
        tree = parser.schemaversion()
        print(tree.toStringTree(recog=parser))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
