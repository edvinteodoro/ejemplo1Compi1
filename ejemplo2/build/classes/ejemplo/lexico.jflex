package ejemplo;
import java_cup.runtime.Symbol;
%%//Separador de area

%class AnalizadorLexico
%cup
%cupdebug
%line
%column

/*Identifiers*/
Numero = [0123456789]
WHITE_SPACE_CHAR=[\ \n\r\t\f]

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline+1, yycolumn+1);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
    }

%}
%%//Separdar de area

<YYINITIAL> {
	({Numero})+                                {return symbol(sym.NUMERO,Integer.parseInt(yytext()));}
        "+"                             {return symbol(sym.MAS,new String(yytext()));}
	"-"                                {return symbol(sym.MENOS);}
        "*"                             {return symbol(sym.POR);}
        "/"                                {return symbol(sym.DIV);}
        "("                             {return symbol(sym.PARA);}
        ")"                             {return symbol(sym.PARC);}
        {WHITE_SPACE_CHAR}               {}//ignoramos
        .               {System.out.println("Error Lexico: "+yytext());}  
}