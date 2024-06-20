/* TinyLexer.flex */
/* TinyLexer.flex */
package lexer;

import lexer.Token;

%%

%class TinyLexer
%unicode
%public
%type Token

%{
  private int line = 1;
  private int column = 1;

  private void newline() {
    line++;
    column = 1;
  }

  public int getLine() {
    return line;
  }

  public int getColumn() {
    return column;
  }

  public void yyerror(String s) {
    System.err.println(s);
  }
%}

%state COMMENT
%state MULTI_LINE_COMMENT
%state STRING

%%

<YYINITIAL> {
  "if"                       { return new Token(sym.IF, yytext()); }
  "then"                     { return new Token(sym.THEN, yytext()); }
  "else"                     { return new Token(sym.ELSE, yytext()); }
  "end"                      { return new Token(sym.END, yytext()); }
  "repeat"                   { return new Token(sym.REPEAT, yytext()); }
  "until"                    { return new Token(sym.UNTIL, yytext()); }
  "read"                     { return new Token(sym.READ, yytext()); }
  "write"                    { return new Token(sym.WRITE, yytext()); }
  "return"                   {return new Token(sym.RETURN, yytext());}
  "<"                        { return new Token(sym.LT, yytext()); }
  "<="                       { return new Token(sym.LE, yytext()); }
  "="                        { return new Token(sym.EQ, yytext()); }
  "<>"                       { return new Token(sym.NE, yytext()); }
  ">"                        { return new Token(sym.GT, yytext()); }
  ">="                       { return new Token(sym.GE, yytext()); }
  "+"                        { return new Token(sym.PLUS, yytext()); }
  "-"                        { return new Token(sym.MINUS, yytext()); }
  "*"                        { return new Token(sym.MUL, yytext()); }
  "/"                        { return new Token(sym.DIV, yytext()); }
  "("                        { return new Token(sym.LPAREN, yytext()); }
  ")"                        { return new Token(sym.RPAREN, yytext()); }
  "{"                        {return new Token(sym.LBRACE, yytext());}
  "}"                        {return new Token(sym.RBRACE, yytext());}
  ":="                       { return new Token(sym.ASSIGN, yytext()); }
  ";"                        { return new Token(sym.SEMI, yytext()); }
  ","                        {return new Token(sym.COMMA, yytext());}
  "."                        {return new Token (sym.COLON, yytext());}
  "||"                       {return new Token(sym.LOGIC_OR, yytext());}
  "&&"                       {return new Token(sym.LOGIC_AND, yytext());}
  [0-9]+                     { return new Token(sym.NUM, yytext()); }
  [a-zA-Z][a-zA-Z0-9]*       { return new Token(sym.ID, yytext()); }
  "//"                       { yybegin(COMMENT); }
  "/*"                       { yybegin(MULTI_LINE_COMMENT); }
  [ \t\r\n]+                 { /* Ignore whitespaces */ }
  "\""                       { yybegin(STRING);  return new Token(sym.STRING_START, yytext());}
  ^.                         { System.err.println("Illegal character: " + yytext()); }
}

<COMMENT> {
  \n { yybegin(YYINITIAL); newline(); }
  . { /* Ignore characters in single-line comments */ }
}

<MULTI_LINE_COMMENT> {
  "*/" { yybegin(YYINITIAL); }
  [^]|\n { /* Ignore characters in multi-line comments */ }
}

<STRING> {
    "\"" { yybegin(YYINITIAL); return new Token(sym.STRING_END, yytext()); } // Transition back to initial state and return the end of string token
    [^\"\n]+ { return new Token(sym.STRING_CONTENT, yytext()); } // Capture string content and return a token
    "\n" { newline(); } // Handle newline inside string
}




