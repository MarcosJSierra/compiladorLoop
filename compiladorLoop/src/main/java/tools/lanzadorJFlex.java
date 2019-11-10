/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;
import jflex.SilentExit;
import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author marcos
 */
public class lanzadorJFlex {
    public static void main (String args[]){
        
        String opciones[] = new String[3];
        opciones[0] = "-d";
        opciones[2] ="src/main/java/tools/reglasLoop.jflex";
        opciones[1] ="src/main/java/kurokitsune/main";
        try{
            jflex.Main.generate(opciones);
            
        } catch (SilentExit ex){
            Logger.getLogger(lanzadorJFlex.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
}
