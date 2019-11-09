package AnalizadorLexico;
import java_cup.runtime.Symbol;
%%
%class AnalizadorLexico
%line
%char
%column
%cup
%eofval{
        System.out.println("Finalizacion de analizador lexico");
%eofval}
%eofclose
FinLinea = \r|\n\r\n
EspacioBlanco =" "
Tabulador = \t

/* Numeros */

Entero = 0|[1-9][1-9]*
Real = {Entero} "." {Entero}

/* Palabras reservadas */

r_verdadero = "verdadero"
r_falso = "falso"

/* String y comentario*/

String = "\""[0-9|a-z|A-Z|\']* "\""
Comentario = "//" [0-9|a-z|A-Z|\'| \f| " "]*  

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

/* Texto */

Identificador = [a-zA-Z]|[a-zA-Z0-9]*

%%

. {}