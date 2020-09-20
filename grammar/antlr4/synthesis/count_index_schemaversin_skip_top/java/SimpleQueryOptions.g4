grammar SimpleQueryOptions;
// ANTLR4 combined grammar for query options:
// * (inline)count
// * index
// * schemaversion
// * skip
// * top
// note: The start rule allows infinite multiple occurences of specific options
// ... The prose of the OData specification constrains those to (0, 1).

// parser section - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
queryoptions :  queryoption ( AMPERSAND queryoption )*;

queryoption  : inlinecount | index_ | schemaversion | skip | top;

inlinecount   : DOLLAR? COUNT EQ booleanExpr;
index_        : DOLLAR? INDEX EQ signedIntExpr;
schemaversion : DOLLAR? SCHEMAVERSION EQ versionExpr;
skip          : DOLLAR? SKIP_ EQ integralExpr;
top           : DOLLAR? TOP EQ integralExpr;

booleanExpr   : TRUE | FALSE;
integralExpr  : INTEGRAL_DIGITS;
signedIntExpr : INTEGRAL_DIGITS | SIGNED_INTEGER;
versionExpr   : STAR | UNRESERVED+;

// lexer section  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
SIGNED_INTEGER : (PLUS | DASH) DIGIT+;
INTEGRAL_DIGITS : DIGIT+;

UNRESERVED   : ALPHA | DIGIT | DASH | DOT | UNDER | TILDE;

ALPHA : A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R
          | S | T | U | V | W | X |Y | Z;

COUNT : C O U N T ;
INDEX : I N D E X ;
SCHEMAVERSION : S C H E M A V E R S I O N ;
SKIP_ : S K I P ;
TOP : T O P ;

TRUE  : T R U E ;
FALSE : F A L S E ;

AMPERSAND : '&';
DASH      : '-';
DOLLAR    : '$';
DOT       : '.';
EQ        : '=';
PLUS      : '+';
STAR      : '*';
TILDE     : '~';
UNDER     : '_';

DIGIT: ZERO | NON_ZERO;

fragment NON_ZERO: [1-9];
fragment ZERO: [0];

fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];
