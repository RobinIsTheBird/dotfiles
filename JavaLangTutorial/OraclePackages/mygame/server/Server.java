package mygame.server;

import java.io.*;
import java.net.*;

import mygame.client.Client;
import mygame.shared.Utilities;

/*
 * Compile from directory above mygame using
 * > javac mygame/server/Server.java mygame/client/Client.java mygame/shared/Utilities.java
 * Run from same directory
 * > java mygame.server.Server
 *
 * To use it...
 * From another terminal window,
 * > telnet localhost 4777
 *
 * telnet prints the date and the server prints a bunch of log messages.
 */

public class Server {

    public static void main(String args[]) {
        ServerSocket serverSocket = null;

        Utilities.printMsg("creating server socket");
        
        try {
            serverSocket = new ServerSocket(4777);
        } catch (IOException e) {
            System.err.println("Unable to create server socket, " + e);
            System.exit(1);
        }

        Utilities.printMsg("accepting client connections");

        while (true) {
            Utilities.printMsg("entering loop");
            try {
                Utilities.printMsg("before call to accept()");
                Socket clientSocket = serverSocket.accept();
                Utilities.printMsg("before starting the client");
                new Client(clientSocket).start();
                Utilities.printMsg("after starting the client");
            } catch (IOException e) {
                System.err.println("Unable to accept socket connection, " + e); 
                System.exit(1);
            }
        }
    }
}
