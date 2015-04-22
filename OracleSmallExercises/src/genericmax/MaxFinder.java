/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genericmax;

import java.util.List;

/**
 *
 * @author robinschaufler
 */
public class MaxFinder {
    // Why does the answer on http://docs.oracle.com/javase/tutorial/java/generics/QandE/generics-answers.html
    // say extends Object & Comparable...? Isn't Object a given?
    public <T extends Comparable<? super T>> T findMaxInRange(List<? extends T> ts, int begin, int end) {
        if (begin < 0) {
            begin = 0;
        }
        if (ts.size() < end) {
            end = ts.size();
        }
        if (end < begin) {
            return null;
        }
        T max = ts.get(begin);
        for (++begin; begin < end; ++begin) {
            if (max.compareTo(ts.get(begin)) < 0) {
                max = ts.get(begin);
            }
        }
        return max;
    }
    
    class NatNum extends Number implements Comparable<Integer> {
        private final Integer num;
        NatNum(int x) {
            if (x < 1) {
                x = 1;
            }
            num = x;
        }
        NatNum(Integer x) {
            this(x.intValue());
        }
        @Override
        public boolean equals(Object o) {
            if (!(o instanceof NatNum)) {
                return false;
            }
            NatNum onum = (NatNum)o;
            return num.equals(onum.num);
        }
        
        @Override
        public int hashCode() {
            return num;
        }
        
        @Override
        public String toString() {
            return num.toString();
        }

        @Override
        public int intValue() {
            return num;
        }

        @Override
        public long longValue() {
            return num.longValue();
        }

        @Override
        public float floatValue() {
            return num.floatValue();
        }

        @Override
        public double doubleValue() {
            return num.doubleValue();
        }

        @Override
        public int compareTo(Integer o) {
            return num.compareTo(o);
        }
    }
    
    public static void main(String[] args) {
        
    }
}
