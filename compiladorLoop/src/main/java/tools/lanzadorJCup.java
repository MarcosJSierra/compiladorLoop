package tools;
import java.io.File;

public class lanzadorJCup {

    public static void main(String[] args) {
        String opciones[]=new String[5];
        opciones[0]="-destdir";
        opciones[1]="src/main/java/kurokitsune/main";
               // +File.separator+
                //"sumadoraarbol"; //cambiar destino
        opciones[2]="-parser";
        opciones[3]="AnalizadorSintactico"; //cambiar el nombre de la clase
        opciones[4]="src/main/java/tools/gramaticaLoop.jcup";
                
        try {     
            java_cup.Main.main(opciones);
            } 
        catch (Exception e) {
            System.out.print(e);
            }


    }


}