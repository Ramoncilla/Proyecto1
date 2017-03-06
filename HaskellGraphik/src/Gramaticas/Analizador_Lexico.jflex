
/* ------------------------==: CODIGO DE USUARIO :==--------------------------*/
package Gramaticas;
    
import Gramaticas.Simbolos;
import java_cup.runtime.Symbol;
import java.io.*;
import java.lang.*;
import java.util.ArrayList;
import java.util.LinkedList;

%% 

/* ----------------------==: OPCIONES Y DECLARACIONES :==---------------------*/
%cupsym Simbolos
%class Scanner_Graphik
%cup
%public
%unicode
%public
%line
%char
%ignorecase
%caseless

/* -------------------------==: EXPRESIONES REGULARES :==---------------------*/
numero              = [0-9]+
decimal             = [0-9]+("\."[0-9]+)
letras              = [a-zA-ZÃ‘Ã_]
cadena              = [\"] ~[\"]
caracter            = "'"([0-9]|[a-zA-Z])"'"
id                  = {letras}({letras}|{numero})*

comentario_simple   = "#/"[^\n]*
comentario_multi    = "#/" ~"/#"

Comentario      ="/"[*] [^*]+ [*]"/"
Comentario2     =[/][/] [^\n]* [\n]


%{
public static String cadena;

/* ------------------------==: METODO DE ERROR LEXICO :==---------------------*/
    private void ErrorScan(int linea, int columna, String valor) {
        System.out.println("Error Lexico Iden: " + valor + ", " + linea + ", " + columna);
        cadena += "<tr>"
                + "<td><center><b>" + valor + "</b></center></td>"
                + "<td><center><b>" + linea + "</b></center></td>"
                + "<td><center><b>" + columna + "</b></center></td>"
                + "</tr>";
    }

%}
%%

/* -----------------------------==: COMENTARIOS  :==--------------------------*/
{comentario_simple}  {System.out.println("Coment Simple");  /* se ignora*/}
{comentario_multi}   {System.out.println("Coment Multi");   /* se ignora*/}



/*--------------------=: Expresion :=-------------------- */
/*...... aritmeticos ......*/

"*"         {System.out.println("Multiplicacion");              return new Symbol (Simbolos.multiplicacion, yyline+1,yychar+1, new String (yytext()));}
"^"         {System.out.println("Potencia");              return new Symbol (Simbolos.potencia, yyline+1,yychar+1, new String (yytext()));}
"+"         {System.out.println("Suma");               return new Symbol (Simbolos.suma, yyline+1,yychar+1, new String (yytext()));}
"-"         {System.out.println("Resta");              return new Symbol (Simbolos.resta, yyline+1,yychar+1, new String (yytext()));}
"/"         {System.out.println("Divi");               return new Symbol (Simbolos.division, yyline+1,yychar+1, new String (yytext()));}
"--"        {System.out.println("menos_menos");            return new Symbol (Simbolos.menos_menos, yyline+1,yychar+1, new String (yytext()));}
"++"       {System.out.println("mas_mas");          ;return new Symbol (Simbolos.mas_mas, yyline+1,yychar+1, new String (yytext()));}


/*...... logicos ......*/
"||"        {System.out.println("or");                 return new Symbol (Simbolos.or, yyline+1,yychar+1, new String (yytext()));}
"&&"        {System.out.println("and");                return new Symbol (Simbolos.and, yyline+1,yychar+1, new String (yytext()));}
"&|"        {System.out.println("xor");                 return new Symbol (Simbolos.xor, yyline+1,yychar+1, new String (yytext()));}
"!"        {System.out.println("not");                return new Symbol (Simbolos.not, yyline+1,yychar+1, new String (yytext()));}


/*...... relacionales ......*/
"<"         {System.out.println("menor");              return new Symbol (Simbolos.menor, yyline+1,yychar+1, new String (yytext()));}
">"         {System.out.println("mayor");              return new Symbol (Simbolos.mayor, yyline+1,yychar+1, new String (yytext()));}
">="        {System.out.println("Mayor_Igual");        return new Symbol (Simbolos.mayor_igual, yyline+1,yychar+1, new String (yytext()));}
"<="        {System.out.println("Menor_Igual");        return new Symbol (Simbolos.menor_igual, yyline+1,yychar+1, new String (yytext()));}
"!="        {System.out.println("No_Igual");           return new Symbol (Simbolos.no_igual, yyline+1,yychar+1, new String (yytext()));}
"=="        {System.out.println("igual_Igual");        return new Symbol (Simbolos.igual_igual, yyline+1,yychar+1, new String (yytext()));}


/*--------------------=: Palabras reservadas :=-------------------- */

"var"          {System.out.println("var");             ;return new Symbol (Simbolos.var, yyline+1,yychar+1, new String (yytext()));}

"entero"          {System.out.println("entero");             ;return new Symbol (Simbolos.entero_t, yyline+1,yychar+1, new String (yytext()));}
"decimal"         {System.out.println("decimal");            ;return new Symbol (Simbolos.decimal_t, yyline+1,yychar+1, new String (yytext()));}
"caracter"          {System.out.println("caracter");             ;return new Symbol (Simbolos.caracter_t, yyline+1,yychar+1, new String (yytext()));}
"cadena"          {System.out.println("cadena");             ;return new Symbol (Simbolos.cadena_t, yyline+1,yychar+1, new String (yytext()));}
"bool"          {System.out.println("bool");             ;return new Symbol (Simbolos.bool_t, yyline+1,yychar+1, new String (yytext()));}
"vacio"          {System.out.println("vacio");             ;return new Symbol (Simbolos.vacio, yyline+1,yychar+1, new String (yytext()));}
"publico"          {System.out.println("publico");             ;return new Symbol (Simbolos.publico, yyline+1,yychar+1, new String (yytext()));}
"privado"          {System.out.println("privado");             ;return new Symbol (Simbolos.privado, yyline+1,yychar+1, new String (yytext()));}
"protegido"        {System.out.println("protegido");           ;return new Symbol (Simbolos.protegido, yyline+1,yychar+1, new String (yytext()));}
"importar"          {System.out.println("importar");             ;return new Symbol (Simbolos.importar, yyline+1,yychar+1, new String (yytext()));}
"incluir_hk"          {System.out.println("incluirhk");             ;return new Symbol (Simbolos.incluir_hk, yyline+1,yychar+1, new String (yytext()));}
"llamar"          {System.out.println("llamar");            ;return new Symbol (Simbolos.llamar, yyline+1,yychar+1, new String (yytext()));}
"llamarhk"           {System.out.println("llamarhk");              ;return new Symbol (Simbolos.llamarhk, yyline+1,yychar+1, new String (yytext()));}
"als"           {System.out.println("als");              ;return new Symbol (Simbolos.als, yyline+1,yychar+1, new String (yytext()));}

"inicio"          {System.out.println("inicio");            ;return new Symbol (Simbolos.inicio, yyline+1,yychar+1, new String (yytext()));}
"si"           {System.out.println("si");              ;return new Symbol (Simbolos.si, yyline+1,yychar+1, new String (yytext()));}
"sino"           {System.out.println("sino");              ;return new Symbol (Simbolos.sino, yyline+1,yychar+1, new String (yytext()));}

"caso"          {System.out.println("caso");            ;return new Symbol (Simbolos.caso, yyline+1,yychar+1, new String (yytext()));}
"defecto"           {System.out.println("defecto");              ;return new Symbol (Simbolos.defecto, yyline+1,yychar+1, new String (yytext()));}
"seleccion"           {System.out.println("seleccion");              ;return new Symbol (Simbolos.seleccion, yyline+1,yychar+1, new String (yytext()));}


"mientras"          {System.out.println("mientras");            ;return new Symbol (Simbolos.mientras, yyline+1,yychar+1, new String (yytext()));}
"para"           {System.out.println("para");              ;return new Symbol (Simbolos.para, yyline+1,yychar+1, new String (yytext()));}
"continuar"           {System.out.println("continuar");              ;return new Symbol (Simbolos.continuar, yyline+1,yychar+1, new String (yytext()));}

"terminar"          {System.out.println("terminar");            ;return new Symbol (Simbolos.terminar, yyline+1,yychar+1, new String (yytext()));}
"retorno"           {System.out.println("retorno");              ;return new Symbol (Simbolos.retorno, yyline+1,yychar+1, new String (yytext()));}
"graphikar_funcion"           {System.out.println("graficar");              ;return new Symbol (Simbolos.graphikar_funcion, yyline+1,yychar+1, new String (yytext()));}
"dondeCada"          {System.out.println("dondeCada");            ;return new Symbol (Simbolos.dondecada, yyline+1,yychar+1, new String (yytext()));}
"dondetodo"           {System.out.println("dondetodo");              ;return new Symbol (Simbolos.dondetodo, yyline+1,yychar+1, new String (yytext()));}
"datos"           {System.out.println("datos");              ;return new Symbol (Simbolos.datos, yyline+1,yychar+1, new String (yytext()));}

"columna"          {System.out.println("columna");            ;return new Symbol (Simbolos.columna, yyline+1,yychar+1, new String (yytext()));}
"procesar"           {System.out.println("procesar");              ;return new Symbol (Simbolos.procesar, yyline+1,yychar+1, new String (yytext()));}
"donde"           {System.out.println("donde");              ;return new Symbol (Simbolos.donde, yyline+1 ,yychar+1, new String (yytext()));}


"verdadero"           {System.out.println("true");              ;return new Symbol (Simbolos.verdadero, yyline+1,yychar+1, new String (yytext()));}
"falso"           {System.out.println("falso");              ;return new Symbol (Simbolos.falso, yyline+1,yychar+1, new String (yytext()));}





/* -------------------------==: SIGNOS DE PUNTUACION :==----------------------*/

"."          {System.out.println("punto");             return new Symbol (Simbolos.punto, yyline+1,yychar+1, new String (yytext()));}
"?"         {System.out.println("interrogacion");       return new Symbol (Simbolos.interrogacion, yyline+1,yychar+1, new String (yytext()));}
"{"         {System.out.println("Abre_Llave");         return new Symbol (Simbolos.abre_llave, yyline+1,yychar+1, new String (yytext()));}
"}"         {System.out.println("Cierra_Llave");       return new Symbol (Simbolos.cierra_llave, yyline+1,yychar+1, new String (yytext()));}
"="        {System.out.println("igual");              return new Symbol (Simbolos.igual, yyline+1,yychar+1, new String (yytext()));}
"("         {System.out.println("abrePar");            return new Symbol (Simbolos.abre_par, yyline+1,yychar+1, new String (yytext()));}
")"         {System.out.println("cierraPar");          return new Symbol (Simbolos.cierra_par, yyline+1,yychar+1, new String (yytext()));}
"["         {System.out.println("abreCor");            return new Symbol (Simbolos.abre_cor, yyline+1,yychar+1, new String (yytext()));}
"]"         {System.out.println("cierraCor");          return new Symbol (Simbolos.cierra_cor, yyline+1,yychar+1, new String (yytext()));}
","         {System.out.println("coma");               return new Symbol (Simbolos.coma, yyline+1,yychar+1, new String (yytext()));}
":"         {System.out.println("dospuntos");          return new Symbol (Simbolos.dos_puntos, yyline+1,yychar+1, new String (yytext()));}





/* -------------------------==: EXPRESIONES REGULARES :==---------------------*/

{id}        {System.out.println(yytext());                return new Symbol (Simbolos.id, yyline+1,yychar+1, new String (yytext()));}
{cadena}    {System.out.println(yytext());                return new Symbol (Simbolos.cadena, yyline+1,yychar+1, new String (yytext()));}
{numero}    {System.out.println(yytext());                return new Symbol (Simbolos.numero, yyline+1,yychar+1, new String (yytext()));}
{decimal}   {System.out.println(yytext());                return new Symbol (Simbolos.decimal, yyline+1,yychar+1, new String (yytext()));}
{caracter}  {System.out.println(yytext());                return new Symbol (Simbolos.caracter, yyline+1,yychar+1, new String (yytext()));}



/* -------------------------------==: BLANCOS :==-----------------------------*/
[ \t\r\f\n]+        { /* Se ignoran */}

/* --------------------------------==: ERROR :==------------------------------*/
/* Cualquier Otro */
.                      { ErrorScan(yyline,yychar,yytext()); }

