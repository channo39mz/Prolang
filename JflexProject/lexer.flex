%%
%class Lexer
%unicode
%standalone
%{
    import java.util.HashSet;
    import java.util.Set;

    Set<String> symbolTable = new HashSet<>();
%}

%%

"+"                         { System.out.println("operator: +"); }
"-"                         { System.out.println("operator: -"); }
"*"                         { System.out.println("operator: *"); }
"/"                         { System.out.println("operator: /"); }
"="                         { System.out.println("operator: ="); }
">"                         { System.out.println("operator: >"); }
">="                        { System.out.println("operator: >="); }
"<"                         { System.out.println("operator: <"); }
"<="                        { System.out.println("operator: <="); }
"=="                        { System.out.println("operator: =="); }
"++"                        { System.out.println("operator: ++"); }
"--"                        { System.out.println("operator: --"); }
"("                         { System.out.println("semicolon:"); }
")"                         { System.out.println("semicolon:"); }
";"                         { System.out.println("semicolon: ;"); }

"if"                        { System.out.println("keyword: if"); }
"then"                      { System.out.println("keyword: then"); }
"else"                      { System.out.println("keyword: else"); }
"endif"                     { System.out.println("keyword: endif"); }
"while"                     { System.out.println("keyword: while"); }
"do"                        { System.out.println("keyword: do"); }
"endwhile"                  { System.out.println("keyword: endwhile"); }
"print"                      { System.out.println("keyword: print"); }
"newline"                    { System.out.println("keyword: newline"); }
"read"                       { System.out.println("keyword: read"); }

[0-9]+                      { System.out.println("integer: " + yytext()); }

[a-zA-Z][a-zA-Z0-9]*        { 
    String id = yytext();
    if (symbolTable.contains(id)) {
        System.out.println("identifier \"" + id + "\" already in symbol table");
    } else {
        symbolTable.add(id);
        System.out.println("new identifier: " + id);
    }
}


\"[^\"]*\"                   { System.out.println("string: " + yytext()); }

"/*"[^*]*"*\/"             { /* ignore comments */ }
"//"[^\"\n]*                 { /* ignore comments */ }

.                           { System.out.println("error: " + yytext()); }
