
package arraydemoapp;


public class ArrayDemoApp {
    
    private static void demoArray() {
        // declares an array of integers
        int[] anArray;
 
        // allocates memory for 10 integers
        anArray = new int[10];
            
        // initialize first element
        anArray[0] = 101;
        // initialize second element
        anArray[1] = 201;
        // and so forth
        anArray[2] = 301;
        anArray[3] = 401;
        anArray[4] = 501;
        anArray[5] = 601;
        anArray[6] = 701;
        anArray[7] = 801;
        anArray[8] = 901;
        anArray[9] = 1001;
 
        System.out.println("Element at index 0: "
                           + anArray[0]);
        System.out.println("Element at index 1: "
                           + anArray[1]);
        System.out.println("Element at index 2: "
                           + anArray[2]);
        System.out.println("Element at index 3: "
                           + anArray[3]);
        System.out.println("Element at index 4: "
                           + anArray[4]);
        System.out.println("Element at index 5: "
                           + anArray[5]);
        System.out.println("Element at index 6: "
                           + anArray[6]);
        System.out.println("Element at index 7: "
                           + anArray[7]);
        System.out.println("Element at index 8: "
                           + anArray[8]);
        System.out.println("Element at index 9: "
                           + anArray[9]);
    }
    
    private static void demoLoop() {
        int[] anArray = { 
            100, 200, 300,
            400, 500, 600, 
            700, 800, 900, 1000
        };
        short i;
        for (i = 0; i < anArray.length; i++) {
            System.out.println("Element at index " + i + ": " + anArray[i]);
        }
    }
    
    private static void demo2DimArray() {
        final String[][] names = {
            {"Mr. ", "Mrs. ", "Ms. "},
            {"Smith", "Jones"}
        };
        // Mr. Smith
        System.out.println(names[0][0] + names[1][0]);
        // Ms. Jones
        System.out.println(names[0][2] + names[1][1]);
    }
    
    private static void demoArrayCopy() {
        short prefixLength = 2;
        char[] copyFrom = { 'd', 'e', 'c', 'a', 'f', 'f', 'e',
			    'i', 'n', 'a', 't', 'e', 'd' };
        char[] copyTo = new char[copyFrom.length - prefixLength];
        
        System.arraycopy(copyFrom, prefixLength, copyTo, 0, copyTo.length - 4);
        System.out.println(new String(copyTo));
    }
    
    private static void demoArrayCopy2() {
        char[] copyFrom = { 'd', 'e', 'c', 'a', 'f', 'f', 'e',
			    'i', 'n', 'a', 't', 'e', 'd' };
        char[] copyTo = java.util.Arrays.copyOfRange(copyFrom, 2, 9);
        System.out.println(new String(copyTo));
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        demoArray();
        demoLoop();
        demo2DimArray();
        demoArrayCopy();
        demoArrayCopy2();
    }
}
