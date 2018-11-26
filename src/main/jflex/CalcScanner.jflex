package com.github.delenius;

import java_cup.runtime.SymbolFactory;
%%
%cup
%class CalcScanner
%{
    public CalcScanner(java.io.Reader r, SymbolFactory sf){
        this(r);
        this.sf = sf;
    }
	private SymbolFactory sf;
%}
%eofval{
    return sf.newSymbol("EOF",CalcTokens.EOF);
%eofval}

%%
";" { return sf.newSymbol("Semicolon",CalcTokens.SEMI); }
"+" { return sf.newSymbol("Plus",CalcTokens.PLUS); }
"*" { return sf.newSymbol("Times",CalcTokens.TIMES); }
"(" { return sf.newSymbol("Left Bracket",CalcTokens.LPAREN); }
")" { return sf.newSymbol("Right Bracket",CalcTokens.RPAREN); }
[0-9]+ { return sf.newSymbol("Integral Number",CalcTokens.NUMBER, new Integer(yytext())); }
[ \t\r\n\f] { /* ignore white space. */ }
. { System.err.println("Illegal character: "+yytext()); }