package ejemplo;
import java_cup.runtime.Symbol;
%%//Separador de area

%class AnalizadorLexico
%cup
%cupdebug
%line
%column

/*Identifiers*/
Letra = [a-zA-Z]
Signo = [-_@+*#.]
Numero = [0123456789]

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
	"ls"                                {return symbol(sym.LS);}
        "touch"                             {return symbol(sym.TOUCH);}
	"cd"                                {return symbol(sym.CD);}
        "mkdir"                             {return symbol(sym.MKDIR);}
        "mv"                                {return symbol(sym.MV);}
        "cp"                                {return symbol(sym.CP);}
        "rm"                                {return symbol(sym.RM);}
        "rmdir"                             {return symbol(sym.RMDIR);}
        (" ")+                             {return symbol(sym.SPACE);}
        "\n"                            {return symbol(sym.ENTER);}
        "pwd"                           {return symbol(sym.PWD);}
        "."                             {return symbol(sym.PUNTO);}
        ".."                            {return symbol(sym.DPUNTO);}
        ({Letra}|".")({Letra}|{Signo}|{Numero})*     {return symbol(sym.TEXTO,new String(yytext()));}
        ({Letra}|"/")({Letra})({Letra}|{Signo}|{Numero}|"/")*  {return symbol(sym.PATH,new String(yytext()));}
        .               {return symbol(sym.ERROR,new String(yytext()));}  
}