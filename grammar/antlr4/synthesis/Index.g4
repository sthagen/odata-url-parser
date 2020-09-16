grammar Index;

index  : '$'? Index '=' '-'? INTEGER;

Index : I N D E X;

INTEGER: DIGIT
       | NON_ZERO DIGIT+
       ;

fragment D : [dD];
fragment E : [eE];
fragment I : [iI];
fragment N : [nN];
fragment X : [xX];

fragment DIGIT: ZERO | NON_ZERO;
fragment NON_ZERO: [1-9];
fragment ZERO: [0];
