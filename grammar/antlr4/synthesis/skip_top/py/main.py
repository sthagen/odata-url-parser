# -*- coding: utf-8 -*-
# pylint: disable=missing-docstring
"""Test driver for the SkpTop ANTLR4 grammar."""
import os
import sys
from antlr4 import *
import SkipTopLexer as skip_top_lexer
import SkipTopParser as skip_top_parser

DEBUG_VAR = "SKIP_TOP_DEBUG"
DEBUG = os.getenv(DEBUG_VAR, "")
if DEBUG:
    print(f'Entering debug mode ({DEBUG_VAR} == {DEBUG})')


def main(argv=None):
    argv = argv if argv is not None else sys.argv[1:]
    max_len = max(len(arg) for arg in argv)
    for arg in argv:
        DEBUG and print(f'Parsing {arg :{max_len}s} as skip/top query option:', end=' ')
        input_stream = FileStream(arg)
        lexer = skip_top_lexer.SkipTopLexer(input_stream)
        stream = CommonTokenStream(lexer)
        parser = skip_top_parser.SkipTopParser(stream)
        tree = parser.skip_top()
        print(tree.toStringTree(recog=parser))
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
