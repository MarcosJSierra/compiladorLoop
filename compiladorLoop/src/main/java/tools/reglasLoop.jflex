package AnalizadorLexico;
import java_cup.runtime.Symbol;
import informacion.*;
/*import AnalizadorSemantico.*;*/
%%
%class AnalizadorLexico
%line
%char
%column
%cup
/*%standalone*/
%eofval{
        System.out.println("Finalizacion de analizador lexico");
       
%eofval}
%eofclose
%{
        public int contadorLocal;
        private token tmp;
        private void comprobacionEspacios(){
                if(contadorLocal==(token.contadorGlobal+1)){
                        token.contadorGlobal +=1;
                        
                }else if(contadorLocal < token.contadorGlobal){
                       while(contadorLocal < token.contadorGlobal){
                               tmp = new token(yycolumn, yyline, "END");
                                //return new Symbol(sym.END, tmp);
                                System.out.println(tmp);
                                token.contadorGlobal-=1;
                       }
                }else if(contadorLocal  == token.contadorGlobal){

                }else{
                        System.out.println("error en espaciado");
                }
        }
%}
%init{
        contadorLocal = 0;
%init}
FinLinea = \r|\n|\r\n

Tabulador_espacio = " "
Tabulador = {Tabulador_espacio} {Tabulador_espacio} {Tabulador_espacio} {Tabulador_espacio}| {Tabulador_espacio} {Tabulador_espacio}

/* Numeros */

Entero = 0|[1-9][1-9]*
Real = {Entero} "." {Entero}

/* Palabras reservadas */

r_verdadero = "verdadero"
r_falso = "falso"

/* String y comentario*/
lineaBlanca = [" "]+ [\r|\n|\r\n] 
String = "\"" [0-9|a-z|A-Z|" "]* "\""
Comentario = "//" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","]* | "/*" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","|\r|\n|\r\n]* "*/" | "//" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","]* [\r|\n|\r\n] | "/*" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","|\r|\n|\r\n]* "*/" [\r|\n|\r\n]

/* Tipos Datos */

r_entero = "entero"
r_real = "real"
r_booleano = "booleano"
r_cadena = "cadena"
r_nulo = "nulo"


/* Comandos */

r_escribir = "escribir"
r_leer = "leer"
r_devolver = "devolver"
r_cadena_entero = "cadenaAEntero"
r_cadena_real = "cadenaAReal"
r_cadena_boleano = "cadenaABoleano"
r_seno = "seno"
r_coseno = "coseno"
r_tangente = "tangente"
r_log = "logaritmo"
r_raiz = "raiz"
r_instanciar  = "instanciar"
r_eliminar = "eliminar"
r_si = "si"
r_entonces = "entonces"
r_sino = "sino"
r_desde = "desde"
r_mientras = "mientras"
r_hacer = "hacer"

/* Estrcuturas programa */

r_clase = "clase"
r_propiedades = "propiedades"
r_metodos = "metodos"
r_publico = "publicos"
r_privado = "privados"
r_protegido = "protegidos"
r_publica = "publicas"
r_privada = "privadas"
r_protegida = "protegidas"
r_Principal = "Principal"
r_constructor = "constructor"
r_extiende = "extiende"
r_incluir = "incluir"

/* Simbolos */

r_comparacion = ">"|"<"|"=="|"!="
r_puntocoma = ";"
r_dospuntos = ":"
r_suma = "+"
r_resta = "-"
r_multiplicacion = "*"
r_division = "/"
r_a_parentesis = "("
r_c_parentesis = ")"
r_igual = "="
r_porcentaje = "%"
r_coma = ","
r_abrir_c_c = "["
r_cerrar_c_c = "]"
r_punto = "."

/* Texto */

Identificador = [a-zA-Z]|[a-zA-Z0-9]*

%%
{FinLinea}              {       
                                contadorLocal=0;
                                tmp = new token(yycolumn, yyline, "FINLINEA");
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{Tabulador}             {
                                contadorLocal+=1;
                                //System.out.println ("Tabulador: "+contadorLocal);
                        }
{Tabulador_espacio}     {
                                
}
/* Numeros */

{Entero}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym.ENTERO, tmp);

                        }
{Real}                  {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym.REAL, tmp);

                        }
/* Palabras reservadas */

{r_verdadero}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_falso}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }

/* String y comentario*/

{String}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{Comentario}            {
                                //System.out.println("Comentario: " + yytext());

                        }

/* Tipos Datos */

{r_entero}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_real}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_booleano}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_cadena}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_nulo}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }

/* Comandos */

{r_escribir}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_leer}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_devolver}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_cadena_entero}       {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_cadena_real}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_cadena_boleano}      {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_seno}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_coseno}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_tangente}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_log}                 {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_raiz}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_instanciar}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_eliminar}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_si}                  {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_entonces}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_sino}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_desde}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_mientras}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_hacer}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }

/* Estrcuturas programa */

{r_clase}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_propiedades}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_metodos}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_publico}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_privado}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_protegido}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_publica}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_privada}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_protegida}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_Principal}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_constructor}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_extiende}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_incluir}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }

/* Simbolos */

{r_punto}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_comparacion}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_puntocoma}           {
                                tmp = new token(yycolumn, yyline, "FINLINEA");
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_dospuntos}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_suma}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_resta}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_multiplicacion}      {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_division}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_a_parentesis}        {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_c_parentesis}        {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_igual}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_porcentaje}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_coma}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_abrir_c_c}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{r_cerrar_c_c}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }

/* Texto */

{Identificador}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext());
                                System.out.println(tmp);
                                //return new Symbol(sym., tmp);

                        }
{lineaBlanca}           {
                                //System.out.println("Espacio Blanco");
                        }

.       {System.out.println("Error");}