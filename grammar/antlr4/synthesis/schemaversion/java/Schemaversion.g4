grammar Schemaversion;

schemaversion  : '$'? Schemaversion '=' ( '*' | Unreserved+ );

Schemaversion : S C H E M A V E R S I O N;

Unreserved : Alpha | Digit | '-' | '.' | '_' | '~';

Alpha : A | B | C | D | E | F | G | H | I | J | K | L | M | N |O | P | Q | R | S | T | U | V | W | X |Y | Z;
Digit : [0-9];

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
