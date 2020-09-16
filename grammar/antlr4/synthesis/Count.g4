grammar Count;

count  : '$'? Count '=' ( True | False );

Count : C O U N T;
True : T R U E;
False : F A L S E;

fragment A : [aA];
fragment C : [cC];
fragment E : [eE];
fragment F : [fF];
fragment L : [lL];
fragment N : [nN];
fragment O : [oO];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];

