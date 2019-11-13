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
    private final int banderaDigito;
    private final int row;
    private final int entero;
    private final double real;
    private final boolean boleano;
    private final String cadena;
    private final int ntabulaciones;
    public static int contadorGlobal;
    public static int contadorLocal;
    
    public token(int col, int row, String cadena, int ntabulaciones){
        this.col = col;
        this.row = row;
        this.ntabulaciones = ntabulaciones;
        this.cadena = cadena;
        this.entero = 0;
        this.real = 0;
        this.boleano = false;
        banderaDigito = 0;
              
    }
    public token(int col, int row, String cadena, int ntabulaciones, int digito){
        this.col = col;
        this.row = row;
        this.ntabulaciones = ntabulaciones;
        this.cadena = cadena;
        this.banderaDigito = 1;
        if(digito == 1){
                this.real = Double.parseDouble(cadena);
                this.entero= (int)this.real;
                
                if(this.real>0){
                    this.boleano = false;
                }else{
                    this.boleano = true;
                }
        }else{
            if(cadena.equals("verdadero")){
                this.real = 1;
                this.entero= 1;
                this.boleano = true;
            }else{
                this.real = 0;
                this.entero= 0;
                this.boleano = false;
            }
        }
                
                
        
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

    public int getNtabulaciones() {
        return ntabulaciones;
    }

    public int getBanderaDigito() {
        return banderaDigito;
    }

    public double getReal() {
        return real;
    }

    public boolean isBoleano() {
        return boleano;
    }

    @Override
    public String toString() {
        return "token{" + "col=" + col + ", row=" + row + ", cadena=" + cadena + ", ntabulaciones=" + ntabulaciones + "}";
    }
    
    
 }

