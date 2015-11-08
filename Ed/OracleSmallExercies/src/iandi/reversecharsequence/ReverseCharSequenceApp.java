/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iandi.reversecharsequence;

/**
 *
 * @author robinschaufler
 */
public class ReverseCharSequenceApp {
    
    public static void main(String[] args) {
        String input = "Select one of the sentences from this book to use as the data.";
        System.out.println("Run main2");
        if (0 < args.length) {
            input = args[0];
        }
        ReverseCharSequence reversed = new ReverseCharSequence(input);
        System.out.printf("Reversed char sequence has length %d, and looks like %s.", reversed.length(), reversed.toString());
        int startIndex = 5;
        if (reversed.length() <= startIndex) {
            startIndex = 0;
        }
        int endIndex = 10;
        if (reversed.length() < endIndex) {
            endIndex = reversed.length();
        }
        System.out.printf("input[%d] = %c, [%d-%d] = %s",
                startIndex, reversed.charAt(startIndex),
                startIndex, endIndex, reversed.subSequence(startIndex, endIndex));
    }
}
