package informacion;

import java.util.ArrayList;
import java.util.List;

public class Nodo {
    private int tipo;
    private int operador;
    private int valor;
    private int seccion;
    private String cadena;
    private final ArrayList<Nodo> hijos;

    public static final int TIPO_EXPRESION=1;
    public static final int TIPO_NUMERO=2;
    public static final int TIPO_OPERADOR=3;
    public static final int TIPO_SECCION=4;
    public static final int TIPO_CADENA=5;
     
    public static final int OP_SUMA = 10;
    public static final int OP_RESTA = 11;
    public static final int OP_MULTI = 12;
    public static final int OP_DIVISION = 13;
    
    public static final int SEC_INCLUDE = 41;
    public static final int SEC_CLASE = 42;
    public static final int SEC_PRINCIPAL =43;
    
    
    /**
     *
     * @param tipo de nodo a crear
     * @param valor del nodo a crear
     */
    public Nodo(int tipo, int valor) {
        this.hijos = new ArrayList<>();  
        this.tipo = tipo;
        switch (this.tipo) {
            case Nodo.TIPO_EXPRESION:
                break;
            case Nodo.TIPO_NUMERO:
                this.valor = valor;
                break;
            case Nodo.TIPO_OPERADOR:
                this.operador = valor;
                break;
            case Nodo.TIPO_SECCION:
                this.seccion = valor;
                break;
        }
    }
    
    public Nodo(int valor) {
        this.hijos = new ArrayList<>();
        this.tipo=TIPO_NUMERO;
        this.valor=valor;
        this.operador=0;
        this.seccion=0;
    }
    public Nodo(String valor){
        this.hijos = new ArrayList<>();
        this.tipo=TIPO_CADENA;
        this.cadena=valor;
        this.operador=0;
        this.seccion=0;
    }
    
    public Nodo() {
        this.hijos = new ArrayList<>();
        this.tipo=0;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the operador
     */
    public int getOperador() {
        return operador;
    }

    public String getOperadorString() {
        switch(operador)
        {
            case OP_SUMA:
            {
                return "+";
            }
            case OP_RESTA:
            {
               return "-"; 
            }
            case OP_MULTI:
            {
                return "*";
            }
            case OP_DIVISION:
            {
                return "/";
            }
            
        }
        return "no hallado";
      
    }
    public String getSeccionString(){
        switch(seccion)
        {
            case SEC_INCLUDE:
            {
                return "incluir";
            }
            case SEC_CLASE:
            {
                return "clase";
            }
            case SEC_PRINCIPAL:
            {
                return "principal";
            }
        }
        return "no hallado";
    }
    
    /**
     * @param operador the operador to set
     */
    public void setOperador(int operador) {
        this.operador = operador;
    }

    /**
     * @return the valor
     */
    public int getValor() {
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(int valor) {
        this.valor = valor;
    }
    public String getCadena(){
        return this.cadena;
    }

    /**
     * @return the hijos
     */
    public List<Nodo> getHijos() {
        return hijos;
    }
    
    public boolean agregarHijo(Nodo nodo){
        return hijos.add(nodo);
    }
}
