/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package iandi.reversecharsequence;

import java.util.List;

/**
 *
 * @author robinschaufler
 */
public class ReverseCharSequence implements java.lang.CharSequence {
    
    private String reversed;
    
    public ReverseCharSequence(String str) {
        String[] strAsArray = str.split("");
        List<String>strAsList = java.util.Arrays.asList(strAsArray);
        java.util.Collections.reverse(strAsList);
        reversed = "";
        for (String oneChar : strAsList) {
            if (oneChar != null) {
                reversed += oneChar;
            }
        }
    }

    @Override
    public int length() {
        return reversed.length();
    }

    @Override
    public char charAt(int index) {
        return reversed.charAt(index);
    }

    @Override
    public CharSequence subSequence(int start, int end) {
        return reversed.subSequence(start, end);
    }
    
    public String toString() {
        return reversed;
    }
    
}
