/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haskellgraphik;

/**
 *
 * @author Alina
 */
public class GeneradorCompiladores {
    
     public static void main(String[] args) {
        generarCompilador();
    }
    
    private static void generarCompilador(){
        try {
            String ruta = "C:\\Users\\Alina\\Documents\\NetBeansProjects\\HaskellGraphik\\src\\Gramaticas\\";
            String opcFlex[] = { ruta + "Analizador_Lexico.jflex", "-d", ruta };
            jflex.Main.generate(opcFlex);
            String opcCUP[] = { "-destdir", ruta, "-parser", "parser", ruta + "Analizador_Sintactico.cup" };
            java_cup.Main.main(opcCUP);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
