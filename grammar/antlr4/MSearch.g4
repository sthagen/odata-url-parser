/*
 * Test grammar for minimal expression language for $search.
 *
 * Tests in t.MSearch currently all pass (all but last 2 from ODATA-139).
 * 
 * Build instructions in working copy (with a subfolder MSearch):
 * $> antlr4 -visitor -listener -long-messages -atn -Werror -o MSearch MSearch.g4 
 * $> cd MSearch
 * $> javac -cp $pathTo/antlr-4.0-complete.jar MSearch*.java
 * $> for i in {1..17}; do t=$(sed -n ${i}p ../t.MSearch); echo "Test $i '$t': "; echo $t | grun MSearch pair -tree; done; 
 * Output (matches all ODATA-139::Proposal expectations and adds grouping):
 * Test 1 '$search=foo': 
 * (pair $search = (searchExpr (subExpr foo)))
 * Test 2 '$search=foo bar': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr bar)))
 * Test 3 '$search=foo bar baz': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr bar) (subExpr baz)))
 * Test 4 '$search=foo AND bar': 
 * (pair $search = (searchExpr (subExpr (subExpr foo) AND (subExpr bar))))
 * Test 5 '$search=foo AND bar AND baz': 
 * (pair $search = (searchExpr (subExpr (subExpr (subExpr foo) AND (subExpr bar)) AND (subExpr baz))))
 * Test 6 '$search=foo OR bar': 
 * (pair $search = (searchExpr (subExpr (subExpr foo) OR (subExpr bar))))
 * Test 7 '$search=foo OR bar OR baz': 
 * (pair $search = (searchExpr (subExpr (subExpr (subExpr foo) OR (subExpr bar)) OR (subExpr baz))))
 * Test 8 '$search=NOT foo': 
 * (pair $search = (searchExpr (subExpr NOT (subExpr foo))))
 * Test 9 '$search=foo NOT bar': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr NOT (subExpr bar))))
 * Test 10 '$search=foo NOT bar NOT baz': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr NOT (subExpr bar)) (subExpr NOT (subExpr baz))))
 * Test 11 '$search=foo NOT bar baz': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr NOT (subExpr bar)) (subExpr baz)))
 * Test 12 '$search=foo baz NOT bar': 
 * (pair $search = (searchExpr (subExpr foo) (subExpr baz) (subExpr NOT (subExpr bar))))
 * Test 13 '$search="foo bar"': 
 * (pair $search = (searchExpr (subExpr "foo bar")))
 * Test 14 '$search="foo bar baz"': 
 * (pair $search = (searchExpr (subExpr "foo bar baz")))
 * Test 15 '$search=': 
 * (pair $search = searchExpr)
 * Test 16 '$search=(foo OR bar) AND NOT "baz zooka"': 
 * (pair $search = (searchExpr (subExpr (subExpr ( (subExpr (subExpr foo) OR (subExpr bar)) )) AND (subExpr NOT (subExpr "baz zooka")))))
 * Test 17 '$search=(foo OR bar) AND NOT "baz\"zooka\""': 
 * (pair $search = (searchExpr (subExpr (subExpr ( (subExpr (subExpr foo) OR (subExpr bar)) )) AND (subExpr NOT (subExpr "baz\"zooka\"")))))
 *
 * These notes will be replaced when the code will be released.
 *
 * Contact: Stefan Drees <stefan@drees.name> 
 */
grammar MSearch;

pair : SearchSignal EQ searchExpr ;

searchExpr : subExpr* ;

subExpr :
    'NOT' <assoc=right> subExpr # Not
  | subExpr 'AND' subExpr       # And
  | subExpr 'OR' subExpr        # Or
  | QSTRING                     # QuotedString
  | SSTRING                     # SimpleString
  | OP subExpr CP               # Par
  ;

SearchSignal : DOLLAR 'search' ;

OP : '(' ;
CP : ')' ;

DOLLAR : '$' ;
EQ : '=' ;

SSTRING : [a-zA-Z_*+\-/~|!]+ ;


QSTRING
    :   '"' ( ESC | ~[\\"] )*? '"'
    ;

HEX :   '0' ('x'|'X') HEXDIGIT+ [Ll]? ;

fragment
HEXDIGIT : ('0'..'9'|'a'..'f'|'A'..'F') ;

fragment
ESC :   '\\' ([abtnfrv]|'"'|'\'')
    |   UNICODE_ESCAPE
    |   HEX_ESCAPE
    |   OCTAL_ESCAPE
    ;

fragment
UNICODE_ESCAPE
    :   '\\' 'u' HEXDIGIT HEXDIGIT HEXDIGIT HEXDIGIT
    |   '\\' 'u' '{' HEXDIGIT HEXDIGIT HEXDIGIT HEXDIGIT '}'
    ;

fragment
OCTAL_ESCAPE
    :   '\\' [0-3] [0-7] [0-7]
    |   '\\' [0-7] [0-7]
    |   '\\' [0-7]
    ;

fragment
HEX_ESCAPE
    :   '\\' HEXDIGIT HEXDIGIT?
    ;


WS : [ \t\n\r]+ -> skip ;
