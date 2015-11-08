/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exceptions.listofnumbers;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author robinschaufler
 */
public class ListOfNumbersTestApp {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ListOfNumbers aList = new ListOfNumbers();
        
        if (args.length < 1) {
            System.err.println("First argument must be a filename.");
            System.exit(1);
        }
        aList.readList(args[0]);
        
        aList.writeList();
    }
}
