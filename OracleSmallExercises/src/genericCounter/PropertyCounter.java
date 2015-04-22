/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genericCounter;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

public class PropertyCounter {
    interface Tester<E> {
        Boolean runTest(E e);
    }
    static <T> int countProperties(Collection<T> c, Tester<T> t) {
        int count = 0;
        for (T i: c) {
            if (Boolean.TRUE.equals(t.runTest(i))) {
                count++;
            }
        }
        return count;
    }
    private static class OddTesterImpl implements Tester<Integer> {
        @Override
        public Boolean runTest(Integer x) {
            if (x == null) {
                return Boolean.FALSE;
            }
            return 1 == x % 2;
        }
    }
    private static class PrimeTesterImpl implements Tester<Integer> {
        @Override
        public Boolean runTest(Integer x) {
            if (x == null) {
                return Boolean.FALSE;
            }
            if (x < 0) {
                return Boolean.FALSE;
            }
            if (x < 4) {
                return Boolean.TRUE;
            }
            for (int i = 2; i < (x / 2 + 1); i++) {
                if (0 == x % i) {
                    return Boolean.FALSE;
                }
            }
            return Boolean.TRUE;
        }
    }
    private static class PalindromeTesterImpl implements Tester<String> {
        @Override
        public Boolean runTest(String x) {
            StringBuilder compressed = new StringBuilder();
            StringBuilder reversed = new StringBuilder();
            char[] xAsArray = x.toLowerCase().toCharArray();
            for (char c: xAsArray) {
                if ('a' <= c && c <= 'z') {
                    compressed.append(c);
                    reversed.insert(0, c);
                }
            }
            System.out.println("Comparing " + compressed.toString() + " to " + reversed.toString());
            return compressed.toString().equals(reversed.toString());
        }
    }
    public static void main(String[] args) {
        List<String> maybePalindromes = Arrays.asList("abc", "A B C", "Never odd or even.");
        System.out.println("Found " + countProperties(maybePalindromes, new PalindromeTesterImpl()) + " palindromes.");
        
        List<Integer> oddOrEven = Arrays.asList(1, 2, 3, 4, 5);
        System.out.println("Found " + countProperties(oddOrEven, new OddTesterImpl()) + " odd numbers.");
        
        List<Integer> maybePrimes = Arrays.asList(1, 2, 3, 4, 10, 11);
        System.out.println("Found " + countProperties(maybePrimes, new PrimeTesterImpl()) + " primes.");
    }
}
