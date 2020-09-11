/*
 * Work pad for now.
 * Current state as derived from non-validating ABNF out of 
 * Part 5: CQL: The Contextual Query Language
 * Somehow Level 0 conformance as target (described at 
 * http://docs.oasis-open.org/search-ws/searchRetrieve/v1.0/os/part5-cql/searchRetrieve-v1.0-os-part5-cql.html#_Toc324166816 
 * as:
 * 6.2.1 Level 0
 *   The server must:
 *   1.  Be able to process a term-only query. (See Client Conformance, Level 0.)
 *   2.  Be able to inform the Protocol that the query is not supported, in the 
 *       event of any unsupported query.
 *       Note: The intent is that the protocol will issue a diagnostic from server to client. 
 *             However this is beyond the scope of the CQL standard.
 * 6.1.1 Level 0
 *   1.  The client must be able to form a term-only query.
 *       Note: The term is either a single word, or, if multiple words separated by spaces 
 *             then the entire search term is quoted. If the term includes quote marks, 
 *             they must be escaped by preceding them with a backslash, e.g."raising the \"titanic\"".)
 *
 * Transcription and adaption procedure was to 
 * A) start from the ABNF in section 4 "CQL Query Syntax: ABNF" 
 * B) strip out all non level 0 features like: 
 *    sort spec, prefix assignment, indexes, relations and modifiers
 *    Note: This includes tokens as "prox" (not needed in level 0)
 * C) transform the troublesome hyphenated rule names into camelCased ones for parser level and 
 *    CamelCased for lexer rules (ALLCAPS for simple terminals)
 * D) completed the productions for terminals where missing (eg. quoted-string etc.)
 * E) Fixed an ABNF error in the production of search-clause-group (stray | to /)
 * F) change the dialect from ABNF to antlrv4 through the mappings: 
 *    = to :, 
 *    ; to // (or /* et al. where applicable), 
 *    / to |, 
 *    end of a production as ;
 *    1*foo to foo+
 *    [bar] to (bar)?
 * G) Temporarily inserted lots of unused Lexer rules to minimize stray literals
 *
 * Remember: All bugs are mine ;-) ... still.
 * These notes will be replaced when the code will be released.
 *
 * Contact: Stefan Drees <stefan@drees.name> 
 */

grammar FTSearch;
// A. Query

searchQuery : searchClauseGroup ;
searchClauseGroup : searchClauseGroup aBoolean_LUC subQuery 
                  | subQuery 
                  ;
subQuery : OP searchClauseGroup CP 
         | searchTerm 
         ;
searchTerm : simpleString 
           | quotedString 
           | reservedString
           ;

// G. Booleans

aBoolean_LUC : And_LUC 
             | Or_LUC 
             | Or_LUC 
             ;

// I. Terminal Aliases

reservedString : aBoolean_LUC ;
simpleName : simpleString ;

// J. Terminals

/*
 * Double quotes enclosing a sequence of any characters 
 * except double quote unless preceded by a backslash
 * character.
 *
 * Backslash escapes the character following it. The
 * surrounding double quotes are not included in the value.
 */

quotedString : DQUOTE ( quotedEscapedCharacter | SP | EM | Stuff_One )* DQUOTE ;
quotedEscapedCharacter : quotedEscapedBackslash
                       | quotedEscapedNewline  
                       | quotedEscapedCarriageReturn
                       | quotedEscapedTab
                       | quotedEscapedBackspace
                       | quotedEscapedFormFeed
                       | quotedEscapedDoubleQuote
                       | quotedEscapedSingleQuote
                       ;

Stuff_One : '\u0023'..'\uffff' ; 
quotedEscapedBackslash : BSLASH BSLASH ;
quotedEscapedNewline : BSLASH 'n' ;
quotedEscapedCarriageReturn : BSLASH 'r' ;
quotedEscapedTab : BSLASH 't' ;
quotedEscapedBackspace : BSLASH 'b' ;
quotedEscapedFormFeed : BSLASH 'f' ;
quotedEscapedDoubleQuote : BSLASH DQUOTE ;
quotedEscapedSingleQuote : BSLASH SQUOTE ;

simpleString : unquotedStringValue* ;

/*
 * Any sequence of non-whitespace characters that does not
 * include any of the following graphic characters: 
 *
 * %x22: DQUOTE, %x28: OP and %x29: CP
 */

unquotedStringValue :   EM | Stuff_Two | Stuff_Three  ;

Stuff_Two : '\u0023'..'\u0027' ; 
Stuff_Three : '\u002a'..'\uffff';
SP : '\u0020' ;
EM :'\u0021' ;
DQUOTE : '\u0022' ;
HASH : '\u0023' ;
DOLLAR : '\u0024' ;
PSIGN : '\u0025' ;
ASAND : '\u0026' ;
SQUOTE : '\u0027' ;
OP : '\u0028' ;
CP : '\u0029' ;
STAR : '\u002A' ;
PLUS : '\u002B' ;
COMMA : '\u002C' ;
MINUS : '\u002D' ;
DOT : '\u002E' ;
SLASH : '\u002F' ; 
COLON : '\u003A' ;
SEMICOLON : '\u003B' ;
LT : '\u003C' ;
EQ : '\u003D' ;
GT : '\u003E' ;
QM : '\u003F' ;
AT : '\u0040' ;

BSLASH : '\u005C' ;
OB : '\u005B' ;
CB : '\u005D' ;

OC : '\u007B' ;
PIPE : '\u007B' ;
CC : '\u007D' ;
TILDE : '\u007E' ;

And_LUC : 'AND' ;
Or_LUC  : 'OR'  ;
Not_LUC : 'NOT' ;
// end of scratch pad ----------------------------------------------
