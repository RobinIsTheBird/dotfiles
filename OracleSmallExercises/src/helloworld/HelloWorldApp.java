/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helloworld;

/**
 * The HelloWorldApp class implements an application that
 * simply prints "Hello World!" to standard output.
 *
 * @author robinschaufler
 */
public class HelloWorldApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String greeting = "Hola Mundo!";
        if (1 == args.length) {
            greeting = args[0];
        }
        System.out.println(greeting); // Display the string.
    }
    
}
