grammar Count;

count  : '$'? Count '=' ( True_ | False_ );

Count : C O U N T;
True_ : T R U E;     // Avoid conflicts for generated code with target language or runtime
False_ : F A L S E;  // Avoid conflicts for generated code with target language or runtime

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

