# Prototyping (status)

The synthetic grammars for count, index, skip, and top parse all positive "centurio" test cases generated from the ABNF sub grammars.

## Setup:
```bash
$ alias antlr4
alias antlr4='java -jar /path/to/antlr-4.8-complete.jar'
$ alias grun
alias grun='java org.antlr.v4.gui.TestRig'
```

## Examples

These examples use the `java` host language as `grun` requires it.

The first query options implemented (`count`, `index`, `skip` and `top`) have simple value domains (numbers, optionally signed numbers, and boolean).

### Count

```bash
$ antlr4 Count.g4 
$ javac Count*.java
$ for n in {1..100}; do printf "Centurio-%d:\n" $n; cat ../../abnf/count/centurio/count-$n.txt | tr -d "\n" | grun Count count -tokens; done
Centurio-1:
[@0,0:4='count',<Count>,1:0]
[@1,5:5='=',<'='>,1:5]
[@2,6:10='false',<False>,1:6]
[@3,11:10='<EOF>',<EOF>,1:11]
Centurio-2:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='count',<Count>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:11='FALSE',<False>,1:7]
[@4,12:11='<EOF>',<EOF>,1:12]
Centurio-3:
[@0,0:4='COUNT',<Count>,1:0]
[@1,5:5='=',<'='>,1:5]
[@2,6:9='TRUE',<True>,1:6]
[@3,10:9='<EOF>',<EOF>,1:10]
Centurio-4:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='COUNT',<Count>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:10='true',<True>,1:7]
[@4,11:10='<EOF>',<EOF>,1:11]
Centurio-5:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='cOUNT',<Count>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:11='FaLSE',<False>,1:7]
[@4,12:11='<EOF>',<EOF>,1:12]
# ...
```

### Index

```bash
$ antlr4 Index.g4 
$ javac Index*.java
$ for n in {1..100}; do printf "Centurio-%d:\n" $n; cat ../../abnf/index/centurio/index-$n.txt | tr -d "\n" | grun Index index -tokens; done
Centurio-1:
[@0,0:4='INDEX',<Index>,1:0]
[@1,5:5='=',<'='>,1:5]
[@2,6:6='6',<INTEGER>,1:6]
[@3,7:6='<EOF>',<EOF>,1:7]
Centurio-2:
[@0,0:4='index',<Index>,1:0]
[@1,5:5='=',<'='>,1:5]
[@2,6:6='-',<'-'>,1:6]
[@3,7:24='750934812471591634',<INTEGER>,1:7]
[@4,25:24='<EOF>',<EOF>,1:25]
Centurio-3:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='index',<Index>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:7='-',<'-'>,1:7]
[@4,8:8='0',<INTEGER>,1:8]
[@5,9:8='<EOF>',<EOF>,1:9]
Centurio-4:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='INDEX',<Index>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:7='-',<'-'>,1:7]
[@4,8:11='1329',<INTEGER>,1:8]
[@5,12:11='<EOF>',<EOF>,1:12]
Centurio-5:
[@0,0:0='$',<'$'>,1:0]
[@1,1:5='iNdex',<Index>,1:1]
[@2,6:6='=',<'='>,1:6]
[@3,7:7='-',<'-'>,1:7]
[@4,8:8='3',<INTEGER>,1:8]
[@5,9:8='<EOF>',<EOF>,1:9]
# ...
```

### Skip / Top

```bash
$ antlr4 SkipTop.g4 
$ javac SkipTop*.java
$ for n in {1..100}; do printf "Centurio-%d:\n" $n; cat ../../abnf/skip_top/centurio/skip-or-top-$n.txt | tr -d "\n" | grun SkipTop skip_top -tokens; done
Centurio-1:
[@0,0:2='TOP',<Top>,1:0]
[@1,3:3='=',<'='>,1:3]
[@2,4:4='5',<INTEGER>,1:4]
[@3,5:4='<EOF>',<EOF>,1:5]
Centurio-2:
[@0,0:3='SKIP',<Skip>,1:0]
[@1,4:4='=',<'='>,1:4]
[@2,5:5='9',<INTEGER>,1:5]
[@3,6:5='<EOF>',<EOF>,1:6]
Centurio-3:
[@0,0:3='skip',<Skip>,1:0]
[@1,4:4='=',<'='>,1:4]
[@2,5:11='1728360',<INTEGER>,1:5]
[@3,12:11='<EOF>',<EOF>,1:12]
Centurio-4:
[@0,0:2='top',<Top>,1:0]
[@1,3:3='=',<'='>,1:3]
[@2,4:14='43287700909',<INTEGER>,1:4]
[@3,15:14='<EOF>',<EOF>,1:15]
Centurio-5:
[@0,0:0='$',<'$'>,1:0]
[@1,1:4='SKIP',<Skip>,1:1]
[@2,5:5='=',<'='>,1:5]
[@3,6:10='11655',<INTEGER>,1:6]
[@4,11:10='<EOF>',<EOF>,1:11]
# ...
```
