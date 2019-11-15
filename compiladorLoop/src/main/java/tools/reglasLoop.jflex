package kurokitsune.main;
import java_cup.runtime.Symbol;
import informacion.*;
%%
%class AnalizadorLexico
%line
%char
%column
/*%cup*/
%standalone
%eofval{
        mensaje = "Finalizacion de analisis lexico\n";
        cargar_archivo.escribirNotificacion(mensaje, 0);
        //return 1;
        return new Symbol(sym.EOF);
%eofval}
%eofclose
%{
        String mensaje;
        private token tmp;
        private void comprobacionEspacios(){
                if(token.contadorLocal==(token.contadorGlobal+1)){
                        token.contadorGlobal +=1;
                }else if(token.contadorLocal < token.contadorGlobal){
                      token.contadorGlobal = token.contadorLocal;
                }else if(token.contadorLocal  == token.contadorGlobal){

                }else{
                        mensaje = "Error de tabulacion en:\ncol: "+ yycolumn+" || linea: "+yyline+"\n";
                       cargar_archivo.escribirNotificacion(mensaje, 1);
                }
        }
%}
%init{
        
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
String = "\"" [0-9|a-z|A-Z|" "|"."|"/"]* "\""
Comentario = "//" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","]* | "/*" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","|\r|\n|\r\n]* "*/" | "//" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","]* [\r|\n|\r\n] | "/*" [0-9|a-z|A-Z|\'| \f|" "|"."|"/"|","|\r|\n|\r\n]* "*/" [\r|\n|\r\n]

/* Tipos Datos */

r_entero = "entero"
r_real = "real"
r_booleano = "boleano"
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
r_and = "AND"
r_or = "OR"
r_tangente = "tangente"
r_log = "logaritmo"
r_raiz = "raiz"
r_instanciar  = "instanciar"
r_eliminar = "eliminar"
r_decrementar = "decrementar"
r_incrementar = "incrementar"
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
r_destructor = "destructor"
r_extiende = "extiende"
r_incluir = "incluir"

/* Simbolos */

r_comparacion = ">"|"<"|"=="|"!=" 
r_puntocoma = ";"{FinLinea} | ";"
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
r_abrir_c = "{"
r_cerrar_c = "}"
r_potencia = "^"
r_punto = "."

/* Texto */

Identificador = [a-z|A-Z|"á"|"é"|"í"|"ó"|"ú"|"ñ"|"Ñ"|"Á"|"É"|"Í"|"Ó"|"Ú"]|[a-z|A-Z|0-9|"_"|"á"|"é"|"í"|"ó"|"ú"|"ñ"|"Ñ""Á"|"É"|"Í"|"Ó"|"Ú"]*
%xstates estado1
%%
<estado1>{
        {FinLinea}              {       
                                
                                tmp = new token(yycolumn, yyline, "FINLINEA", token.contadorLocal);
                                token.contadorLocal=0;
                                yybegin(YYINITIAL);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.FINLINEA, tmp);
                        }
        {Tabulador}             {
                                        //cargar_archivo.escribirToken("Tabulador: "+token.contadorLocal);
                                        //System.out.println("tabulador"+ "estado1");
                                }
        {Tabulador_espacio}     {
                                        
        }
        /* Numeros */

        {Entero}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 1);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ENTERO, tmp);
                                        
                                }
        {Real}                  {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 1);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.REAL, tmp);

                                }
        /* Palabras reservadas */

        {r_verdadero}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 2);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.VERDADERO, tmp);

                                }
        {r_falso}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 2);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.FALSO, tmp);

                                }

        /* String y comentario*/

        {String}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.STRING, tmp);

                                }
        {Comentario}            {
                                        //System.out.println("Comentario: " + yytext());

                                }

        /* Tipos Datos */

        {r_entero}              {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.RENTERO, tmp);
                                }
        {r_real}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.RREAL, tmp);

                                }
        {r_booleano}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.BOLEANO, tmp);

                                }
        {r_cadena}              {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CADENA, tmp);

                                }
        {r_nulo}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.NULO, tmp);

                                }

        /* Comandos */

        {r_escribir}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ESCRIBIR, tmp);

                                }
        {r_leer}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.LEER, tmp);

                                }
        {r_incrementar}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.INCREMENTAR, tmp);

                                }
        {r_decrementar}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.DECREMENTAR, tmp);

                                }
        {r_devolver}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.DEVOLVER, tmp);


                                }
        {r_cadena_entero}       {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CADENAENTERO, tmp);

                                }
        {r_cadena_real}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CADENAREAL, tmp);

                                }
        {r_cadena_boleano}      {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CADENABOLEANO, tmp);

                                }
        {r_seno}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.SENO, tmp);

                                }
        {r_coseno}              {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.COSENO, tmp);

                                }
        {r_tangente}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.TANGENTE, tmp);

                                }
        {r_log}                 {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.LOG, tmp);

                                }
        {r_raiz}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.RAIZ, tmp);
                                        

                                }
        {r_instanciar}          {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.INSTANCIAR, tmp);

                                }
        {r_eliminar}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ELIMINAR, tmp);

                                }
        {r_si}                  {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.SI, tmp);

                                }
        {r_entonces}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ENTONCES, tmp);

                                }
        {r_sino}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.SINO, tmp);

                                }
        {r_desde}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.DESDE, tmp);

                                }
        {r_mientras}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.MIENTRAS, tmp);

                                }
        {r_hacer}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.HACER, tmp);

                                }

        /* Estrcuturas programa */

        {r_clase}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CLASE, tmp);

                                }
        {r_propiedades}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PROPIEDADES, tmp);

                                }
        {r_metodos}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.METODOS, tmp);

                                }
        {r_publico}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PUBLICO, tmp);

                                }
        {r_privado}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PRIVADO, tmp);

                                }
        {r_protegido}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PROTEGIDO, tmp);

                                }
        {r_publica}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PUBLICA, tmp);

                                }
        {r_privada}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());

                                        return new Symbol(sym.PRIVADAS, tmp);
                                }
        {r_protegida}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PROTEGIDAS, tmp);
                                        

                                }
        {r_Principal}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PRINCIPAL, tmp);
                                        

                                }
        {r_constructor}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CONSTRUCTOR, tmp);
                                        

                                }
        {r_destructor}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                        return new Symbol(sym.DESTRUCTOR, tmp);
                                        

                                }
        {r_extiende}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.EXTIENDE, tmp);
                                        

                                }
        {r_incluir}             {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.INCLUIR, tmp);
                                        

                                }

        /* Simbolos */

        {r_punto}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PUNTO, tmp);
                                        

                                }
        {r_potencia}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.POTENCIA, tmp);
                                        

                                }
        {r_comparacion}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.COMPARACION, tmp);
                                        

                                }
        {r_puntocoma}           {
                                        tmp = new token(yycolumn, yyline, "FINLINEA", token.contadorLocal);
                                        token.contadorLocal = 0;
                                        yybegin(YYINITIAL);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.FINLINEA, tmp);
                                        

                                }
        {r_dospuntos}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.DOSPUNTOS, tmp);
                                        
                                }
        {r_suma}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.SUMA, tmp);
                                        

                                }
        {r_resta}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.RESTA, tmp);
                                        

                                }
        {r_multiplicacion}      {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.MULTI, tmp);
                                        

                                }
        {r_division}            {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.DIVISION, tmp);
                                        

                                }
        {r_a_parentesis}        {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.APARENTESIS, tmp);
                                        

                                }
        {r_c_parentesis}        {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CPARENTESIS, tmp);
                                        

                                }
        {r_igual}               {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.IGUAL, tmp);
                                        

                                }
        {r_porcentaje}          {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.PORCENTAJE, tmp);
                                        

                                }
        {r_coma}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.COMA, tmp);
                                        

                                }
        {r_abrir_c_c}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ACORCHETEC, tmp);
                                        

                                }
        {r_cerrar_c_c}          {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CCORCHETEC, tmp);
                                        

                                }
        {r_abrir_c}           {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ACORCHETE, tmp);
                                        

                                }
        {r_cerrar_c}          {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.CCORCHETE, tmp);
                                        

                                }
        {r_and}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.AND, tmp);
                                        

                                }
        {r_or}                {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.OR, tmp);
                                        

                                }

        /* Texto */

        {Identificador}         {
                                        this.comprobacionEspacios();
                                        tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                        cargar_archivo.escribirToken(tmp.toString());
                                        return new Symbol(sym.ID, tmp);
                                        

                                }
        {lineaBlanca}           {
                                       //cargar_archivo.escribirToken("Espacio Blanco");
                                }

        .       {}
}
{FinLinea}              {       
                                token.contadorLocal=0;
                                //cargar_archivo.escribirToken("Finlinea ignorada");

                        }
{Tabulador}             {
                                token.contadorLocal+=1;
                                //cargar_archivo.escribirToken("Tabulador: "+token.contadorLocal);
                        }
{Tabulador_espacio}     {
                                
}
/* Numeros */

{Entero}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 1);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ENTERO, tmp);

                        }
{Real}                  {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 1);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.REAL, tmp);

                        }
/* Palabras reservadas */

{r_verdadero}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 2);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.VERDADERO, tmp);

                        }
{r_falso}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal, 2);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.FALSO, tmp);

                        }

/* String y comentario*/

{String}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.STRING, tmp);

                        }
{Comentario}            {
                                //System.out.println("Comentario: " + yytext());

                        }

/* Tipos Datos */

{r_entero}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.RENTERO, tmp);

                        }
{r_real}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.RREAL, tmp);

                        }
{r_booleano}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.BOLEANO, tmp);
                                

                        }
{r_cadena}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CADENA, tmp);

                        }
{r_nulo}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.NULO, tmp);

                        }

/* Comandos */

{r_escribir}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                return new Symbol(sym.ESCRIBIR, tmp);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                        }
{r_leer}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.LEER, tmp);

                        }
{r_devolver}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.DEVOLVER, tmp);

                        }
{r_cadena_entero}       {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CADENAENTERO, tmp);

                        }
{r_cadena_real}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CADENAREAL, tmp);

                        }
{r_cadena_boleano}      {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CADENABOLEANO, tmp);

                        }
{r_seno}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.SENO, tmp);

                        }
{r_coseno}              {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.COSENO, tmp);

                        }
{r_tangente}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.TANGENTE, tmp);

                        }
{r_log}                 {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.LOG, tmp);

                        }
{r_raiz}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.RAIZ, tmp);

                        }
{r_instanciar}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.INSTANCIAR, tmp);

                        }
{r_eliminar}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ELIMINAR, tmp);

                        }
{r_si}                  {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.SI, tmp);

                        }
{r_entonces}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ENTONCES, tmp);

                        }
{r_sino}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.SINO, tmp);

                        }
{r_desde}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.DESDE, tmp);

                        }
{r_mientras}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.MIENTRAS, tmp);

                        }
{r_hacer}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.HACER, tmp);

                        }

/* Estrcuturas programa */

{r_clase}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CLASE, tmp);

                        }
{r_propiedades}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PROPIEDADES, tmp);

                        }
{r_metodos}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.METODOS, tmp);

                        }
{r_publico}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PUBLICO, tmp);

                        }
{r_privado}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PRIVADO, tmp);

                        }
{r_protegido}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PROTEGIDO, tmp);

                        }
{r_publica}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PUBLICA, tmp);

                        }
{r_privada}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PRIVADAS, tmp);

                        }
{r_protegida}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PROTEGIDAS, tmp);

                        }
{r_Principal}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PRINCIPAL, tmp);

                        }
{r_constructor}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CONSTRUCTOR, tmp);

                        }
{r_destructor}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                return new Symbol(sym.DESTRUCTOR, tmp);

                        }
{r_extiende}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.EXTIENDE, tmp);

                        }
{r_incluir}             {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.INCLUIR, tmp);

                        }

/* Simbolos */

{r_punto}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PUNTO, tmp);

                        }
{r_potencia}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.POTENCIA, tmp);

                        }
{r_comparacion}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.COMPARACION, tmp);

                        }
{r_puntocoma}           {
                                cargar_archivo.escribirToken("finlinea" + "estado2");

                        }
{r_dospuntos}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.DOSPUNTOS, tmp);

                        }
{r_suma}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.SUMA, tmp);

                        }
{r_resta}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.RESTA, tmp);

                        }
{r_multiplicacion}      {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.MULTI, tmp);

                        }
{r_division}            {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.DIVISION, tmp);

                        }
{r_a_parentesis}        {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.APARENTESIS, tmp);

                        }
{r_c_parentesis}        {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CPARENTESIS, tmp);

                        }
{r_igual}               {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.IGUAL, tmp);

                        }
{r_porcentaje}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.PORCENTAJE, tmp);

                        }
{r_coma}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.COMA, tmp);

                        }
{r_abrir_c_c}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ACORCHETEC, tmp);

                        }
{r_cerrar_c_c}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CCORCHETEC, tmp);

                        }
{r_abrir_c}           {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ACORCHETE, tmp);

                        }
{r_cerrar_c}          {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.CCORCHETE, tmp);

                        }        
{r_and}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.AND, tmp);

                        }
{r_or}                {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.OR, tmp);

                        }

/* Texto */

{Identificador}         {
                                this.comprobacionEspacios();
                                tmp = new token(yycolumn, yyline, yytext(), token.contadorLocal);
                                yybegin(estado1);
                                cargar_archivo.escribirToken(tmp.toString());
                                return new Symbol(sym.ID, tmp);

                        }
{lineaBlanca}           {
                                //System.out.println("Espacio Blanco");
                        }

.       {}