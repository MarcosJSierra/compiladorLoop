/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package informacion;

/**
 *
 * @author marcos
 */
public class token {
    private final int col;
    private final int row;
    private final String cadena;
    private int entero;
    public static int contadorGlobal;
    
    public token(int col, int row, String cadena){
        this.col = col;
        this.row = row;
        this.cadena = cadena;
    }

    @Override
    public String toString() {
        return "token{" + "col=" + col + ", row=" + row + ", cadena=" + cadena + ", entero=" + entero + '}';
    }
 }

