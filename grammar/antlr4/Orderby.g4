grammar Orderby;
// Note: not yet resolving all symbols and unchecked priorities for lexer rules - wip

orderby  : '$'? Orderby '=' orderbyitem ( ',' | orderbyitem )*;

orderbyitem : commonexpr ( ( ' ' | '\u0009' )+ ( Asc | Desc ) )?;

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

keypredicate     : simplekey | compoundkey | keypathsegments;

simplekey        : '(' ( parameteralias | keypropertyvalue ) ')';
compoundkey      : '(' keyvaluepair ( ',' keyvaluepair )* ')';
keyvaluepair     : ( primitivekeyproperty | keypropertyalias  ) '=' ( parameteralias | keypropertyvalue );
keypropertyvalue : primitiveliteral;
keypropertyalias : odataidentifier;
keypathsegments  : ( '/' keypathliteral )+;
keypathliteral   : Pchar*;
parameteralias     : '@' odataidentifier;

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

annotationinquery    : '@' ( namespace '.' )? termname ( '#' annotationqualifier )?;
annotationqualifier  : odataidentifier;

inscopevariableexpr  : implicitvariableexpr
                     | parameteralias
                     | lambdavariableexpr // only allowed inside a lambdapredicateexpr
                     ;
implicitvariableexpr : '$' 'it'              // the current instance of the resource identified by the resource path
                     | '$' 'this'            // the instance on which the query option is evaluated
                     ;
lambdavariableexpr   : odataidentifier;

collectionnavigationexpr : ( '/' optionallyqualifiedentitytypename )?
                           ( collectionpathexpr
                           | keypredicate ( singlenavigationexpr )?
                           | filterexpr ( collectionnavigationexpr )?
                           )
                           ;

singlenavigationexpr : '/' memberexpr;

filterexpr : '/' '$' 'filter' '(' boolcommonexpr ')';

complexcolpathexpr : collectionpathexpr
                   | '/' optionallyqualifiedcomplextypename ( collectionpathexpr )?;

collectionpathexpr : count ( '(' expandcountoption ( ';' expandcountoption )* ')' )?
                   | filterexpr ( collectionpathexpr )?
                   | '/' anyexpr
                   | '/' allexpr
                   | '/' boundfunctionexpr
                   | '/' annotationexpr
                   ;

compute          : '$'? Compute '=' computeitem ( ',' computeitem )*;

Compute : C O M P U T E ;

computeitem      : commonexpr ( ' ' | '\u0009' )+ As ( ' ' | '\u0009' )+ computedproperty;
computedproperty : odataidentifier;

expand            : '$'? Expand '=' expanditem ( ',' expanditem )*;

Expand : E X P A N D ;

expanditem        : (DOLLAR (CAP_V | V) (CAP_A | A) (CAP_L | L) (CAP_U | U) (CAP_E | E))
                  | expandpath
                  | (optionallyqualifiedentitytypename '/' expandpath)
                  ;

expandpath        : ( ( complexproperty | complexcolproperty | optionallyqualifiedcomplextypename | complexannotationinquery ) SLASH )*
                    ( ('*' ( ref_1 | ( '(' levels ')' ) )?)
                    | streamproperty
                    | (( navigationproperty | entityannotationinquery ) ( '/' optionallyqualifiedentitytypename )?
                      ( (ref_1   ( '(' expandrefoption   ( ';' expandrefoption   )* ')' )?)
                      | (count ( '(' expandcountoption ( ';' expandcountoption )* ')' )?)
                      |         ('(' expandoption      ( ';' expandoption      )* ')')
                      )?)
                    );

complexannotationinquery : annotationinquery; // complex-valued annotation
entityannotationinquery  : annotationinquery; // entity-valued annotation

primitiveannotationinquery    : annotationinquery; // primitive-valued annotation
primitivecolannotationinquery : annotationinquery; // primitive collection-valued annotation

expandcountoption : filter
                  | search
                  ;

expandrefoption   : expandcountoption
                  | orderby
                  | skip
                  | top
                  | inlinecount
                  ;

expandoption      : expandrefoption
                  | select
                  | expand
                  | compute
                  | levels
                  | aliasandvalue
                  ;

aliasandvalue : parameteralias '=' parametervalue;

parametervalue : arrayorobject
               | commonexpr
               ;

levels : '$'? L E V E L S '=' ( INTEGER | M A X );

filter : '$'? F I L T E R '=' boolcommonexpr;

skip  : '$'? Skip '=' INTEGER;

top  : '$'? Top '=' INTEGER;

Skip : S K I P;
Top : T O P;

inlinecount : '$'? Count '=' booleanvalue;

// base64url encoding according to http://tools.ietf.org/html/rfc4648#section-5
binary      : Binary '\'' binaryvalue '\'';
Binary : B I N A R Y ;
binaryvalue : base64char_04* ( base64b16  | base64b8 )?;
base64b16   : base64char_02 ( 'A' | 'E' | 'I' | 'M' | 'Q' | 'U' | 'Y' | 'c' | 'g' | 'k' | 'o' | 's' | 'w' | ZERO | FOUR | EIGHT ) '='?;
base64b8    : base64char ( CAP_A | CAP_Q | G | W ) ( (EQUALS EQUALS) )?;

base64char_04 : base64char_02 base64char_02 ;
base64char_02 : base64char base64char ;
base64char  : Alpha | Digit | DASH | UNDERSCORE;

booleanvalue : True | False;

select         : '$'? Select '=' selectitem ( ',' selectitem )*;

Select : S E L E C T ;

selectitem     : '*'
               | alloperationsinschema
               | selectproperty
               | optionallyqualifiedactionname
               | optionallyqualifiedfunctionname
               | (( optionallyqualifiedentitytypename | optionallyqualifiedcomplextypename )
                 SLASH ( selectproperty
                     | optionallyqualifiedactionname
                     | optionallyqualifiedfunctionname
                     )
               )
               ;
alloperationsinschema : namespace_1 '.' '*';
// an alias is just a single-part namespace
namespace_1     : namespacepart ( '.' namespacepart )*;

// The parameterNames uniquely identify the bound function overload
// Necessary only if it has overloads
optionallyqualifiedactionname   : ( namespace_1 '.' )? action;
optionallyqualifiedfunctionname : ( namespace_1 '.' )? function ( '(' parameternames ')' )?;

// The names of all non-binding parameters, separated by commas
parameternames : parametername ( ',' parametername )*;
parametername      : odataidentifier;

selectproperty : primitiveproperty | primitiveannotationinquery
               | (( primitivecolproperty | primitivecolannotationinquery ) ( '(' selectoptionpc ( ';' selectoptionpc )* ')' )?)
               | navigationproperty
               | (selectpath ( ( '(' selectoption ( ';' selectoption )* ')' )
                            | ( '/' selectproperty)
                            )?);
selectpath     : ( complexproperty | complexcolproperty | complexannotationinquery ) ( '/' optionallyqualifiedcomplextypename )?;
selectoptionpc : filter | search | inlinecount | orderby | skip | top;
selectoption   : selectoptionpc
               | compute | select | aliasandvalue;

search     : '$'? Search '=' ( ' ' | '\u0009' )* ( searchexpr | searchexpr_incomplete );

Search : S E A R C H ;

searchexpr : ( searchparenexpr
             | searchnegateexpr
             | searchphrase
             | searchword
             ) ( searchorexpr
               | searchandexpr
               )?;
searchparenexpr : Open ( ' ' | '\u0009' )* searchexpr ( ' ' | '\u0009' )* Close;

// NOT is a unary operator if followed by a search expression
searchnegateexpr : (CAP_N CAP_O CAP_T) ( ' ' | '\u0009' )+ searchexpr;

// AND and OR are binary operators if they appear between search expressions
searchorexpr  : ( ' ' | '\u0009' )+ (CAP_O CAP_R)  ( ' ' | '\u0009' )+ searchexpr;
searchandexpr : ( ' ' | '\u0009' )+ ( (CAP_A CAP_N CAP_D) ( ' ' | '\u0009' )+ )? searchexpr;

searchphrase : '"' ( Qchar_no_amp_dquote | ' ' )+ '"';


// A searchWord is a sequence of one or more non-whitespace characters, excluding
// - literal or percent-encoded parentheses "(", "%28", "%29", ")"
// - literal or percent-encoded double-quotes '"' and "%22"
// - the semicolon ";"
// Percent-encoding is allowed, and required for characters with special meaning in the query part of a URL, especially "&" and "#".
// Expressing this in ABNF is somewhat clumsy, so the following rule is overly generous.
// Note: the words AND, OR, and NOT are sometimes operators, depending on their position within a search expression.
searchword : searchchar ( searchchar | '\'' )*;
searchchar : Unreserved | '!' | '*' | '+' | ',' | ':' | '@' | '/' | '?' | '$' | '=';

searchexpr_incomplete : '\'' ( Squote_in_string | Qchar_no_amp_squote | '"' | ' ' )* '\'';

count : '/' '$' Count;
ref_1 : '/' '$'  Ref;

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

functionexprparameters : '(' ( functionexprparameter ( ',' functionexprparameter )* )? ')';
functionexprparameter  : parametername '=' ( parameteralias | parametervalue );

anyexpr : Any '(' ( ' ' | '\u0009' )* ( lambdavariableexpr ( ' ' | '\u0009' )* ':' ( ' ' | '\u0009' )* lambdapredicateexpr )? ( ' ' | '\u0009' )* ')';
allexpr : All '(' ( ' ' | '\u0009' )*   lambdavariableexpr ( ' ' | '\u0009' )* ':' ( ' ' | '\u0009' )* lambdapredicateexpr   ( ' ' | '\u0009' )* ')';
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

hasexpr : RWS Has RWS enum_1;

enum_1            : ( qualifiedenumtypename )? '\'' enumvalue '\'';
enumvalue       : singleenumvalue ( ',' singleenumvalue )*;
singleenumvalue : enumerationmember | enummembervalue;
enummembervalue : int64value;

int64value : ( Sign )? ( Digit ( (Digit_16 Digit_02)
                               | (Digit_16 Digit)
                               | (Digit_16)
                               | (Digit_08 Digit_04 Digit_02 Digit)
                               | (Digit_08 Digit_04 Digit_02)
                               | (Digit_08 Digit_04 Digit)
                               | (Digit_08 Digit_04)
                               | (Digit_08 Digit_02 Digit)
                               | (Digit_08 Digit_02)
                               | (Digit_08 Digit)
                               | (Digit_08)
                               | (Digit_04 Digit_02 Digit)
                               | (Digit_04 Digit_02)
                               | (Digit_04 Digit)
                               | (Digit_04)
                               | (Digit_02 Digit)
                               | (Digit_02)
                               | Digit?
                               )
                        )
             ; // numbers in the range from -9223372036854775808 to 9223372036854775807

addexpr   : ( ' ' | '\u0009' )+ Add   ( ' ' | '\u0009' )+ commonexpr;
subexpr   : ( ' ' | '\u0009' )+ Sub   ( ' ' | '\u0009' )+ commonexpr;
mulexpr   : ( ' ' | '\u0009' )+ Mul   ( ' ' | '\u0009' )+ commonexpr;
divexpr   : ( ' ' | '\u0009' )+ Div   ( ' ' | '\u0009' )+ commonexpr;
divbyexpr : ( ' ' | '\u0009' )+ Divby ( ' ' | '\u0009' )+ commonexpr;
modexpr   : ( ' ' | '\u0009' )+ Mod   ( ' ' | '\u0009' )+ commonexpr;

negateexpr : '-' ( ' ' | '\u0009' )* commonexpr;

notexpr : Not ( ' ' | '\u0009' )+ boolcommonexpr;

isofexpr : Isof '(' ( ' ' | '\u0009' )* ( commonexpr ( ' ' | '\u0009' )* ',' ( ' ' | '\u0009' )* )? optionallyqualifiedtypename ( ' ' | '\u0009' )* ')';
castexpr : Cast '(' ( ' ' | '\u0009' )* ( commonexpr ( ' ' | '\u0009' )* ',' ( ' ' | '\u0009' )* )? optionallyqualifiedtypename ( ' ' | '\u0009' )* ')';

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
                 | string_1                     // single-quoted
                 | duration
                 | enum_1
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

decimalvalue : ( Sign? Digit+ ( '.' Digit+ )? ( E Sign? Digit+ )? )
             | naninfinity
             ;
doublevalue  : decimalvalue; // IEEE 754 binary64 floating-point number (15-17 decimal digits)
singlevalue  : decimalvalue; // IEEE 754 binary32 floating-point number (6-9 decimal digits)
naninfinity  : 'NaN' | '-INF' | 'INF';

bytevalue  : (Digit (Digit_02 | Digit?));           // numbers in the range from 0 to 255
sbytevalue : ( Sign )? (Digit (Digit_02 | Digit?));  // numbers in the range from -128 to 127
int16value : ( Sign )? (Digit (
                                Digit_04
                              | (Digit_02 Digit)
                              | Digit_02
                              | Digit?
                              )
                        )
           ;  // numbers in the range from -32768 to 32767
int32value : ( Sign )? (Digit (
                                (Digit_08 Digit)
                              | Digit_08
                              | (Digit_04 Digit_02 Digit)
                              | (Digit_04 Digit_02)
                              | (Digit_04 Digit)
                              | Digit_04
                              | (Digit_02 Digit)
                              | Digit_02
                              | Digit?
                              )
                         )
          ; // numbers in the range from -2147483648 to 2147483647
string_1           : '\'' ( squote_in_string | Pchar_no_squote )* '\'';
squote_in_string : '\'' '\''; // two consecutive single quotes represent one within a string literal

guidvalue : Hexdigit8 '-' Hexdigit4 '-' Hexdigit4 '-' Hexdigit4 '-' Hexdigit12;

datevalue : year '-' month '-' day;

datetimeoffsetvalue      : year '-' month '-' day T timeofdayvalue      ( Z | (Sign hour ':' minute) );
datetimeoffsetvalueinurl : year '-' month '-' day T timeofdayvalueinurl ( Z | (Sign hour ':' minute) );

duration      : ( D U R T I O N )? '\'' durationvalue '\'';
durationvalue : ( Sign )? P ( Digit+ D )? ( T ( Digit+ H )? ( Digit+ M )? ( Digit+ ( '.' Digit+ )? S )? )?;
     // the above is an approximation of the rules for an xml dayTimeDuration.
     // see the lexical representation for dayTimeDuration in http://www.w3.org/TR/xmlschema11-2#dayTimeDuration for more information

timeofdayvalue      : hour COLON   minute ( COLON   second ( PERIOD fractionalseconds )? )?;
timeofdayvalueinurl : hour ':' minute ( ':' second ( PERIOD fractionalseconds )? )?;

onetonine       : ONE | TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE;
zerotofiftynine : ( ZERO | ONE | TWO | THREE | FOUR | FIVE ) Digit;
year  : ( '-' )? ( (ZERO (Digit Digit Digit)) | (onetonine (Digit_02 Digit+)) );
month : (ZERO onetonine)
      | (ONE ( ZERO | ONE | TWO ));
day   : (ZERO onetonine)
      | (( ONE | TWO ) Digit)
      | (THREE ( ZERO | ONE ));
hour   : (( ZERO | ONE ) Digit)
       | (TWO ( ZERO | ONE | TWO | THREE ));
minute : zerotofiftynine;
second : zerotofiftynine | (SIX ZERO); // for leap seconds
fractionalseconds : (Digit (
                          (Digit_08 Digit_02 Digit)
                        | (Digit_08 Digit_02t)
                        | (Digit_08 Digit)
                        | (Digit_08)
                        | (Digit_04 Digit_02 Digit)
                        | (Digit_04 Digit_02)
                        | (Digit_04 Digit)
                        | (Digit_04)
                        | (Digit_02 Digit)
                        | (Digit_02)
                        | Digit?
                        )
                     )
                   ;

geographycollection   : geographyprefix '\'' fullcollectionliteral '\'';
fullcollectionliteral : sridliteral collectionliteral;
collectionliteral     : Collection '(' geoliteral ( ',' geoliteral )* ')';

Collection: C O L L E C T I O N ;
geoliteral            : collectionliteral
                      | linestringliteral
                      | multipointliteral
                      | multilinestringliteral
                      | multipolygonliteral
                      | pointliteral
                      | polygonliteral;

geographylinestring   : geographyprefix '\'' fulllinestringliteral '\'';
fulllinestringliteral : sridliteral linestringliteral;
linestringliteral     : Linestring linestringdata;
linestringdata        : '(' positionliteral ( ',' positionliteral )+ ')';

Linestring : L I N E S T R I N G ;
geographymultilinestring   : geographyprefix '\'' fullmultilinestringliteral '\'';
fullmultilinestringliteral : sridliteral multilinestringliteral;
multilinestringliteral     : Multilinestring '(' ( linestringdata ( ',' linestringdata )* )? ')';

Multilinestring: M U L T I Linestring ;
geographymultipoint   : geographyprefix '\'' fullmultipointliteral '\'';
fullmultipointliteral : sridliteral multipointliteral;
multipointliteral     : Multipoint '(' ( pointdata ( ',' pointdata )* )? ')';

Multipoint: M U L T I Point ;
geographymultipolygon   : geographyprefix '\'' fullmultipolygonliteral '\'';
fullmultipolygonliteral : sridliteral multipolygonliteral;
multipolygonliteral     : Multipolygon '(' ( polygondata ( ',' polygondata )* )? ')';

Multipolygon : M U L T I Polygon ;

geographypoint   : geographyprefix '\'' fullpointliteral '\'';
fullpointliteral : sridliteral pointliteral;
sridliteral      : S R I D '=' (Digit (
                                        (Digit_04)
                                      | (Digit_02 Digit)
                                      | (Digit_02)
                                      | Digit?
                                      )
                                 ) ';'
                 ;
pointliteral     : Point pointdata;
Point : P O I N T ;
pointdata        : '(' positionliteral ')';
positionliteral  : doublevalue ' ' doublevalue ( ' ' doublevalue )? ( ' ' doublevalue )?; // longitude, latitude, altitude/elevation (optional), linear referencing measure (optional)

geographypolygon   : geographyprefix '\'' fullpolygonliteral '\'';
fullpolygonliteral : sridliteral polygonliteral;
polygonliteral     : Polygon polygondata;
Polygon : P O L Y G O N ;
polygondata        : '(' ringliteral ( ',' ringliteral )* ')';
ringliteral        : '(' positionliteral ( ',' positionliteral )* ')';
                   // Within each ringLiteral, the first and last positionLiteral elements MUST be an exact syntactic match to each other.
                   // Within the polygonData, the ringLiterals MUST specify their points in appropriate winding order.
                   // In order of traversal, points to the left side of the ring are interpreted as being in the polygon.

geometrycollection      : geometryprefix '\'' fullcollectionliteral      '\'';
geometrylinestring      : geometryprefix '\'' fulllinestringliteral      '\'';
geometrymultilinestring : geometryprefix '\'' fullmultilinestringliteral '\'';
geometrymultipoint      : geometryprefix '\'' fullmultipointliteral      '\'';
geometrymultipolygon    : geometryprefix '\'' fullmultipolygonliteral    '\'';
geometrypoint           : geometryprefix '\'' fullpointliteral           '\'';
geometrypolygon         : geometryprefix '\'' fullpolygonliteral         '\'';

geographyprefix : Geography ;
geometryprefix  : Geometry ;

Geography : G E O G R A P H Y ;
Geometry: G E O M E T R Y ;





// Lexer layer

Hexdigit12 : Hexdigit8 Hexdigit4;
Hexdigit8 : Hexdigit4 Hexdigit4;
Hexdigit4 : Hexdigit Hexdigit Hexdigit Hexdigit;

Any : A N Y ;
All : A L L ;

Each : E A C H ;
Count : C O U N T ;
Ref : R E F ;
Value : V A L U E ;

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

As : A S ;

Asc : A S C ;
Desc : D E S C ;

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

Sign: '+' | '-';

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

Unreserved : Identifierleadingcharacter | Digit | '-' | '.' | '~';


Qchar_no_amp_eq_at_dollar : Unreserved |  Otherdelims | ':' |       '/' | '?' |       '\'';
Qchar_no_amp_eq           : Unreserved |  Otherdelims | ':' | '@' | '/' | '?' | '$' | '\'';
Qchar_no_amp              : Unreserved |  Otherdelims | ':' | '@' | '/' | '?' | '$' | '\'' | '=';
Qchar_no_amp_squote       : Unreserved |  Otherdelims | ':' | '@' | '/' | '?' | '$' |       '=';
Qchar_no_amp_dquote       : Unreserved |  Otherdelims | ':' | '@' | '/' | '?' | '$' | '\'' | '=';

Qcharunescaped            : Unreserved | Otherdelims | ':' | '@' | '/' | '?' | '$' | '\'' | '=';
Subdelimins     :       '$' | '&' | '\'' |                                     '=' | Otherdelims;
Otherdelims : '!' |                   '(' | ')' | '*' | '+' | ',' | ';';
Pchar         : Unreserved | Subdelimins | ':' | '@';

Digit_16 : Digit_08 Digit_08 ;
Digit_08 : Digit_04 Digit_04 ;
Digit_04 : Digit_02 Digit_02 ;
Digit_02 : Digit Digit ;

Alpha : A | B | C | D | E | F | G | H | I | J | K | L | M | N |O | P | Q | R | S | T | U | V | W | X |Y | Z;
Hexdigit : Digit | A | B | C | D | E | F ;
Digit : DIGIT;


INTEGER: DIGIT
       | NON_ZERO DIGIT+
       ;

fragment DIGIT: ZERO | NON_ZERO;
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
