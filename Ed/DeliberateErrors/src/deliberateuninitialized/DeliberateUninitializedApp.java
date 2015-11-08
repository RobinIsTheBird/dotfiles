/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deliberateuninitialized;

import java.awt.Rectangle;

/**
 *
 * @author robinschaufler
 */
public class DeliberateUninitializedApp {

    static int correctName;
    static double okNameDouble;
    static char okNameChar;
    static boolean okNameBool;
    static char[] okNameCharArray = new char[7];
    static String OK_NAME_STRING;
    static String OK_NAME_ALLOCATED_STRING = new String();
    
    static public class NumberHolder {
        public int anInt;
        public float aFloat;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int localCorrectInt;
        double localOkDouble;
        Rectangle myRect = new Rectangle();
        NumberHolder myNumbers = new NumberHolder();
        
        myNumbers.anInt = 40;
        myNumbers.aFloat = 50.0f;
        System.out.println(myNumbers.anInt);
        System.out.println(myNumbers.aFloat);
        myRect.width = 40;
        myRect.height = 50;
        System.out.println("correctName: " + correctName);
        System.out.println("okNameDouble: " + okNameDouble);
        System.out.println("okNameChar: " + okNameChar);
        System.out.println("okNameBool: " + okNameBool);
        System.out.println("okNameCharArray: " + okNameCharArray);
        System.out.println("OK_NAME_STRING: " + OK_NAME_STRING);
        System.out.println("OK_NAME_ALLOCATED_STRING: " + OK_NAME_ALLOCATED_STRING);
        System.out.println("localCorrectInt: " + localCorrectInt); // ... might not have been initialized
        System.out.println("localOkDouble: " + localOkDouble);
    }
    
}
