/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helloworldapp;

/**
 *
 * @author robinschaufler
 */
public class HelloWorldApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String greeting = "Hello World!";
        if (1 == args.length) {
            greeting = args[0];
        }
        System.out.println(greeting); // Display the string.
    }
    
}
