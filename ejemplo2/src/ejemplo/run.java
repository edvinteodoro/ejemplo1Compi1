/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo;

import java.io.StringReader;

/**
 *
 * @author teodoro
 */
public class run {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        new parser(new AnalizadorLexico(new StringReader("5+5+5*+2"))).parse();
    }
    
}
