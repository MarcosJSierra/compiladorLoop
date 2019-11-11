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
    private final int ntabulaciones;
    private int entero;
    public static int contadorGlobal;
    public static int contadorLocal;
    
    public token(int col, int row, String cadena, int ntabulaciones){
        this.col = col;
        this.row = row;
        this.ntabulaciones = ntabulaciones;
        this.cadena = cadena;
    }
  
    public int getCol() {
        return col;
    }

    public int getRow() {
        return row;
    }

    public String getCadena() {
        return cadena;
    }

    public int getEntero() {
        return entero;
    }
    
    @Override
    public String toString() {
        return "token{" + "col=" + col + ", row=" + row + ", cadena=" + cadena + ", entero=" + entero + '}';
    }
 }

