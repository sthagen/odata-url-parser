// Contents:
//   1. Resource Path
//   2. Query Options
//   3. Context URL Fragments
//   4. Expressions
//   5. JSON format for function parameters
//   6. Names and identifiers
//   7. Literal Data Values
//   8. Header values
//   9. Punctuation
//
//   A. URI syntax [RFC3986]
//   B. IRI syntax [RFC3986]
//   C. ABNF core definitions [RFC5234]
//
//------------------------------------------------------------------------------
grammar QueryOptions;

queryoptions : queryoption ( AMPERSAND queryoption )*;

//------------------------------------------------------------------------------
// 1. Resource Path
//------------------------------------------------------------------------------

collectionnavigation : ( SLASH optionallyqualifiedentitytypename )? ( collectionnavpath )?;
collectionnavpath    : (keypredicate ( singlenavigation )?)
                     | (filterinpath ( collectionnavigation )?)
                     | (each ( boundoperation )?)
                     | boundoperation
                     | count
                     | ref_1
                     | querysegment;

keypredicate     : simplekey | compoundkey | keypathsegments;
simplekey        : open ( parameteralias | keypropertyvalue ) close;
compoundkey      : open keyvaluepair ( comma keyvaluepair )* close;
keyvaluepair     : ( primitivekeyproperty | keypropertyalias  ) eq ( parameteralias | keypropertyvalue );
keypropertyvalue : primitiveliteral;
keypropertyalias : odataidentifier;
keypathsegments  : ( SLASH keypathliteral )+;
keypathliteral   : pchar*;

singlenavigation : ( SLASH optionallyqualifiedentitytypename )?
                   ( (SLASH propertypath)
                   | boundoperation
                   | ref_1
                   | value  // request the media resource of a media entity
                   | querysegment
                   )?;

propertypath : (entitycolnavigationproperty ( collectionnavigation )?)
             | (entitynavigationproperty    ( singlenavigation )?)
             | (complexcolproperty          ( complexcolpath )?)
             | (complexproperty             ( complexpath )?)
             | (primitivecolproperty        ( primitivecolpath )?)
             | (primitiveproperty           ( primitivepath )?)
             | (streamproperty              ( boundoperation )?);

primitivecolpath : count | boundoperation | ordinalindex | querysegment;

primitivepath  : value | boundoperation | querysegment;

complexcolpath : ordinalindex
               | (( SLASH optionallyqualifiedcomplextypename )? ( count | boundoperation | querysegment )?);

complexpath    : ( SLASH optionallyqualifiedcomplextypename )?
                 ( (SLASH propertypath)
                 | boundoperation
                 | querysegment
                 )?;

filterinpath : (SLASH DOLLAR F I L T E R) open boolcommonexpr close;

each  : (SLASH DOLLAR E A C H);
count : (SLASH DOLLAR C O U N T);
ref_1   : (SLASH DOLLAR R E F);
value : (SLASH DOLLAR V A L U E);

querysegment : (SLASH DOLLAR Q U E R Y);

ordinalindex : SLASH digit+;

// boundOperation segments can only be composed if the type of the previous segment
// matches the type of the first parameter of the action or function being called.
// Note that the rule name reflects the return type of the function.
boundoperation : SLASH ( boundactioncall
                     | (boundentitycolfunctioncall    ( collectionnavigation )?)
                     | (boundentityfunctioncall       ( singlenavigation )?)
                     | (boundcomplexcolfunctioncall   ( complexcolpath )?)
                     | (boundcomplexfunctioncall      ( complexpath )?)
                     | (boundprimitivecolfunctioncall ( primitivecolpath )?)
                     | (boundprimitivefunctioncall    ( primitivepath )?)
                     | (boundfunctioncallnoparens     ( querysegment )?)
                     );

actionimportcall : actionimport;
boundactioncall  : ( namespace_1 PERIOD )? action;
                   // with the added restriction that the binding parameter MUST be either an entity or collection of entities
                   // and is specified by reference using the URI immediately preceding (to the left) of the boundActionCall

// The following boundXxxFunctionCall rules have the added restrictions that
//  - the function MUST support binding, and
//  - the binding parameter type MUST match the type of resource identified by the
//    URI immediately preceding (to the left) of the boundXxxFunctionCall, and
//  - the functionParameters MUST NOT include the bindingParameter.
boundentityfunctioncall       : ( namespace_1 PERIOD )? entityfunction       functionparameters;
boundentitycolfunctioncall    : ( namespace_1 PERIOD )? entitycolfunction    functionparameters;
boundcomplexfunctioncall      : ( namespace_1 PERIOD )? complexfunction      functionparameters;
boundcomplexcolfunctioncall   : ( namespace_1 PERIOD )? complexcolfunction   functionparameters;
boundprimitivefunctioncall    : ( namespace_1 PERIOD )? primitivefunction    functionparameters;
boundprimitivecolfunctioncall : ( namespace_1 PERIOD )? primitivecolfunction functionparameters;

boundfunctioncallnoparens     : (( namespace_1 PERIOD )? entityfunction)
                              | (( namespace_1 PERIOD )? entitycolfunction)
                              | (( namespace_1 PERIOD )? complexfunction)
                              | (( namespace_1 PERIOD )? complexcolfunction)
                              | (( namespace_1 PERIOD )? primitivefunction)
                              | (( namespace_1 PERIOD )? primitivecolfunction);

entityfunctionimportcall       : entityfunctionimport       functionparameters;
entitycolfunctionimportcall    : entitycolfunctionimport    functionparameters;
complexfunctionimportcall      : complexfunctionimport      functionparameters;
complexcolfunctionimportcall   : complexcolfunctionimport   functionparameters;
primitivefunctionimportcall    : primitivefunctionimport    functionparameters;
primitivecolfunctionimportcall : primitivecolfunctionimport functionparameters;

functionimportcallnoparens     : entityfunctionimport
                               | entitycolfunctionimport
                               | complexfunctionimport
                               | complexcolfunctionimport
                               | primitivefunctionimport
                               | primitivecolfunctionimport;

functionparameters : open ( functionparameter ( comma functionparameter )* )? close;
functionparameter  : parametername eq ( parameteralias | primitiveliteral );
parametername      : odataidentifier;
parameteralias     : at odataidentifier;

crossjoin : (DOLLAR C R O S S J O I N) open
            entitysetname ( comma entitysetname )*
            close;


//------------------------------------------------------------------------------
// 2. Query Options
//------------------------------------------------------------------------------

queryoption  : systemqueryoption
             | aliasandvalue
             | nameandvalue
             | customqueryoption;

batchoptions : batchoption ( AMPERSAND batchoption )*;
batchoption  : format
             |customqueryoption;

metadataoptions : metadataoption ( AMPERSAND metadataoption )*;
metadataoption  : format
                |customqueryoption;

entityoptions  : ( entityidoption AMPERSAND )* id ( AMPERSAND entityidoption )*;
entityidoption : format
               | customqueryoption;
entitycastoptions : ( entitycastoption AMPERSAND )* id ( AMPERSAND entitycastoption )*;
entitycastoption  : entityidoption
                  | expand
                  | select;

id : ( (DOLLAR (CAP_I | I) (CAP_D | D)) | ((CAP_I | I) (CAP_D | D)) ) eq iri_in_query;

systemqueryoption : compute
                  | deltatoken
                  | expand
                  | filter
                  | format
                  | id
                  | inlinecount
                  | orderby
                  | schemaversion
                  | search
                  | select
                  | skip
                  | skiptoken
                  | top
                  | index;

compute          : ( (DOLLAR (CAP_C | C) (CAP_O | O) (CAP_M | M) (CAP_P | P) (CAP_U | U) (CAP_T | T) (CAP_E | E)) | ((CAP_C | C) (CAP_O | O) (CAP_M | M) (CAP_P | P) (CAP_U | U) (CAP_T | T) (CAP_E | E)) ) eq computeitem ( comma computeitem )*;
computeitem      : commonexpr rws ((CAP_A | A) (CAP_S | S)) rws computedproperty;
computedproperty : odataidentifier;

expand            : ( (DOLLAR (CAP_E | E) (CAP_X | X) (CAP_P | P) (CAP_A | A) (CAP_N | N) (CAP_D | D)) | ((CAP_E | E) (CAP_X | X) (CAP_P | P) (CAP_A | A) (CAP_N | N) (CAP_D | D)) ) eq expanditem ( comma expanditem )*;
expanditem        : (DOLLAR (CAP_V | V) (CAP_A | A) (CAP_L | L) (CAP_U | U) (CAP_E | E))
                  | expandpath
                  | (optionallyqualifiedentitytypename SLASH expandpath);
expandpath        : ( ( complexproperty | complexcolproperty | optionallyqualifiedcomplextypename | complexannotationinquery ) SLASH )*
                    ( (star ( ref_1 | (open levels close) )?)
                    | streamproperty
                    | (( navigationproperty | entityannotationinquery ) ( SLASH optionallyqualifiedentitytypename )?
                      ( (ref_1   ( open expandrefoption   ( semi expandrefoption   )* close )?)
                      | (count ( open expandcountoption ( semi expandcountoption )* close )?)
                      |         (open expandoption      ( semi expandoption      )* close)
                      )?)
                    );
expandcountoption : filter
                  | search;
expandrefoption   : expandcountoption
                  | orderby
                  | skip
                  | top
                  | inlinecount;
expandoption      : expandrefoption
                  | select
                  | expand
                  | compute
                  | levels
                  | aliasandvalue;

levels : ( (DOLLAR (CAP_L | L) (CAP_E | E) (CAP_V | V) (CAP_E | E) (CAP_L | L) (CAP_S | S)) | ((CAP_L | L) (CAP_E | E) (CAP_V | V) (CAP_E | E) (CAP_L | L) (CAP_S | S)) ) eq ( (onetonine digit*) | ((CAP_M | M) (CAP_A | A) (CAP_X | X)) );

filter : ( (DOLLAR (CAP_F | F) (CAP_I | I) (CAP_L | L) (CAP_T | T) (CAP_E | E) (CAP_R | R)) | ((CAP_F | F) (CAP_I | I) (CAP_L | L) (CAP_T | T) (CAP_E | E) (CAP_R | R)) ) eq boolcommonexpr;

orderby     : ( (DOLLAR (CAP_O | O) (CAP_R | R) (CAP_D | D) (CAP_E | E) (CAP_R | R) (CAP_B | B) (CAP_Y | Y)) | ((CAP_O | O) (CAP_R | R) (CAP_D | D) (CAP_E | E) (CAP_R | R) (CAP_B | B) (CAP_Y | Y)) ) eq orderbyitem ( comma orderbyitem )*;
orderbyitem : commonexpr ( rws ( ((CAP_A | A) (CAP_S | S) (CAP_C | C)) | ((CAP_D | D) (CAP_E | E) (CAP_S | S) (CAP_C | C)) ) )?;

skip : ( (DOLLAR (CAP_S | S) (CAP_K | K) (CAP_I | I) (CAP_P | P)) | ((CAP_S | S) (CAP_K | K) (CAP_I | I) (CAP_P | P)) ) eq digit+;
top  : ( (DOLLAR (CAP_T | T) (CAP_O | O) (CAP_P | P))  | ((CAP_T | T) (CAP_O | O) (CAP_P | P))  ) eq digit+;

index  : ( (DOLLAR (CAP_I | I) (CAP_N | N) (CAP_D | D) (CAP_E | E) (CAP_X | X)) | ((CAP_I | I) (CAP_N | N) (CAP_D | D) (CAP_E | E) (CAP_X | X)) ) eq ( DASH )? digit+;

format : ( (DOLLAR (CAP_F | F) (CAP_O | O) (CAP_R | R) (CAP_M | M) (CAP_A | A) (CAP_T | T)) | ((CAP_F | F) (CAP_O | O) (CAP_R | R) (CAP_M | M) (CAP_A | A) (CAP_T | T)) ) eq
         ( ((CAP_A | A) (CAP_T | T) (CAP_O | O) (CAP_M | M))
         | ((CAP_J | J) (CAP_S | S) (CAP_O | O) (CAP_N | N))
         | ((CAP_X | X) (CAP_M | M) (CAP_L | L))
         | (pchar+ SLASH pchar+) // <a data service specific value indicating a
         );                     // format specific to the specific data service> or
                               // <An IANA-defined [IANA-MMT] content type>

inlinecount : ( (DOLLAR (CAP_C | C) (CAP_O | O) (CAP_U | U) (CAP_N | N) (CAP_T | T)) | ((CAP_C | C) (CAP_O | O) (CAP_U | U) (CAP_N | N) (CAP_T | T)) ) eq booleanvalue;

schemaversion   : ( (DOLLAR (CAP_S | S) (CAP_C | C) (CAP_H | H) (CAP_E | E) (CAP_M | M) (CAP_A | A) (CAP_V | V) (CAP_E | E) (CAP_R | R) (CAP_S | S) (CAP_I | I) (CAP_O | O) (CAP_N | N)) | ((CAP_S | S) (CAP_C | C) (CAP_H | H) (CAP_E | E) (CAP_M | M) (CAP_A | A) (CAP_V | V) (CAP_E | E) (CAP_R | R) (CAP_S | S) (CAP_I | I) (CAP_O | O) (CAP_N | N)) ) eq ( star | unreserved+ );

search     : ( (DOLLAR (CAP_S | S) (CAP_E | E) (CAP_A | A) (CAP_R | R) (CAP_C | C) (CAP_H | H)) | ((CAP_S | S) (CAP_E | E) (CAP_A | A) (CAP_R | R) (CAP_C | C) (CAP_H | H)) ) eq bws ( searchexpr | searchexpr_incomplete );

searchexpr : ( searchparenexpr
             | searchnegateexpr
             | searchphrase
             | searchword
             ) ( searchorexpr
               | searchandexpr
               )?;
searchparenexpr : open bws searchexpr bws close;

// NOT is a unary operator if followed by a search expression
searchnegateexpr : (CAP_N CAP_O CAP_T) rws searchexpr;

// AND and OR are binary operators if they appear between search expressions
searchorexpr  : rws (CAP_O CAP_R)  rws searchexpr;
searchandexpr : rws ( (CAP_A CAP_N CAP_D) rws )? searchexpr;

searchphrase : quotation_mark ( qchar_no_amp_dquote | sp )+ quotation_mark;

// A searchWord is a sequence of one or more non-whitespace characters, excluding
// - literal or percent-encoded parentheses "(", "%28", "%29", ")"
// - literal or percent-encoded double-quotes '"' and "%22"
// - the semicolon ";"
// Percent-encoding is allowed, and required for characters with special meaning in the query part of a URL, especially "&" and "#".
// Expressing this in ABNF is somewhat clumsy, so the following rule is overly generous.
// Note: the words AND, OR, and NOT are sometimes operators, depending on their position within a search expression.
searchword : searchchar ( searchchar | squote )*;
searchchar : unreserved | EXCLAMATION | ASTERISK | PLUS | COMMA | COLON | AT | SLASH | QUESTION | DOLLAR | EQUALS;

searchexpr_incomplete : squote ( squote_in_string | qchar_no_amp_squote | quotation_mark | sp )* squote;


select         : ( (DOLLAR (CAP_S | S) (CAP_E | E) (CAP_L | L) (CAP_E | E) (CAP_C | C) (CAP_T | T)) | ((CAP_S | S) (CAP_E | E) (CAP_L | L) (CAP_E | E) (CAP_C | C) (CAP_T | T)) ) eq selectitem ( comma selectitem )*;
selectitem     : star
               | alloperationsinschema
               | selectproperty
               | optionallyqualifiedactionname
               | optionallyqualifiedfunctionname
               | (( optionallyqualifiedentitytypename | optionallyqualifiedcomplextypename )
                 SLASH ( selectproperty
                     | optionallyqualifiedactionname
                     | optionallyqualifiedfunctionname
                     ));
selectproperty : primitiveproperty | primitiveannotationinquery
               | (( primitivecolproperty | primitivecolannotationinquery ) ( open selectoptionpc ( semi selectoptionpc )* close )?)
               | navigationproperty
               | (selectpath ( (open selectoption ( semi selectoption )* close)
                            | (SLASH selectproperty)
                            )?);
selectpath     : ( complexproperty | complexcolproperty | complexannotationinquery ) ( SLASH optionallyqualifiedcomplextypename )?;
selectoptionpc : filter | search | inlinecount | orderby | skip | top;
selectoption   : selectoptionpc
               | compute | select | aliasandvalue;

alloperationsinschema : namespace_1 PERIOD star;

// The parameterNames uniquely identify the bound function overload
// Necessary only if it has overloads
optionallyqualifiedactionname   : ( namespace_1 PERIOD )? action;
optionallyqualifiedfunctionname : ( namespace_1 PERIOD )? function ( open parameternames close )?;

// The names of all non-binding parameters, separated by commas
parameternames : parametername ( comma parametername )*;

deltatoken : (DOLLAR (CAP_D | D) (CAP_E | E) (CAP_L | L) (CAP_T | T) (CAP_A | A) (CAP_T | T) (CAP_O | O) (CAP_K | K) (CAP_E | E) (CAP_N | N)) eq ( qchar_no_amp )+;

skiptoken : (DOLLAR (CAP_S | S) (CAP_K | K) (CAP_I | I) (CAP_P | P) (CAP_T | T) (CAP_O | O) (CAP_K | K) (CAP_E | E) (CAP_N | N)) eq ( qchar_no_amp )+;

aliasandvalue : parameteralias eq parametervalue;

nameandvalue : parametername eq parametervalue;

parametervalue : arrayorobject
               | commonexpr;

customqueryoption : customname ( eq customvalue )?;
customname        : qchar_no_amp_eq_at_dollar ( qchar_no_amp_eq )*;
customvalue       : ( qchar_no_amp )*;

complexannotationinquery : annotationinquery; // complex-valued annotation
entityannotationinquery  : annotationinquery; // entity-valued annotation

primitiveannotationinquery    : annotationinquery; // primitive-valued annotation
primitivecolannotationinquery : annotationinquery; // primitive collection-valued annotation

//------------------------------------------------------------------------------
// 3. Context URL Fragments
//------------------------------------------------------------------------------

context         : HASH contextfragment;
contextfragment : (CAP_C O L L E C T I O N LEFT_PAREN DOLLAR R E F RIGHT_PAREN)
                | (DOLLAR R E F)
                | (CAP_C O L L E C T I O N LEFT_PAREN CAP_E D M PERIOD CAP_E N T I T Y CAP_T Y P E RIGHT_PAREN)
                | (CAP_C O L L E C T I O N LEFT_PAREN CAP_E D M PERIOD CAP_C O M P L E X CAP_T Y P E RIGHT_PAREN)
                | (singletonentity ( navigation ( containmentnavigation )* ( SLASH qualifiedentitytypename )? )? ( selectlist )?)
                | (qualifiedtypename ( selectlist )?)
                | (entityset ( (SLASH DOLLAR D E L E T E D CAP_E N T I T Y) | (SLASH DOLLAR L I N K) | (SLASH DOLLAR D E L E T E D CAP_L I N K) ))
                | (entityset keypredicate SLASH contextpropertypath ( selectlist )?)
                | (entityset ( selectlist )? ( (SLASH DOLLAR E N T I T Y) | (SLASH DOLLAR D E L T A) )?);

entityset : entitysetname ( containmentnavigation )* ( SLASH qualifiedentitytypename )?;

containmentnavigation : keypredicate ( SLASH qualifiedentitytypename )? navigation;
navigation            : ( SLASH complexproperty ( SLASH qualifiedcomplextypename )? )* SLASH navigationproperty;

selectlist         : open ( selectlistitem ( comma selectlistitem )* )? close;
selectlistitem     : star // all structural properties
                   | alloperationsinschema
                   | (( ( qualifiedentitytypename | qualifiedcomplextypename ) SLASH )?
                     ( qualifiedactionname
                     | qualifiedfunctionname
                     | selectlistproperty
                     ));
selectlistproperty : primitiveproperty
                   | primitivecolproperty
                   | (( navigationproperty | entityannotationinfragment ) ( PLUS )? ( selectlist )?)
                   | (( complexproperty | complexcolproperty | complexannotationinfragment ) ( SLASH qualifiedcomplextypename )? ( SLASH selectlistproperty )?);

contextpropertypath : primitiveproperty
                    | primitivecolproperty
                    | complexcolproperty
                    | (complexproperty ( ( SLASH qualifiedcomplextypename )? SLASH contextpropertypath )?);

qualifiedactionname   : namespace_1 PERIOD action;
qualifiedfunctionname : namespace_1 PERIOD function ( open parameternames close )?;

complexannotationinfragment : annotationinfragment; // complex-valued annotation
entityannotationinfragment  : annotationinfragment; // entity-valued annotation

//------------------------------------------------------------------------------
// 4. Expressions
//------------------------------------------------------------------------------

// Note: a boolCommonExpr is also a commonExpr, e.g. sort by Boolean
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
             )?;

boolcommonexpr : commonexpr; // resulting in a Boolean

rootexpr : (DOLLAR R O O T SLASH) ( (entitysetname keypredicate) | singletonentity ) ( singlenavigationexpr )?;

firstmemberexpr : memberexpr
                | (inscopevariableexpr ( SLASH memberexpr )?);

memberexpr : directmemberexpr
           | (( optionallyqualifiedentitytypename | optionallyqualifiedcomplextypename ) SLASH directmemberexpr);

directmemberexpr : propertypathexpr
                 | boundfunctionexpr
                 | annotationexpr;

propertypathexpr : ( (entitycolnavigationproperty ( collectionnavigationexpr )?)
                   | (entitynavigationproperty    ( singlenavigationexpr )?)
                   | (complexcolproperty          ( complexcolpathexpr )?)
                   | (complexproperty             ( complexpathexpr )?)
                   | (primitivecolproperty        ( collectionpathexpr )?)
                   | (primitiveproperty           ( primitivepathexpr )?)
                   | (streamproperty              ( primitivepathexpr )?)
                   );

annotationexpr : annotationinquery
                 ( collectionpathexpr
                 | singlenavigationexpr
                 | complexpathexpr
                 | primitivepathexpr
                 )?;

annotationinquery    : at ( namespace_1 PERIOD )? termname ( hash annotationqualifier )?;
annotationinfragment : at ( namespace_1 PERIOD )? termname ( HASH  annotationqualifier )?;
annotationqualifier  : odataidentifier;

inscopevariableexpr  : implicitvariableexpr
                     | parameteralias
                     | lambdavariableexpr; // only allowed inside a lambdaPredicateExpr
implicitvariableexpr : (DOLLAR I T)              // the current instance of the resource identified by the resource path
                     | (DOLLAR T H I S);            // the instance on which the query option is evaluated
lambdavariableexpr   : odataidentifier;

collectionnavigationexpr : ( SLASH optionallyqualifiedentitytypename )?
                           ( collectionpathexpr
                           | (keypredicate ( singlenavigationexpr )?)
                           | (filterexpr ( collectionnavigationexpr )?)
                           );

singlenavigationexpr : SLASH memberexpr;

filterexpr : (SLASH DOLLAR F I L T E R) open boolcommonexpr close;

complexcolpathexpr : collectionpathexpr
                   | (SLASH optionallyqualifiedcomplextypename ( collectionpathexpr )?);

collectionpathexpr : (count ( open expandcountoption ( semi expandcountoption )* close )?)
                   | (filterexpr ( collectionpathexpr )?)
                   | (SLASH anyexpr)
                   | (SLASH allexpr)
                   | (SLASH boundfunctionexpr)
                   | (SLASH annotationexpr);

complexpathexpr : (SLASH directmemberexpr)
                | (SLASH optionallyqualifiedcomplextypename ( SLASH directmemberexpr )?);

primitivepathexpr : SLASH ( annotationexpr | boundfunctionexpr )?;

boundfunctionexpr : functionexpr; // boundFunction segments can only be composed if the type of the
                                 // previous segment matches the type of the first function parameter

functionexpr : ( namespace_1 PERIOD )?
               ( (entitycolfunction    functionexprparameters ( collectionnavigationexpr )?)
               | (entityfunction       functionexprparameters ( singlenavigationexpr )?)
               | (complexcolfunction   functionexprparameters ( complexcolpathexpr )?)
               | (complexfunction      functionexprparameters ( complexpathexpr )?)
               | (primitivecolfunction functionexprparameters ( collectionpathexpr )?)
               | (primitivefunction    functionexprparameters ( primitivepathexpr )?)
               );

functionexprparameters : open ( functionexprparameter ( comma functionexprparameter )* )? close;
functionexprparameter  : parametername eq ( parameteralias | parametervalue );

anyexpr : ((CAP_A | A) (CAP_N | N) (CAP_Y | Y)) open bws ( lambdavariableexpr bws colon bws lambdapredicateexpr )? bws close;
allexpr : ((CAP_A | A) (CAP_L | L) (CAP_L | L)) open bws   lambdavariableexpr bws colon bws lambdapredicateexpr   bws close;
lambdapredicateexpr : boolcommonexpr; // containing at least one lambdaVariableExpr

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
               | boolmethodcallexpr;

boolmethodcallexpr : endswithmethodcallexpr
                   | startswithmethodcallexpr
                   | containsmethodcallexpr
                   | intersectsmethodcallexpr
                   | hassubsetmethodcallexpr
                   | hassubsequencemethodcallexpr;

concatmethodcallexpr         : ((CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_C | C) (CAP_A | A) (CAP_T | T))         open bws commonexpr bws comma bws commonexpr bws close;
containsmethodcallexpr       : ((CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_T | T) (CAP_A | A) (CAP_I | I) (CAP_N | N) (CAP_S | S))       open bws commonexpr bws comma bws commonexpr bws close;
endswithmethodcallexpr       : ((CAP_E | E) (CAP_N | N) (CAP_D | D) (CAP_S | S) (CAP_W | W) (CAP_I | I) (CAP_T | T) (CAP_H | H))       open bws commonexpr bws comma bws commonexpr bws close;
indexofmethodcallexpr        : ((CAP_I | I) (CAP_N | N) (CAP_D | D) (CAP_E | E) (CAP_X | X) (CAP_O | O) (CAP_F | F))        open bws commonexpr bws comma bws commonexpr bws close;
lengthmethodcallexpr         : ((CAP_L | L) (CAP_E | E) (CAP_N | N) (CAP_G | G) (CAP_T | T) (CAP_H | H))         open bws commonexpr bws close;
matchespatternmethodcallexpr : ((CAP_M | M) (CAP_A | A) (CAP_T | T) (CAP_C | C) (CAP_H | H) (CAP_E | E) (CAP_S | S) (CAP_P | P) (CAP_A | A) (CAP_T | T) (CAP_T | T) (CAP_E | E) (CAP_R | R) (CAP_N | N)) open bws commonexpr bws comma bws commonexpr bws close;
startswithmethodcallexpr     : ((CAP_S | S) (CAP_T | T) (CAP_A | A) (CAP_R | R) (CAP_T | T) (CAP_S | S) (CAP_W | W) (CAP_I | I) (CAP_T | T) (CAP_H | H))     open bws commonexpr bws comma bws commonexpr bws close;
substringmethodcallexpr      : ((CAP_S | S) (CAP_U | U) (CAP_B | B) (CAP_S | S) (CAP_T | T) (CAP_R | R) (CAP_I | I) (CAP_N | N) (CAP_G | G))      open bws commonexpr bws comma bws commonexpr bws ( comma bws commonexpr bws )? close;
tolowermethodcallexpr        : ((CAP_T | T) (CAP_O | O) (CAP_L | L) (CAP_O | O) (CAP_W | W) (CAP_E | E) (CAP_R | R))        open bws commonexpr bws close;
touppermethodcallexpr        : ((CAP_T | T) (CAP_O | O) (CAP_U | U) (CAP_P | P) (CAP_P | P) (CAP_E | E) (CAP_R | R))        open bws commonexpr bws close;
trimmethodcallexpr           : ((CAP_T | T) (CAP_R | R) (CAP_I | I) (CAP_M | M))           open bws commonexpr bws close;

yearmethodcallexpr               : ((CAP_Y | Y) (CAP_E | E) (CAP_A | A) (CAP_R | R))               open bws commonexpr bws close;
monthmethodcallexpr              : ((CAP_M | M) (CAP_O | O) (CAP_N | N) (CAP_T | T) (CAP_H | H))              open bws commonexpr bws close;
daymethodcallexpr                : ((CAP_D | D) (CAP_A | A) (CAP_Y | Y))                open bws commonexpr bws close;
hourmethodcallexpr               : ((CAP_H | H) (CAP_O | O) (CAP_U | U) (CAP_R | R))               open bws commonexpr bws close;
minutemethodcallexpr             : ((CAP_M | M) (CAP_I | I) (CAP_N | N) (CAP_U | U) (CAP_T | T) (CAP_E | E))             open bws commonexpr bws close;
secondmethodcallexpr             : ((CAP_S | S) (CAP_E | E) (CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_D | D))             open bws commonexpr bws close;
fractionalsecondsmethodcallexpr  : ((CAP_F | F) (CAP_R | R) (CAP_A | A) (CAP_C | C) (CAP_T | T) (CAP_I | I) (CAP_O | O) (CAP_N | N) (CAP_A | A) (CAP_L | L) (CAP_S | S) (CAP_E | E) (CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_D | D) (CAP_S | S))  open bws commonexpr bws close;
totalsecondsmethodcallexpr       : ((CAP_T | T) (CAP_O | O) (CAP_T | T) (CAP_A | A) (CAP_L | L) (CAP_S | S) (CAP_E | E) (CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_D | D) (CAP_S | S))       open bws commonexpr bws close;
datemethodcallexpr               : ((CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_E | E))               open bws commonexpr bws close;
timemethodcallexpr               : ((CAP_T | T) (CAP_I | I) (CAP_M | M) (CAP_E | E))               open bws commonexpr bws close;
totaloffsetminutesmethodcallexpr : ((CAP_T | T) (CAP_O | O) (CAP_T | T) (CAP_A | A) (CAP_L | L) (CAP_O | O) (CAP_F | F) (CAP_F | F) (CAP_S | S) (CAP_E | E) (CAP_T | T) (CAP_M | M) (CAP_I | I) (CAP_N | N) (CAP_U | U) (CAP_T | T) (CAP_E | E) (CAP_S | S)) open bws commonexpr bws close;

mindatetimemethodcallexpr : ((CAP_M | M) (CAP_I | I) (CAP_N | N) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_E | E) (CAP_T | T) (CAP_I | I) (CAP_M | M) (CAP_E | E)) open bws close;
maxdatetimemethodcallexpr : ((CAP_M | M) (CAP_A | A) (CAP_X | X) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_E | E) (CAP_T | T) (CAP_I | I) (CAP_M | M) (CAP_E | E)) open bws close;
nowmethodcallexpr         : ((CAP_N | N) (CAP_O | O) (CAP_W | W))         open bws close;

roundmethodcallexpr   : ((CAP_R | R) (CAP_O | O) (CAP_U | U) (CAP_N | N) (CAP_D | D))   open bws commonexpr bws close;
floormethodcallexpr   : ((CAP_F | F) (CAP_L | L) (CAP_O | O) (CAP_O | O) (CAP_R | R))   open bws commonexpr bws close;
ceilingmethodcallexpr : ((CAP_C | C) (CAP_E | E) (CAP_I | I) (CAP_L | L) (CAP_I | I) (CAP_N | N) (CAP_G | G)) open bws commonexpr bws close;

distancemethodcallexpr   : ((CAP_G | G) (CAP_E | E) (CAP_O | O) PERIOD (CAP_D | D) (CAP_I | I) (CAP_S | S) (CAP_T | T) (CAP_A | A) (CAP_N | N) (CAP_C | C) (CAP_E | E))   open bws commonexpr bws comma bws commonexpr bws close;
geolengthmethodcallexpr  : ((CAP_G | G) (CAP_E | E) (CAP_O | O) PERIOD (CAP_L | L) (CAP_E | E) (CAP_N | N) (CAP_G | G) (CAP_T | T) (CAP_H | H))     open bws commonexpr bws close;
intersectsmethodcallexpr : ((CAP_G | G) (CAP_E | E) (CAP_O | O) PERIOD (CAP_I | I) (CAP_N | N) (CAP_T | T) (CAP_E | E) (CAP_R | R) (CAP_S | S) (CAP_E | E) (CAP_C | C) (CAP_T | T) (CAP_S | S)) open bws commonexpr bws comma bws commonexpr bws close;

hassubsetmethodcallexpr      : ((CAP_H | H) (CAP_A | A) (CAP_S | S) (CAP_S | S) (CAP_U | U) (CAP_B | B) (CAP_S | S) (CAP_E | E) (CAP_T | T))      open bws commonexpr bws comma bws commonexpr bws close;
hassubsequencemethodcallexpr : ((CAP_H | H) (CAP_A | A) (CAP_S | S) (CAP_S | S) (CAP_U | U) (CAP_B | B) (CAP_S | S) (CAP_E | E) (CAP_Q | Q) (CAP_U | U) (CAP_E | E) (CAP_N | N) (CAP_C | C) (CAP_E | E)) open bws commonexpr bws comma bws commonexpr bws close;

casemethodcallexpr : ((CAP_C | C) (CAP_A | A) (CAP_S | S) (CAP_E | E)) open bws boolcommonexpr bws colon bws commonexpr bws
                        ( comma bws boolcommonexpr bws colon bws commonexpr bws )* close;

parenexpr : open bws commonexpr bws close;
listexpr  : open bws primitiveliteral bws ( comma bws primitiveliteral bws )* close;

andexpr : rws ((CAP_A | A) (CAP_N | N) (CAP_D | D)) rws boolcommonexpr;
orexpr  : rws ((CAP_O | O) (CAP_R | R))  rws boolcommonexpr;

eqexpr : rws ((CAP_E | E) (CAP_Q | Q)) rws commonexpr;
neexpr : rws ((CAP_N | N) (CAP_E | E)) rws commonexpr;
ltexpr : rws ((CAP_L | L) (CAP_T | T)) rws commonexpr;
leexpr : rws ((CAP_L | L) (CAP_E | E)) rws commonexpr;
gtexpr : rws ((CAP_G | G) (CAP_T | T)) rws commonexpr;
geexpr : rws ((CAP_G | G) (CAP_E | E)) rws commonexpr;
inexpr : rws ((CAP_I | I) (CAP_N | N)) rws ( listexpr | commonexpr );

hasexpr : rws ((CAP_H | H) (CAP_A | A) (CAP_S | S)) rws enum_1;

addexpr   : rws ((CAP_A | A) (CAP_D | D) (CAP_D | D))   rws commonexpr;
subexpr   : rws ((CAP_S | S) (CAP_U | U) (CAP_B | B))   rws commonexpr;
mulexpr   : rws ((CAP_M | M) (CAP_U | U) (CAP_L | L))   rws commonexpr;
divexpr   : rws ((CAP_D | D) (CAP_I | I) (CAP_V | V))   rws commonexpr;
divbyexpr : rws ((CAP_D | D) (CAP_I | I) (CAP_V | V) (CAP_B | B) (CAP_Y | Y)) rws commonexpr;
modexpr   : rws ((CAP_M | M) (CAP_O | O) (CAP_D | D))   rws commonexpr;

negateexpr : DASH bws commonexpr;

notexpr : ((CAP_N | N) (CAP_O | O) (CAP_T | T)) rws boolcommonexpr;

isofexpr : ((CAP_I | I) (CAP_S | S) (CAP_O | O) (CAP_F | F)) open bws ( commonexpr bws comma bws )? optionallyqualifiedtypename bws close;
castexpr : ((CAP_C | C) (CAP_A | A) (CAP_S | S) (CAP_T | T)) open bws ( commonexpr bws comma bws )? optionallyqualifiedtypename bws close;


//------------------------------------------------------------------------------
// 5. JSON format for queries
//------------------------------------------------------------------------------
// Note: the query part of a URI needs to be percent-encoding normalized before
// applying these rules, see comment at the top of this file
//------------------------------------------------------------------------------

arrayorobject : array
              | object_1;

array : begin_array
        ( valueinurl ( value_separator valueinurl )* )?
        end_array;

object_1 : begin_object
         ( member ( value_separator member )* )?
         end_object;

member : stringinurl name_separator valueinurl;

valueinurl : stringinurl
           | commonexpr;

// JSON syntax: adapted to URI restrictions from [RFC8259]
begin_object : bws  LEFT_CURLY_BRACE  bws;
end_object   : bws  RIGHT_CURLY_BRACE;

begin_array : bws  LEFT_BRACE  bws;
end_array   : bws  RIGHT_BRACE;

quotation_mark  : dquote;
name_separator  : bws colon bws;
value_separator : bws comma bws;

stringinurl : quotation_mark charinjson* quotation_mark;

charinjson   : qchar_unescaped
             | qchar_json_special
             | (escape ( quotation_mark
                      | escape
                      | SLASH // solidus         U+002F - literal form is allowed in the query part of a URL
                      | B             // backspace       U+0008
                      | F             // form feed       U+000C
                      | N             // line feed       U+000A
                      | R             // carriage return U+000D
                      | T             // tab             U+0009
                      | (U (hexdig hexdig hexdig hexdig))     //                 U+XXXX
                      ));

qchar_json_special : sp | COLON | LEFT_CURLY_BRACE | RIGHT_CURLY_BRACE | LEFT_BRACE | RIGHT_BRACE; // some agents put these unencoded into the query part of a URL

escape : BACKSLASH;      // reverse solidus U+005C


//------------------------------------------------------------------------------
// 6. Names and identifiers
//------------------------------------------------------------------------------

qualifiedtypename : singlequalifiedtypename
                  | ((CAP_C O L L E C T I O N) open singlequalifiedtypename close);

optionallyqualifiedtypename : singlequalifiedtypename
                            | ((CAP_C O L L E C T I O N) open singlequalifiedtypename close)
                            | singletypename
                            | ((CAP_C O L L E C T I O N) open singletypename close);

singlequalifiedtypename : qualifiedentitytypename
                        | qualifiedcomplextypename
                        | qualifiedtypedefinitionname
                        | qualifiedenumtypename
                        | primitivetypename;

singletypename : entitytypename
               | complextypename
               | typedefinitionname
               | enumerationtypename;

qualifiedentitytypename     : namespace_1 PERIOD entitytypename;
qualifiedcomplextypename    : namespace_1 PERIOD complextypename;
qualifiedtypedefinitionname : namespace_1 PERIOD typedefinitionname;
qualifiedenumtypename       : namespace_1 PERIOD enumerationtypename;

optionallyqualifiedentitytypename     : ( namespace_1 PERIOD )? entitytypename;
optionallyqualifiedcomplextypename    : ( namespace_1 PERIOD )? complextypename;

// an alias is just a single-part namespace
namespace_1     : namespacepart ( PERIOD namespacepart )*;
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
odataidentifier             : identifierleadingcharacter (((identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter identifiercharacter) | (identifiercharacter identifiercharacter) | identifiercharacter?));
identifierleadingcharacter  : alpha | UNDERSCORE;         // plus Unicode characters from the categories L or Nl
identifiercharacter         : alpha | UNDERSCORE | digit; // plus Unicode characters from the categories L, Nl, Nd, Mn, Mc, Pc, or Cf

primitivetypename : (CAP_E D M PERIOD) ( (CAP_B I N A R Y)
                           | (CAP_B O O L E A N)
                           | (CAP_B Y T E)
                           | (CAP_D A T E)
                           | (CAP_D A T E CAP_T I M E CAP_O F F S E T)
                           | (CAP_D E C I M A L)
                           | (CAP_D O U B L E)
                           | (CAP_D U R A T I O N)
                           | (CAP_G U I D)
                           | (CAP_I N T ONE SIX)
                           | (CAP_I N T THREE TWO)
                           | (CAP_I N T SIX FOUR)
                           | (CAP_S CAP_B Y T E)
                           | (CAP_S I N G L E)
                           | (CAP_S T R E A M)
                           | (CAP_S T R I N G)
                           | (CAP_T I M E CAP_O F CAP_D A Y)
                           | (abstractspatialtypename ( concretespatialtypename )?)
                           );
abstractspatialtypename : (CAP_G E O G R A P H Y)
                        | (CAP_G E O M E T R Y);
concretespatialtypename : (CAP_C O L L E C T I O N)
                        | (CAP_L I N E CAP_S T R I N G)
                        | (CAP_M U L T I CAP_L I N E CAP_S T R I N G)
                        | (CAP_M U L T I CAP_P O I N T)
                        | (CAP_M U L T I CAP_P O L Y G O N)
                        | (CAP_P O I N T)
                        | (CAP_P O L Y G O N);

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
         | primitivecolfunction;

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


//------------------------------------------------------------------------------
// 7. Literal Data Values
//------------------------------------------------------------------------------

// in URLs
primitiveliteral : nullvalue                  // plain values up to int64Value
                 | booleanvalue
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
                 | geometrypolygon;

// in Atom and JSON message bodies and CSDL DefaultValue attributes
primitivevalue : booleanvalue
               | guidvalue
               | durationvalue
               | datetimeoffsetvalue
               | datevalue
               | timeofdayvalue
               | enumvalue
               | fullcollectionliteral
               | fulllinestringliteral
               | fullmultipointliteral
               | fullmultilinestringliteral
               | fullmultipolygonliteral
               | fullpointliteral
               | fullpolygonliteral
               | decimalvalue
               | doublevalue
               | singlevalue
               | sbytevalue
               | bytevalue
               | int16value
               | int32value
               | int64value
               | binaryvalue;
               // also valid are:
               // - any XML string for strings in Atom and CSDL documents
               // - any JSON string for JSON documents

nullvalue : (N U L L);

// base64url encoding according to http://tools.ietf.org/html/rfc4648#section-5
binary      : ((CAP_B | B) (CAP_I | I) (CAP_N | N) (CAP_A | A) (CAP_R | R) (CAP_Y | Y)) squote binaryvalue squote;
binaryvalue : ((base64char base64char base64char base64char))* ( base64b16  | base64b8 )?;
base64b16   : (base64char base64char) ( CAP_A | CAP_E | CAP_I | CAP_M | CAP_Q | CAP_U | CAP_Y | C | G | K | O | S | W | ZERO | FOUR | EIGHT )   ( EQUALS )?;
base64b8    : base64char ( CAP_A | CAP_Q | G | W ) ( (EQUALS EQUALS) )?;
base64char  : alpha | digit | DASH | UNDERSCORE;

booleanvalue : ((CAP_T | T) (CAP_R | R) (CAP_U | U) (CAP_E | E)) | ((CAP_F | F) (CAP_A | A) (CAP_L | L) (CAP_S | S) (CAP_E | E));

decimalvalue : (( sign )? digit+ ( PERIOD digit+ )? ( (CAP_E | E) ( sign )? digit+ )?) | naninfinity;
doublevalue  : decimalvalue; // IEEE 754 binary64 floating-point number (15-17 decimal digits)
singlevalue  : decimalvalue; // IEEE 754 binary32 floating-point number (6-9 decimal digits)
naninfinity  : (CAP_N A CAP_N) | (DASH CAP_I CAP_N CAP_F) | (CAP_I CAP_N CAP_F);

guidvalue : (hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig) DASH (hexdig hexdig hexdig hexdig) DASH (hexdig hexdig hexdig hexdig) DASH (hexdig hexdig hexdig hexdig) DASH (hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig hexdig);

bytevalue  : (digit ((digit digit) | digit?));           // numbers in the range from 0 to 255
sbytevalue : ( sign )? (digit ((digit digit) | digit?));  // numbers in the range from -128 to 127
int16value : ( sign )? (digit ((digit digit digit digit) | (digit digit digit) | (digit digit) | digit?));  // numbers in the range from -32768 to 32767
int32value : ( sign )? (digit ((digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit) | (digit digit digit digit digit digit) | (digit digit digit digit digit) | (digit digit digit digit) | (digit digit digit) | (digit digit) | digit?)); // numbers in the range from -2147483648 to 2147483647
int64value : ( sign )? (digit ((digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit) | (digit digit digit digit digit digit) | (digit digit digit digit digit) | (digit digit digit digit) | (digit digit digit) | (digit digit) | digit?)); // numbers in the range from -9223372036854775808 to 9223372036854775807

string_1           : squote ( squote_in_string | pchar_no_squote )* squote;
squote_in_string : squote squote; // two consecutive single quotes represent one within a string literal

datevalue : year DASH month DASH day;

datetimeoffsetvalue      : year DASH month DASH day (CAP_T | T) timeofdayvalue      ( (CAP_Z | Z) | (sign hour COLON   minute) );
datetimeoffsetvalueinurl : year DASH month DASH day (CAP_T | T) timeofdayvalueinurl ( (CAP_Z | Z) | (sign hour colon minute) );

duration      : ( ((CAP_D | D) (CAP_U | U) (CAP_R | R) (CAP_A | A) (CAP_T | T) (CAP_I | I) (CAP_O | O) (CAP_N | N)) )? squote durationvalue squote;
durationvalue : ( sign )? (CAP_P | P) ( digit+ (CAP_D | D) )? ( (CAP_T | T) ( digit+ (CAP_H | H) )? ( digit+ (CAP_M | M) )? ( digit+ ( PERIOD digit+ )? (CAP_S | S) )? )?;
     // the above is an approximation of the rules for an xml dayTimeDuration.
     // see the lexical representation for dayTimeDuration in http://www.w3.org/TR/xmlschema11-2#dayTimeDuration for more information

timeofdayvalue      : hour COLON   minute ( COLON   second ( PERIOD fractionalseconds )? )?;
timeofdayvalueinurl : hour colon minute ( colon second ( PERIOD fractionalseconds )? )?;

onetonine       : ONE | TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE;
zerotofiftynine : ( ZERO | ONE | TWO | THREE | FOUR | FIVE ) digit;
year  : ( DASH )? ( (ZERO (digit digit digit)) | (onetonine (digit digit digit+)) );
month : (ZERO onetonine)
      | (ONE ( ZERO | ONE | TWO ));
day   : (ZERO onetonine)
      | (( ONE | TWO ) digit)
      | (THREE ( ZERO | ONE ));
hour   : (( ZERO | ONE ) digit)
       | (TWO ( ZERO | ONE | TWO | THREE ));
minute : zerotofiftynine;
second : zerotofiftynine | (SIX ZERO); // for leap seconds
fractionalseconds : (digit ((digit digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit digit) | (digit digit digit digit digit digit digit) | (digit digit digit digit digit digit) | (digit digit digit digit digit) | (digit digit digit digit) | (digit digit digit) | (digit digit) | digit?));

enum_1            : ( qualifiedenumtypename )? squote enumvalue squote;
enumvalue       : singleenumvalue ( comma singleenumvalue )*;
singleenumvalue : enumerationmember | enummembervalue;
enummembervalue : int64value;

geographycollection   : geographyprefix squote fullcollectionliteral squote;
fullcollectionliteral : sridliteral collectionliteral;
collectionliteral     : ((CAP_C | C) (CAP_O | O) (CAP_L | L) (CAP_L | L) (CAP_E | E) (CAP_C | C) (CAP_T | T) (CAP_I | I) (CAP_O | O) (CAP_N | N) LEFT_PAREN) geoliteral ( comma geoliteral )* close;
geoliteral            : collectionliteral
                      | linestringliteral
                      | multipointliteral
                      | multilinestringliteral
                      | multipolygonliteral
                      | pointliteral
                      | polygonliteral;

geographylinestring   : geographyprefix squote fulllinestringliteral squote;
fulllinestringliteral : sridliteral linestringliteral;
linestringliteral     : ((CAP_L | L) (CAP_I | I) (CAP_N | N) (CAP_E | E) (CAP_S | S) (CAP_T | T) (CAP_R | R) (CAP_I | I) (CAP_N | N) (CAP_G | G)) linestringdata;
linestringdata        : open positionliteral ( comma positionliteral )+ close;

geographymultilinestring   : geographyprefix squote fullmultilinestringliteral squote;
fullmultilinestringliteral : sridliteral multilinestringliteral;
multilinestringliteral     : ((CAP_M | M) (CAP_U | U) (CAP_L | L) (CAP_T | T) (CAP_I | I) (CAP_L | L) (CAP_I | I) (CAP_N | N) (CAP_E | E) (CAP_S | S) (CAP_T | T) (CAP_R | R) (CAP_I | I) (CAP_N | N) (CAP_G | G) LEFT_PAREN) ( linestringdata ( comma linestringdata )* )? close;

geographymultipoint   : geographyprefix squote fullmultipointliteral squote;
fullmultipointliteral : sridliteral multipointliteral;
multipointliteral     : ((CAP_M | M) (CAP_U | U) (CAP_L | L) (CAP_T | T) (CAP_I | I) (CAP_P | P) (CAP_O | O) (CAP_I | I) (CAP_N | N) (CAP_T | T) LEFT_PAREN) ( pointdata ( comma pointdata )* )? close;

geographymultipolygon   : geographyprefix squote fullmultipolygonliteral squote;
fullmultipolygonliteral : sridliteral multipolygonliteral;
multipolygonliteral     : ((CAP_M | M) (CAP_U | U) (CAP_L | L) (CAP_T | T) (CAP_I | I) (CAP_P | P) (CAP_O | O) (CAP_L | L) (CAP_Y | Y) (CAP_G | G) (CAP_O | O) (CAP_N | N) LEFT_PAREN) ( polygondata ( comma polygondata )* )? close;

geographypoint   : geographyprefix squote fullpointliteral squote;
fullpointliteral : sridliteral pointliteral;
sridliteral      : ((CAP_S | S) (CAP_R | R) (CAP_I | I) (CAP_D | D)) eq (digit ((digit digit digit digit) | (digit digit digit) | (digit digit) | digit?)) semi;
pointliteral     :((CAP_P | P) (CAP_O | O) (CAP_I | I) (CAP_N | N) (CAP_T | T)) pointdata;
pointdata        : open positionliteral close;
positionliteral  : doublevalue sp doublevalue ( sp doublevalue )? ( sp doublevalue )?; // longitude, latitude, altitude/elevation (optional), linear referencing measure (optional)

geographypolygon   : geographyprefix squote fullpolygonliteral squote;
fullpolygonliteral : sridliteral polygonliteral;
polygonliteral     : ((CAP_P | P) (CAP_O | O) (CAP_L | L) (CAP_Y | Y) (CAP_G | G) (CAP_O | O) (CAP_N | N)) polygondata;
polygondata        : open ringliteral ( comma ringliteral )* close;
ringliteral        : open positionliteral ( comma positionliteral )* close;
                   // Within each ringLiteral, the first and last positionLiteral elements MUST be an exact syntactic match to each other.
                   // Within the polygonData, the ringLiterals MUST specify their points in appropriate winding order.
                   // In order of traversal, points to the left side of the ring are interpreted as being in the polygon.

geometrycollection      : geometryprefix squote fullcollectionliteral      squote;
geometrylinestring      : geometryprefix squote fulllinestringliteral      squote;
geometrymultilinestring : geometryprefix squote fullmultilinestringliteral squote;
geometrymultipoint      : geometryprefix squote fullmultipointliteral      squote;
geometrymultipolygon    : geometryprefix squote fullmultipolygonliteral    squote;
geometrypoint           : geometryprefix squote fullpointliteral           squote;
geometrypolygon         : geometryprefix squote fullpolygonliteral         squote;

geographyprefix : ((CAP_G | G) (CAP_E | E) (CAP_O | O) (CAP_G | G) (CAP_R | R) (CAP_A | A) (CAP_P | P) (CAP_H | H) (CAP_Y | Y));
geometryprefix  : ((CAP_G | G) (CAP_E | E) (CAP_O | O) (CAP_M | M) (CAP_E | E) (CAP_T | T) (CAP_R | R) (CAP_Y | Y));


//------------------------------------------------------------------------------
// 8. Header values
//------------------------------------------------------------------------------

header : content_id
       | isolation
       | odata_entityid
       | odata_error
       | odata_maxversion
       | odata_version
       | prefer;

content_id : ((CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_T | T) (CAP_E | E) (CAP_N | N) (CAP_T | T) DASH (CAP_I | I) (CAP_D | D)) COLON ows request_id;
isolation  : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) DASH) )? ((CAP_I | I) (CAP_S | S) (CAP_O | O) (CAP_L | L) (CAP_A | A) (CAP_T | T) (CAP_I | I) (CAP_O | O) (CAP_N | N)) COLON ows ((CAP_S | S) (CAP_N | N) (CAP_A | A) (CAP_P | P) (CAP_S | S) (CAP_H | H) (CAP_O | O) (CAP_T | T));
request_id : unreserved+;

odata_entityid   : ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) DASH (CAP_E | E) (CAP_N | N) (CAP_T | T) (CAP_I | I) (CAP_T | T) (CAP_Y | Y) (CAP_I | I) (CAP_D | D))   COLON ows iri_in_header;

// Note: the header value is a JSON object restricted to characters allowed in a header
odata_error      : ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) DASH (CAP_E | E) (CAP_R | R) (CAP_R | R) (CAP_O | O) (CAP_R | R))      COLON ows (LEFT_CURLY_BRACE QUOTE C O D E QUOTE COLON) ( vchar | sp )*;

odata_maxversion : ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) DASH (CAP_M | M) (CAP_A | A) (CAP_X | X) (CAP_V | V) (CAP_E | E) (CAP_R | R) (CAP_S | S) (CAP_I | I) (CAP_O | O) (CAP_N | N)) COLON ows digit+ PERIOD digit+;
odata_version    : ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) DASH (CAP_V | V) (CAP_E | E) (CAP_R | R) (CAP_S | S) (CAP_I | I) (CAP_O | O) (CAP_N | N))    COLON ows (FOUR PERIOD ZERO) ( onetonine )?;

prefer     : ((CAP_P | P) (CAP_R | R) (CAP_E | E) (CAP_F | F) (CAP_E | E) (CAP_R | R)) COLON ows preference ( ows COMMA ows preference )*;
preference : allowentityreferencespreference
           | callbackpreference
           | continueonerrorpreference
           | includeannotationspreference
           | maxpagesizepreference
           | respondasyncpreference
           | returnpreference
           | trackchangespreference
           | waitpreference;
           // and everything allowed by https://tools.ietf.org/html/rfc7240
           // / ( parameter / token ) *( OWS ";" [ OWS ( parameter / token ) ] )

allowentityreferencespreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_A | A) (CAP_L | L) (CAP_L | L) (CAP_O | O) (CAP_W | W) DASH (CAP_E | E) (CAP_N | N) (CAP_T | T) (CAP_I | I) (CAP_T | T) (CAP_Y | Y) (CAP_R | R) (CAP_E | E) (CAP_F | F) (CAP_E | E) (CAP_R | R) (CAP_E | E) (CAP_N | N) (CAP_C | C) (CAP_E | E) (CAP_S | S));

callbackpreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_C | C) (CAP_A | A) (CAP_L | L) (CAP_L | L) (CAP_B | B) (CAP_A | A) (CAP_C | C) (CAP_K | K)) ows SEMICOLON ows ((CAP_U | U) (CAP_R | R) (CAP_L | L)) eq_h dquote uri dquote;

continueonerrorpreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_C | C) (CAP_O | O) (CAP_N | N) (CAP_T | T) (CAP_I | I) (CAP_N | N) (CAP_U | U) (CAP_E | E) DASH (CAP_O | O) (CAP_N | N) DASH (CAP_E | E) (CAP_R | R) (CAP_R | R) (CAP_O | O) (CAP_R | R)) ( eq_h booleanvalue )?;

includeannotationspreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_I | I) (CAP_N | N) (CAP_C | C) (CAP_L | L) (CAP_U | U) (CAP_D | D) (CAP_E | E) DASH (CAP_A | A) (CAP_N | N) (CAP_N | N) (CAP_O | O) (CAP_T | T) (CAP_A | A) (CAP_T | T) (CAP_I | I) (CAP_O | O) (CAP_N | N) (CAP_S | S)) eq_h dquote annotationslist dquote;
annotationslist      : annotationidentifier (COMMA annotationidentifier)*;
annotationidentifier : ( excludeoperator )?
                       ( star
                       | (namespace_1 PERIOD ( termname | star ))
                       )
                       ( HASH odataidentifier )?;
excludeoperator      : DASH;

maxpagesizepreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_M | M) (CAP_A | A) (CAP_X | X) (CAP_P | P) (CAP_A | A) (CAP_G | G) (CAP_E | E) (CAP_S | S) (CAP_I | I) (CAP_Z | Z) (CAP_E | E)) eq_h onetonine digit*;

respondasyncpreference : ((CAP_R | R) (CAP_E | E) (CAP_S | S) (CAP_P | P) (CAP_O | O) (CAP_N | N) (CAP_D | D) DASH (CAP_A | A) (CAP_S | S) (CAP_Y | Y) (CAP_N | N) (CAP_C | C));

returnpreference : ((CAP_R | R) (CAP_E | E) (CAP_T | T) (CAP_U | U) (CAP_R | R) (CAP_N | N)) eq_h ( (R E P R E S E N T A T I O N) | (M I N I M A L) );

trackchangespreference : ( ((CAP_O | O) (CAP_D | D) (CAP_A | A) (CAP_T | T) (CAP_A | A) PERIOD) )? ((CAP_T | T) (CAP_R | R) (CAP_A | A) (CAP_C | C) (CAP_K | K) DASH (CAP_C | C) (CAP_H | H) (CAP_A | A) (CAP_N | N) (CAP_G | G) (CAP_E | E) (CAP_S | S));

waitpreference : ((CAP_W | W) (CAP_A | A) (CAP_I | I) (CAP_T | T)) eq_h digit+;

//parameter      = token "=" ( token / quoted-string )
//token          = 1*tchar
//tchar          = "!" / "#" / "$" / "%" / "&" / "'" / "*"
//               / "+" / "-" / "." / "^" / "_" / "`" / "|" / "~"
//               / DIGIT / ALPHA
//quoted-string  = DQUOTE *( qdtext / quoted-pair ) DQUOTE
//qdtext         = %x21 / %x23-5B / %x5D-7E / obs-text / OWS
obs_text       : (U_0080 | U_0081 | U_0082 | U_0083 | U_0084 | U_0085 | U_0086 | U_0087 | U_0088 | U_0089 | U_008A | U_008B | U_008C | U_008D | U_008E | U_008F | U_0090 | U_0091 | U_0092 | U_0093 | U_0094 | U_0095 | U_0096 | U_0097 | U_0098 | U_0099 | U_009A | U_009B | U_009C | U_009D | U_009E | U_009F | U_00A0 | U_00A1 | U_00A2 | U_00A3 | U_00A4 | U_00A5 | U_00A6 | U_00A7 | U_00A8 | U_00A9 | U_00AA | U_00AB | U_00AC | U_00AD | U_00AE | U_00AF | U_00B0 | U_00B1 | U_00B2 | U_00B3 | U_00B4 | U_00B5 | U_00B6 | U_00B7 | U_00B8 | U_00B9 | U_00BA | U_00BB | U_00BC | U_00BD | U_00BE | U_00BF | U_00C0 | U_00C1 | U_00C2 | U_00C3 | U_00C4 | U_00C5 | U_00C6 | U_00C7 | U_00C8 | U_00C9 | U_00CA | U_00CB | U_00CC | U_00CD | U_00CE | U_00CF | U_00D0 | U_00D1 | U_00D2 | U_00D3 | U_00D4 | U_00D5 | U_00D6 | U_00D7 | U_00D8 | U_00D9 | U_00DA | U_00DB | U_00DC | U_00DD | U_00DE | U_00DF | U_00E0 | U_00E1 | U_00E2 | U_00E3 | U_00E4 | U_00E5 | U_00E6 | U_00E7 | U_00E8 | U_00E9 | U_00EA | U_00EB | U_00EC | U_00ED | U_00EE | U_00EF | U_00F0 | U_00F1 | U_00F2 | U_00F3 | U_00F4 | U_00F5 | U_00F6 | U_00F7 | U_00F8 | U_00F9 | U_00FA | U_00FB | U_00FC | U_00FD | U_00FE | U_00FF);
//quoted-pair    = "\" ( HTAB / SP / VCHAR / obs-text )

ows   : ( sp | htab )*;  // "optional" whitespace
bws_h : ( sp | htab )*;  // "bad" whitespace in header values
eq_h  : bws_h eq bws_h;


//------------------------------------------------------------------------------
// 9. Punctuation
//------------------------------------------------------------------------------

rws : ( sp | htab )+;  // "required" whitespace
bws :  ( sp | htab )*;  // "bad" whitespace

at     : AT;
colon  : COLON;
comma  : COMMA;
eq     : EQUALS;
hash   : HASH; // "%23" ; the # character is not allowed in the query part
sign   : PLUS |  DASH;
semi   : SEMICOLON;
star   : ASTERISK;
squote : APOSTROPHE;

open  : LEFT_PAREN;
close : RIGHT_PAREN;


//------------------------------------------------------------------------------
// A. URI syntax [RFC3986]
//------------------------------------------------------------------------------

uri           : scheme COLON hier_part ( QUESTION query )? ( HASH fragment_1 )?;
hier_part     : ((SLASH SLASH) authority path_abempty)
              | path_absolute
              | path_rootless;
//              / path-empty
//URI-reference = URI / relative-ref
//absolute-URI  = scheme ":" hier-part [ "?" query ]
//relative-ref  = relative-part [ "?" query ] [ "#" fragment ]
//relative-part = "//" authority path-abempty
//              / path-absolute
//              / path-noscheme
//              / path-empty
scheme        : alpha ( alpha | digit | PLUS | DASH | PERIOD )*;
authority     : ( userinfo AT )? host ( COLON port )?;
userinfo      : ( unreserved | sub_delims | COLON )*;
host          : ip_literal | ipv4address | reg_name;
port          : digit*;
ip_literal    : LEFT_BRACE ( ipv6address | ipvfuture  ) RIGHT_BRACE;
ipvfuture     : (CAP_V | V) hexdig+ PERIOD ( unreserved | sub_delims | COLON )+;
ipv6address   :                            ((( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) ls32)
                 |                       ((COLON COLON) (( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) ls32)
                 | ((               h16 )? (COLON COLON) (( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON)) ls32)
                 | (( ( h16 COLON )? h16 )? (COLON COLON) (( h16 COLON ) (h16 COLON) (h16 COLON)) ls32)
                 | (( (((( h16 COLON ) (h16 COLON)) | (h16 COLON)?)) h16 )? (COLON COLON) (( h16 COLON ) (h16 COLON)) ls32)
                 | (( (((( h16 COLON ) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON)) | (h16 COLON)?)) h16 )? (COLON COLON)    h16 COLON   ls32)
                 | (( (((( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON)) | (h16 COLON)?)) h16 )? (COLON COLON)              ls32)
                 | (( (((( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON)) | (h16 COLON)?)) h16 )? (COLON COLON)              h16)
                 | (( (((( h16 COLON ) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON) (h16 COLON)) | ((h16 COLON) (h16 COLON)) | (h16 COLON)?)) h16 )? (COLON COLON));
h16           : (hexdig ((hexdig hexdig hexdig) | (hexdig hexdig) | hexdig?));
ls32          : ( h16 COLON h16 ) | ipv4address;
ipv4address   : dec_octet PERIOD dec_octet PERIOD dec_octet PERIOD dec_octet;
dec_octet     : (ONE (digit digit))            // 100-199
              | (TWO (ZERO | ONE | TWO | THREE | FOUR) digit)     // 200-249
              | ((TWO FIVE) (ZERO | ONE | TWO | THREE | FOUR | FIVE))          // 250-255
              | ((ONE | TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE) digit)         // 10-99
              | digit;                 // 0-9
reg_name      : ( unreserved | sub_delims )*;
//path          = path-abempty    ; begins with "/" or is empty
//              / path-absolute   ; begins with "/" but not "//"
//              / path-noscheme   ; begins with a non-colon segment
//              / path-rootless   ; begins with a segment
//              / path-empty      ; zero characters
path_abempty  : ( SLASH segment )*;
path_absolute : SLASH ( segment_nz ( SLASH segment )* )?;
//path-noscheme = segment-nz-nc *( "/" segment )
path_rootless : segment_nz ( SLASH segment )*;
//path-empty    = ""
segment       : pchar*;
segment_nz    : pchar+;
//segment-nz-nc = 1*( unreserved / pct-encoded / sub-delims / "@" ) ; non-zero-length segment without any colon ":"
pchar         : unreserved | sub_delims | COLON | AT;
query         : ( pchar | SLASH | QUESTION )*;
fragment_1      : ( pchar | SLASH | QUESTION )*;
pct_encoded   : PERCENT hexdig hexdig;
unreserved    : alpha | digit | DASH | PERIOD | UNDERSCORE | TILDE;
//reserved      = gen-delims / sub-delims
//gen-delims    = ":" / "/" / "?" / "#" / "[" / "]" / "@"
//sub-delims    = "!" / "$" / "&" / "'" / "(" / ")" / "*" / "+" / "," / ";" / "="
sub_delims     :       DOLLAR | AMPERSAND | APOSTROPHE |                                     EQUALS | other_delims;
other_delims   : EXCLAMATION |                   LEFT_PAREN | RIGHT_PAREN | ASTERISK | PLUS | COMMA | SEMICOLON;

pchar_no_squote       : unreserved | other_delims | DOLLAR | AMPERSAND | EQUALS | COLON | AT;
pct_encoded_no_squote : (PERCENT ( ZERO | ONE |   THREE | FOUR | FIVE | SIX | EIGHT | NINE | a_to_f ) hexdig)
                      | (PERCENT TWO ( ZERO | ONE | TWO | THREE | FOUR | FIVE | SIX |   EIGHT | NINE | a_to_f ));

qchar_no_amp              : unreserved |  other_delims | COLON | AT | SLASH | QUESTION | DOLLAR | APOSTROPHE | EQUALS;
qchar_no_amp_eq           : unreserved |  other_delims | COLON | AT | SLASH | QUESTION | DOLLAR | APOSTROPHE;
qchar_no_amp_eq_at_dollar : unreserved |  other_delims | COLON |       SLASH | QUESTION |       APOSTROPHE;
qchar_no_amp_squote       : unreserved |  other_delims | COLON | AT | SLASH | QUESTION | DOLLAR |       EQUALS;
qchar_no_amp_dquote       : unreserved |  other_delims | COLON | AT | SLASH | QUESTION | DOLLAR | APOSTROPHE | EQUALS;

qchar_unescaped       : unreserved | other_delims | COLON | AT | SLASH | QUESTION | DOLLAR | APOSTROPHE | EQUALS;
pct_encoded_unescaped : (PERCENT ( ZERO | ONE |   THREE | FOUR |   SIX | SEVEN | EIGHT | NINE | a_to_f ) hexdig)
                      | (PERCENT TWO ( ZERO | ONE |   THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | a_to_f ))
                      | (PERCENT FIVE ( digit | (CAP_A | A) | (CAP_B | B) |   (CAP_D | D) | (CAP_E | E) | (CAP_F | F) ));

pct_encoded_no_dquote : (PERCENT ( ZERO | ONE |   THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | a_to_f ) hexdig)
                      | (PERCENT TWO ( ZERO | ONE |   THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | a_to_f ));


//------------------------------------------------------------------------------
// B. IRI syntax [RFC3987]
//------------------------------------------------------------------------------
// Note: these are over-generous stubs, for the actual patterns refer to RFC3987
//------------------------------------------------------------------------------

iri_in_header : ( vchar | obs_text )+;
iri_in_query  : qchar_no_amp+;


//------------------------------------------------------------------------------
// C. ABNF core definitions [RFC5234]
//------------------------------------------------------------------------------

alpha  : (CAP_A | CAP_B | CAP_C | CAP_D | CAP_E | CAP_F | CAP_G | CAP_H | CAP_I | CAP_J | CAP_K | CAP_L | CAP_M | CAP_N | CAP_O | CAP_P | CAP_Q | CAP_R | CAP_S | CAP_T | CAP_U | CAP_V | CAP_W | CAP_X | CAP_Y | CAP_Z) | (A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z);
digit  : (ZERO | ONE | TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE);
hexdig : digit | a_to_f;
a_to_f : (CAP_A | A) | (CAP_B | B) | (CAP_C | C) | (CAP_D | D) | (CAP_E | E) | (CAP_F | F);
dquote : QUOTE;
sp     : SPACE;
htab   : TAB;
//WSP    = SP / HTAB
//LWSP = *(WSP / CRLF WSP)
vchar : (EXCLAMATION | QUOTE | HASH | DOLLAR | PERCENT | AMPERSAND | APOSTROPHE | LEFT_PAREN | RIGHT_PAREN | ASTERISK | PLUS | COMMA | DASH | PERIOD | SLASH | ZERO | ONE | TWO | THREE | FOUR | FIVE | SIX | SEVEN | EIGHT | NINE | COLON | SEMICOLON | LESS_THAN | EQUALS | GREATER_THAN | QUESTION | AT | CAP_A | CAP_B | CAP_C | CAP_D | CAP_E | CAP_F | CAP_G | CAP_H | CAP_I | CAP_J | CAP_K | CAP_L | CAP_M | CAP_N | CAP_O | CAP_P | CAP_Q | CAP_R | CAP_S | CAP_T | CAP_U | CAP_V | CAP_W | CAP_X | CAP_Y | CAP_Z | LEFT_BRACE | BACKSLASH | RIGHT_BRACE | CARAT | UNDERSCORE | ACCENT | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z | LEFT_CURLY_BRACE | PIPE | RIGHT_CURLY_BRACE | TILDE);
//CHAR = %x01-7F
//LOCTET = %x00-FF
//CR     = %x0D
//LF     = %x0A
//CRLF   = CR LF
//BIT = "0" / "1"


//------------------------------------------------------------------------------
// End of odata-abnf-construction-rules
//------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
// Lexer rules generated for each distinct character in original grammar
// Simplified character names based on Unicode (http://www.unicode.org/charts/PDF/U0000.pdf)
////////////////////////////////////////////////////////////////////////////////////////////

TAB : '\u0009';
SPACE : ' ';
EXCLAMATION : '!';
QUOTE : '"';
HASH : '#';
DOLLAR : '$';
PERCENT : '%';
AMPERSAND : '&';
APOSTROPHE : '\'';
LEFT_PAREN : '(';
RIGHT_PAREN : ')';
ASTERISK : '*';
PLUS : '+';
COMMA : ',';
DASH : '-';
PERIOD : '.';
SLASH : '/';
ZERO : '0';
ONE : '1';
TWO : '2';
THREE : '3';
FOUR : '4';
FIVE : '5';
SIX : '6';
SEVEN : '7';
EIGHT : '8';
NINE : '9';
COLON : ':';
SEMICOLON : ';';
LESS_THAN : '<';
EQUALS : '=';
GREATER_THAN : '>';
QUESTION : '?';
AT : '@';
CAP_A : 'A';
CAP_B : 'B';
CAP_C : 'C';
CAP_D : 'D';
CAP_E : 'E';
CAP_F : 'F';
CAP_G : 'G';
CAP_H : 'H';
CAP_I : 'I';
CAP_J : 'J';
CAP_K : 'K';
CAP_L : 'L';
CAP_M : 'M';
CAP_N : 'N';
CAP_O : 'O';
CAP_P : 'P';
CAP_Q : 'Q';
CAP_R : 'R';
CAP_S : 'S';
CAP_T : 'T';
CAP_U : 'U';
CAP_V : 'V';
CAP_W : 'W';
CAP_X : 'X';
CAP_Y : 'Y';
CAP_Z : 'Z';
LEFT_BRACE : '[';
BACKSLASH : '\\';
RIGHT_BRACE : ']';
CARAT : '^';
UNDERSCORE : '_';
ACCENT : '`';
A : 'a';
B : 'b';
C : 'c';
D : 'd';
E : 'e';
F : 'f';
G : 'g';
H : 'h';
I : 'i';
J : 'j';
K : 'k';
L : 'l';
M : 'm';
N : 'n';
O : 'o';
P : 'p';
Q : 'q';
R : 'r';
S : 's';
T : 't';
U : 'u';
V : 'v';
W : 'w';
X : 'x';
Y : 'y';
Z : 'z';
LEFT_CURLY_BRACE : '{';
PIPE : '|';
RIGHT_CURLY_BRACE : '}';
TILDE : '~';
U_0080 : '\u0080';
U_0081 : '\u0081';
U_0082 : '\u0082';
U_0083 : '\u0083';
U_0084 : '\u0084';
U_0085 : '\u0085';
U_0086 : '\u0086';
U_0087 : '\u0087';
U_0088 : '\u0088';
U_0089 : '\u0089';
U_008A : '\u008A';
U_008B : '\u008B';
U_008C : '\u008C';
U_008D : '\u008D';
U_008E : '\u008E';
U_008F : '\u008F';
U_0090 : '\u0090';
U_0091 : '\u0091';
U_0092 : '\u0092';
U_0093 : '\u0093';
U_0094 : '\u0094';
U_0095 : '\u0095';
U_0096 : '\u0096';
U_0097 : '\u0097';
U_0098 : '\u0098';
U_0099 : '\u0099';
U_009A : '\u009A';
U_009B : '\u009B';
U_009C : '\u009C';
U_009D : '\u009D';
U_009E : '\u009E';
U_009F : '\u009F';
U_00A0 : '\u00A0';
U_00A1 : '\u00A1';
U_00A2 : '\u00A2';
U_00A3 : '\u00A3';
U_00A4 : '\u00A4';
U_00A5 : '\u00A5';
U_00A6 : '\u00A6';
U_00A7 : '\u00A7';
U_00A8 : '\u00A8';
U_00A9 : '\u00A9';
U_00AA : '\u00AA';
U_00AB : '\u00AB';
U_00AC : '\u00AC';
U_00AD : '\u00AD';
U_00AE : '\u00AE';
U_00AF : '\u00AF';
U_00B0 : '\u00B0';
U_00B1 : '\u00B1';
U_00B2 : '\u00B2';
U_00B3 : '\u00B3';
U_00B4 : '\u00B4';
U_00B5 : '\u00B5';
U_00B6 : '\u00B6';
U_00B7 : '\u00B7';
U_00B8 : '\u00B8';
U_00B9 : '\u00B9';
U_00BA : '\u00BA';
U_00BB : '\u00BB';
U_00BC : '\u00BC';
U_00BD : '\u00BD';
U_00BE : '\u00BE';
U_00BF : '\u00BF';
U_00C0 : '\u00C0';
U_00C1 : '\u00C1';
U_00C2 : '\u00C2';
U_00C3 : '\u00C3';
U_00C4 : '\u00C4';
U_00C5 : '\u00C5';
U_00C6 : '\u00C6';
U_00C7 : '\u00C7';
U_00C8 : '\u00C8';
U_00C9 : '\u00C9';
U_00CA : '\u00CA';
U_00CB : '\u00CB';
U_00CC : '\u00CC';
U_00CD : '\u00CD';
U_00CE : '\u00CE';
U_00CF : '\u00CF';
U_00D0 : '\u00D0';
U_00D1 : '\u00D1';
U_00D2 : '\u00D2';
U_00D3 : '\u00D3';
U_00D4 : '\u00D4';
U_00D5 : '\u00D5';
U_00D6 : '\u00D6';
U_00D7 : '\u00D7';
U_00D8 : '\u00D8';
U_00D9 : '\u00D9';
U_00DA : '\u00DA';
U_00DB : '\u00DB';
U_00DC : '\u00DC';
U_00DD : '\u00DD';
U_00DE : '\u00DE';
U_00DF : '\u00DF';
U_00E0 : '\u00E0';
U_00E1 : '\u00E1';
U_00E2 : '\u00E2';
U_00E3 : '\u00E3';
U_00E4 : '\u00E4';
U_00E5 : '\u00E5';
U_00E6 : '\u00E6';
U_00E7 : '\u00E7';
U_00E8 : '\u00E8';
U_00E9 : '\u00E9';
U_00EA : '\u00EA';
U_00EB : '\u00EB';
U_00EC : '\u00EC';
U_00ED : '\u00ED';
U_00EE : '\u00EE';
U_00EF : '\u00EF';
U_00F0 : '\u00F0';
U_00F1 : '\u00F1';
U_00F2 : '\u00F2';
U_00F3 : '\u00F3';
U_00F4 : '\u00F4';
U_00F5 : '\u00F5';
U_00F6 : '\u00F6';
U_00F7 : '\u00F7';
U_00F8 : '\u00F8';
U_00F9 : '\u00F9';
U_00FA : '\u00FA';
U_00FB : '\u00FB';
U_00FC : '\u00FC';
U_00FD : '\u00FD';
U_00FE : '\u00FE';
U_00FF : '\u00FF';