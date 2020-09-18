grammar Orderby;
// Note: not yet resolving all symbols and unchecked priorities for lexer rules - wip

orderby  : '$'? Orderby '=' orderbyitem ( ',' | orderbyitem )*;

orderbyitem : commonexpr [ RWS ( "asc" / "desc" ) ];

// From ABNF section Expressions
commonexpr : ( primitiveliteral
             | arrayorobject
             | rootexpr
             | firstmemberexpr
             | functionexpr
             | negateexpr
             | methodcallexpr
             | parenexpr
             | castexpr
             | isofexpr
             | notexpr
             )
             ( addexpr
             | subexpr
             | mulexpr
             | divexpr
             | divbyexpr
             | modexpr
             )?
             ( eqexpr
             | neexpr
             | ltexpr
             | leexpr
             | gtexpr
             | geexpr
             | hasexpr
             | inexpr
             )?
             ( andexpr
             | orexpr
             )?
             ;

boolcommonexpr : commonexpr; // resulting in a Boolean

rootexpr : '$root/' ( entitysetname keypredicate | singletonentity ) ( singlenavigationexpr )?;

firstmemberexpr : memberexpr
                | inscopevariableexpr ( '/' memberexpr )?;

memberexpr : directmemberexpr
           | ( optionallyqualifiedentitytypename | optionallyqualifiedcomplextypename ) '/' directmemberexpr;

directmemberexpr : propertypathexpr
                 | boundfunctionexpr
                 | annotationexpr
                 ;

propertypathexpr : ( entitycolnavigationproperty ( collectionnavigationexpr )?
                   | entitynavigationproperty    ( singlenavigationexpr )?
                   | complexcolproperty          ( complexcolpathexpr )?
                   | complexproperty             ( complexpathexpr )?
                   | primitivecolproperty        ( collectionpathexpr )?
                   | primitiveproperty           ( primitivepathexpr )?
                   | streamproperty              ( primitivepathexpr )?
                   )
                   ;

annotationexpr : annotationinquery
                 ( collectionpathexpr
                 | singlenavigationexpr
                 | complexpathexpr
                 | primitivepathexpr
                 )?
                 ;

annotationinquery    : AT ( namespace '.' )? termname ( HASH annotationqualifier )?;
annotationinfragment : AT ( namespace '.' )? termname ( '#'  annotationqualifier )?;
annotationqualifier  : odataidentifier;

inscopevariableexpr  : implicitvariableexpr
                     | parameteralias
                     | lambdavariableexpr // only allowed inside a lambdapredicateexpr
                     ;
implicitvariableexpr : '$it'              // the current instance of the resource identified by the resource path
                     | '$this'            // the instance on which the query option is evaluated
                     ;
lambdavariableexpr   : odataidentifier;

collectionnavigationexpr : ( '/' optionallyqualifiedentitytypename )?
                           ( collectionpathexpr
                           | keypredicate ( singlenavigationexpr )?
                           | filterexpr ( collectionnavigationexpr )?
                           )
                           ;

singlenavigationexpr : '/' memberexpr;

filterexpr : '/$filter' OPEN boolcommonexpr CLOSE;

complexcolpathexpr : collectionpathexpr
                   | '/' optionallyqualifiedcomplextypename ( collectionpathexpr )?;

collectionpathexpr : count ( OPEN expandcountoption ( SEMI expandcountoption )* CLOSE )?
                   | filterexpr ( collectionpathexpr )?
                   | '/' anyexpr
                   | '/' allexpr
                   | '/' boundfunctionexpr
                   | '/' annotationexpr
                   ;

complexpathexpr : '/' directmemberexpr
                | '/' optionallyqualifiedcomplextypename ( '/' directmemberexpr )?
                ;

primitivepathexpr : '/' ( annotationexpr | boundfunctionexpr )?;

boundfunctionexpr : functionexpr // boundfunction segments can only be composed if the type of the
                  ;              // previous segment matches the type of the first function parameter

functionexpr : ( namespace '.' )?
               ( entitycolfunction    functionexprparameters ( collectionnavigationexpr )?
               | entityfunction       functionexprparameters ( singlenavigationexpr )?
               | complexcolfunction   functionexprparameters ( complexcolpathexpr )?
               | complexfunction      functionexprparameters ( complexpathexpr )?
               | primitivecolfunction functionexprparameters ( collectionpathexpr )?
               | primitivefunction    functionexprparameters ( primitivepathexpr )?
               )
               ;

functionexprparameters : OPEN ( functionexprparameter ( COMMA functionexprparameter )* )? CLOSE;
functionexprparameter  : parametername EQ ( parameteralias | parametervalue );

anyexpr : Any OPEN BWS ( lambdavariableexpr BWS COLON BWS lambdapredicateexpr )? BWS CLOSE;
allexpr : All OPEN BWS   lambdavariableexpr BWS COLON BWS lambdapredicateexpr   BWS CLOSE;
lambdapredicateexpr : boolcommonexpr; // containing at least one lambdavariableexpr

methodcallexpr : indexofmethodcallexpr
               | tolowermethodcallexpr
               | touppermethodcallexpr
               | trimmethodcallexpr
               | substringmethodcallexpr
               | concatmethodcallexpr
               | lengthmethodcallexpr
               | matchespatternmethodcallexpr
               | yearmethodcallexpr
               | monthmethodcallexpr
               | daymethodcallexpr
               | hourmethodcallexpr
               | minutemethodcallexpr
               | secondmethodcallexpr
               | fractionalsecondsmethodcallexpr
               | totalsecondsmethodcallexpr
               | datemethodcallexpr
               | timemethodcallexpr
               | roundmethodcallexpr
               | floormethodcallexpr
               | ceilingmethodcallexpr
               | distancemethodcallexpr
               | geolengthmethodcallexpr
               | totaloffsetminutesmethodcallexpr
               | mindatetimemethodcallexpr
               | maxdatetimemethodcallexpr
               | nowmethodcallexpr
               | casemethodcallexpr
               | boolmethodcallexpr
               ;

boolmethodcallexpr : endswithmethodcallexpr
                   | startswithmethodcallexpr
                   | containsmethodcallexpr
                   | intersectsmethodcallexpr
                   | hassubsetmethodcallexpr
                   | hassubsequencemethodcallexpr
                   ;

concatmethodcallexpr         : Concat         OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
containsmethodcallexpr       : Contains       OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
endswithmethodcallexpr       : Endswith       OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
indexofmethodcallexpr        : Indexof        OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
lengthmethodcallexpr         : Length         OPEN BWS commonexpr BWS CLOSE;
matchespatternmethodcallexpr : Matchespattern OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
startswithmethodcallexpr     : Startswith     OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
substringmethodcallexpr      : Substring      OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS ( COMMA BWS commonexpr BWS )? CLOSE;
tolowermethodcallexpr        : Tolower        OPEN BWS commonexpr BWS CLOSE;
touppermethodcallexpr        : Toupper        OPEN BWS commonexpr BWS CLOSE;
trimmethodcallexpr           : Trim           OPEN BWS commonexpr BWS CLOSE;

yearmethodcallexpr               : Year               OPEN BWS commonexpr BWS CLOSE;
monthmethodcallexpr              : Month              OPEN BWS commonexpr BWS CLOSE;
daymethodcallexpr                : Day                OPEN BWS commonexpr BWS CLOSE;
hourmethodcallexpr               : Hour               OPEN BWS commonexpr BWS CLOSE;
minutemethodcallexpr             : Minute             OPEN BWS commonexpr BWS CLOSE;
secondmethodcallexpr             : Second             OPEN BWS commonexpr BWS CLOSE;
fractionalsecondsmethodcallexpr  : Fractionalseconds  OPEN BWS commonexpr BWS CLOSE;
totalsecondsmethodcallexpr       : Totalseconds       OPEN BWS commonexpr BWS CLOSE;
datemethodcallexpr               : Date               OPEN BWS commonexpr BWS CLOSE;
timemethodcallexpr               : Time               OPEN BWS commonexpr BWS CLOSE;
totaloffsetminutesmethodcallexpr : Totaloffsetminutes OPEN BWS commonexpr BWS CLOSE;

mindatetimemethodcallexpr : Mindatetime OPEN BWS CLOSE;
maxdatetimemethodcallexpr : Maxdatetime OPEN BWS CLOSE;
nowmethodcallexpr         : Now         OPEN BWS CLOSE;

roundmethodcallexpr   : Round   OPEN BWS commonexpr BWS CLOSE;
floormethodcallexpr   : Floor   OPEN BWS commonexpr BWS CLOSE;
ceilingmethodcallexpr : Ceiling OPEN BWS commonexpr BWS CLOSE;

distancemethodcallexpr   : Geodotdistance   OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
geolengthmethodcallexpr  : Geodotlength     OPEN BWS commonexpr BWS CLOSE;
intersectsmethodcallexpr : Geodotintersects OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;

hassubsetmethodcallexpr      : Hassubset      OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;
hassubsequencemethodcallexpr : Hassubsequence OPEN BWS commonexpr BWS COMMA BWS commonexpr BWS CLOSE;

casemethodcallexpr : Case OPEN BWS boolcommonexpr BWS COLON BWS commonexpr BWS
                        ( COMMA BWS boolcommonexpr BWS COLON BWS commonexpr BWS )* CLOSE;

parenexpr : OPEN BWS commonexpr BWS CLOSE;
listexpr  : OPEN BWS primitiveliteral BWS ( COMMA BWS primitiveliteral BWS )* CLOSE;

andexpr : RWS And RWS boolcommonexpr;
orexpr  : RWS Or  RWS boolcommonexpr;

eqexpr : RWS Eq RWS commonexpr;
neexpr : RWS Ne RWS commonexpr;
ltexpr : RWS Lt RWS commonexpr;
leexpr : RWS Le RWS commonexpr;
gtexpr : RWS Gt RWS commonexpr;
geexpr : RWS Ge RWS commonexpr;
inexpr : RWS In RWS ( listexpr | commonexpr );

hasexpr : RWS Has RWS enum;

addexpr   : RWS Add   RWS commonexpr;
subexpr   : RWS Sub   RWS commonexpr;
mulexpr   : RWS Mul   RWS commonexpr;
divexpr   : RWS Div   RWS commonexpr;
divbyexpr : RWS Divby RWS commonexpr;
modexpr   : RWS Mod   RWS commonexpr;

negateexpr : '-' BWS commonexpr;

notexpr : Not RWS boolcommonexpr;

isofexpr : Isof OPEN BWS ( commonexpr BWS COMMA BWS )? optionallyqualifiedtypename BWS CLOSE;
castexpr : Cast OPEN BWS ( commonexpr BWS COMMA BWS )? optionallyqualifiedtypename BWS CLOSE;

// From ABNF section JSON format for queries
// Note: the query part of a URI needs to be percent-encoding normalized before
//       applying these rules, see comment at the top of this file

arrayorobject : array
              | object
              ;

array : beginarray
        ( valueinurl ( valueseparator valueinurl )* )?
        endarray
        ;

object : beginobject
         ( member ( valueseparator member )* )?
         endobject
         ;

member : stringinurl nameseparator valueinurl;

valueinurl : stringinurl
           | commonexpr
           ;

// JSON syntax: adapted to URI restrictions from [RFC8259]
beginobject : BWS  '{'  BWS;
endobject   : BWS  '}';

beginarray : BWS  '['  BWS;
endarray   : BWS  ']';

quotationmark  : DQUOTE;
nameseparator  : BWS COLON BWS;
valueseparator : BWS COMMA BWS;

stringinurl : quotationmark charinjson* quotationmark;

charinjson   : Qcharunescaped
             | qcharjsonspecial
             | escape ( quotationmark
                      | escape
                      | '/' // solidus         U+002F - literal form is allowed in the query part of a URL
                      | 'b'             // backspace       U+0008
                      | 'f'             // form feed       U+000C
                      | 'n'             // line feed       U+000A
                      | 'r'             // carriage return U+000D
                      | 't'             // tab             U+0009
                      | 'u' Hexdigit4   //                 U+XXXX
                      )
             ;
qcharjsonspecial : SP | ':' | '{' | '}' | '[' | ']'; // some agents put these unencoded into the query part of a URL

escape : '\\';      // reverse solidus U+005C


// From ABNF section Names and identifiers

qualifiedtypename : singlequalifiedtypename
                  | 'Collection' OPEN singlequalifiedtypename CLOSE
                  ;

optionallyqualifiedtypename : singlequalifiedtypename
                            | 'Collection' OPEN singlequalifiedtypename CLOSE
                            | singletypename
                            | 'Collection' OPEN singletypename CLOSE
                            ;

singlequalifiedtypename : qualifiedentitytypename
                        | qualifiedcomplextypename
                        | qualifiedtypedefinitionname
                        | qualifiedenumtypename
                        | primitivetypename
                        ;

singletypename : entitytypename
               | complextypename
               | typedefinitionname
               | enumerationtypename
               ;

qualifiedentitytypename     : namespace '.' entitytypename;
qualifiedcomplextypename    : namespace '.' complextypename;
qualifiedtypedefinitionname : namespace '.' typedefinitionname;
qualifiedenumtypename       : namespace '.' enumerationtypename;

optionallyqualifiedentitytypename     : ( namespace '.' )? entitytypename;
optionallyqualifiedcomplextypename    : ( namespace '.' )? complextypename;

// an alias is just a single-part namespace
namespace     : namespacepart ( '.' namespacepart )*;
namespacepart : odataidentifier;

entitysetname       : odataidentifier;
singletonentity     : odataidentifier;
entitytypename      : odataidentifier;
complextypename     : odataidentifier;
typedefinitionname  : odataidentifier;
enumerationtypename : odataidentifier;
enumerationmember   : odataidentifier;
termname            : odataidentifier;

// Note: this pattern is overly restrictive, the normative definition is type TSimpleIdentifier in OData EDM XML Schema
odataidentifier             : Identifierleadingcharacter Identifiercharacter127*;
Identifiercharacter127      : Idch
                            (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            (Idch (Idch (Idch (Idch (Idch (Idch (Idch Idch?)?)?)??)?)??)?)?
                            ;

Idch         : Identifierleadingcharacter | Digit; // plus Unicode characters from the categories L, Nl, Nd, Mn, Mc, Pc, or Cf
Identifierleadingcharacter  : Alpha | '_';         // plus Unicode characters from the categories L or Nl

primitivetypename : 'Edm.' ( 'Binary'
                           | 'Boolean'
                           | 'Byte'
                           | 'Date'
                           | 'DateTimeOffset'
                           | 'Decimal'
                           | 'Double'
                           | 'Duration'
                           | 'Guid'
                           | 'Int16'
                           | 'Int32'
                           | 'Int64'
                           | 'SByte'
                           | 'Single'
                           | 'Stream'
                           | 'String'
                           | 'TimeOfDay'
                           | abstractspatialtypename ( concretespatialtypename )?
                           )
                           ;
abstractspatialtypename : 'Geography'
                        | 'Geometry'
                        ;
concretespatialtypename : 'Collection'
                        | 'LineString'
                        | 'MultiLineString'
                        | 'MultiPoint'
                        | 'MultiPolygon'
                        | 'Point'
                        | 'Polygon'
                        ;

primitiveproperty       : primitivekeyproperty | primitivenonkeyproperty;
primitivekeyproperty    : odataidentifier;
primitivenonkeyproperty : odataidentifier;
primitivecolproperty    : odataidentifier;
complexproperty         : odataidentifier;
complexcolproperty      : odataidentifier;
streamproperty          : odataidentifier;

navigationproperty          : entitynavigationproperty | entitycolnavigationproperty;
entitynavigationproperty    : odataidentifier;
entitycolnavigationproperty : odataidentifier;

action       : odataidentifier;
actionimport : odataidentifier;

function : entityfunction
         | entitycolfunction
         | complexfunction
         | complexcolfunction
         | primitivefunction
         | primitivecolfunction
         ;

entityfunction       : odataidentifier;
entitycolfunction    : odataidentifier;
complexfunction      : odataidentifier;
complexcolfunction   : odataidentifier;
primitivefunction    : odataidentifier;
primitivecolfunction : odataidentifier;

entityfunctionimport       : odataidentifier;
entitycolfunctionimport    : odataidentifier;
complexfunctionimport      : odataidentifier;
complexcolfunctionimport   : odataidentifier;
primitivefunctionimport    : odataidentifier;
primitivecolfunctionimport : odataidentifier;


// From ABNF section Literal Data Values

// in URLs
primitiveliteral : 'null'                     // plain values up to int64value
                 | Booleanvalue
                 | guidvalue
                 | datetimeoffsetvalueinurl
                 | datevalue
                 | timeofdayvalueinurl
                 | decimalvalue
                 | doublevalue
                 | singlevalue
                 | sbytevalue
                 | bytevalue
                 | int16value
                 | int32value
                 | int64value
                 | string                     // single-quoted
                 | duration
                 | enum
                 | binary                     // all others are quoted and prefixed
                 | geographycollection
                 | geographylinestring
                 | geographymultilinestring
                 | geographymultipoint
                 | geographymultipolygon
                 | geographypoint
                 | geographypolygon
                 | geometrycollection
                 | geometrylinestring
                 | geometrymultilinestring
                 | geometrymultipoint
                 | geometrymultipolygon
                 | geometrypoint
                 | geometrypolygon
                 ;

guidvalue : Hexdigit8 '-' Hexdigit4 '-' Hexdigit4 '-' Hexdigit4 '-' Hexdigit12;

// Lexer layer

Hexdigit12 : Hexdigit8 Hexdigit4;
Hexdigit8 : Hexdigit4 Hexdigit4;
Hexdigit4 : Hexdigit Hexdigit Hexdigit Hexdigit;

Any : A N Y ;
All : A L L ;

Concat         : C O N C A T ;
Contains       : C O N T A I N S;
Endswith       : E N D S W I T H ;
Indexof        : I N D E X O F ;
Length         : L E N G T H ;
Matchespattern : M A T C H E S P A T T E R N ;
Startswith     : S T A R T S W I T H ;
Substring      : S U B S T R I N G ;
Tolower        : T O L O W E R ;
Toupper        : T O U P P E R ;
Trim           : T R I M ;

Year               : Y E A R ;
Month              : M O N T H ;
Day                : D A Y ;
Hour               : H O U R ;
Minute             : M I N U T E ;
Second             : S E C O N D ;
Fractionalseconds  : F R A C T I O N A L S E C O N D S ;
Totalseconds       : T O T A L S E C O N D S ;
Date               : D A T E ;
Time               : T I M E ;
Totaloffsetminutes : T O T A L O F F S E T M I N U T E S ;

Mindatetime : M I N D A T E T I M E ;
Maxdatetime : M A X D A T E T I M E ;
Now         : N O W ;

Round   : R O U N D ;
Floor   : F L O O R ;
Ceiling : C E I L I N G ;

Geodotdistance   : Geodot D I S T A N C E ;
Geodotlength  : Geodot L E N G T H ;
Geodotintersects : Geodot I N T E R S E C T S ;

Geodot : G E O '.' ;

Hassubset      : H A S S U B S E T ;
Hassubsequence : H A S S U B S E Q U E N C E ;

Case : C A S E ;

And : A N D ;
Or  : O R ;

Eq : E Q ;
Ne : N E ;
Lt : L T ;
Le : L E ;
Gt : G T ;
Ge : G E ;
In : I N ;

Has : H A S ;

Add   : A D D ;
Sub   : S U B ;
Mul   : M U L ;
Divby : Div B Y ;
Div   : D I V ;
Mod   : M O D ;

Not : N O T ;

Isof : I S O F ;
Cast : C A S T ;


Orderby : O R D E R B Y;

Booleanvalue : True | False;

True  : T R U E ;
False : F A L S E ;

Qcharunescaped : Unreserved | Otherdelims | ':' | '@' | '/' | '?' | '$' | '\'' | '=';
Otherdelims : '!' |                   '(' | ')' | '*' | '+' | ',' | ';';

Unreserved : Alpha | Digit | '-' | '.' | '_' | '~';

Alpha : A | B | C | D | E | F | G | H | I | J | K | L | M | N |O | P | Q | R | S | T | U | V | W | X |Y | Z;
Hexdigit : Digit | A | B | C | D | E | F ;
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
