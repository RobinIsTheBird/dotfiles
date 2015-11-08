/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliberateerrors;

/**
 *
 * @author robinschaufler
 */
public class DeliberateErrorsApp {
    
    static int correctName;
    static double okNameDouble;
    static int IncorrectNamingConvention; // no complaint
    static int bad_underscore; // no complaint
    static int $likeJquery; // no complaint
    
    static int illegal#charInFieldName; // illegal character: '#'; cannot find symbol
    static int illegal spaceCharInFieldName; // variable illegal is already defined
    static int space charIsNotAllowed; // ';' expected; cannot find symbol
    static int int; // <identifier expected
    static int float; // ditto

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int localCorrectInt;
        double localOkDouble;
        
        System.out.println("correctName: " + correctName);
        System.out.println("localCorrectInt: " + localCorrectInt); // ... might not have been initialized
        System.out.println("okNameDouble: " + okNameDouble);
        System.out.println("localOkDouble: " + localOkDouble);
    }
    
}
