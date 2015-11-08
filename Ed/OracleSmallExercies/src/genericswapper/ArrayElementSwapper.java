/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genericswapper;

/**
 *
 * @author robinschaufler
 */
public class ArrayElementSwapper {
    ArrayElementSwapper() {
        
    }
    public static <T> void swap(T[] ts, int i, int j) {
        T x = ts[i];
        ts[i] = ts[j];
        ts[j] = x;
    }
}
