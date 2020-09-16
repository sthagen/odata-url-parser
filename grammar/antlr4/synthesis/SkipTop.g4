grammar SkipTop;

skip_top : skip
         | top
         ;

skip  : '$'? Skip '=' INTEGER;

top  : '$'? Top '=' INTEGER;

Skip : S K I P;
Top : T O P;

INTEGER: DIGIT
       | NON_ZERO DIGIT+
       ;

fragment I : [iI];
fragment K : [kK];
fragment O : [oO];
fragment P : [pP];
fragment S : [sS];
fragment T : [tT];

fragment DIGIT: ZERO | NON_ZERO;
fragment NON_ZERO: [1-9];
fragment ZERO: [0];
