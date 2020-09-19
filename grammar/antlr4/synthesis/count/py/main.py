# -*- coding: utf-8 -*-
# pylint: disable=missing-docstring
"""Test driver for the Count ANTLR4 grammar."""
import os
import sys
from antlr4 import *
import CountLexer as count_lexer
import CountParser as count_parser

DEBUG_VAR = "COUNT_DEBUG"
DEBUG = os.getenv(DEBUG_VAR, "")
if DEBUG:
    print(f'Entering debug mode ({DEBUG_VAR} == {DEBUG})')


def main(argv=None):
    argv = argv if argv is not None else sys.argv[1:]
    max_len = max(len(arg) for arg in argv)
    for arg in argv:
        DEBUG and print(f'Parsing {arg :{max_len}s} as count query option:', end=' ')
        input_stream = FileStream(arg)
        lexer = count_lexer.CountLexer(input_stream)
        stream = CommonTokenStream(lexer)
        parser = count_parser.CountParser(stream)
        tree = parser.count()
        print(tree.toStringTree(recog=parser))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
