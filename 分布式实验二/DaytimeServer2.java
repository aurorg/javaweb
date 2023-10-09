/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter5;

import java.io.*;
import java.net.*;
import java.util.Date;

/**
 *
 * @author qzhang
 */
public class DaytimeServer2 {
    public static void main(String[]args){
        int serverPort = 8000;
        if(args.length==1)
            serverPort = Integer.parseInt(args[0]);
        try{
            ServerSocket myConnectionSocket =
                    new ServerSocket(serverPort);
            System.out.println("Daytime server ready.");
            while(true){
                 System.out.println("Waiting for a connection");
                 MyStreamSocket myDataSocket = new MyStreamSocket
                        (myConnectionSocket.accept());
                 System.out.println("A client has made connection.");
                 
                 Thread.sleep(30000);
                 
                 Date timestamp = new Date();
                 System.out.println("timestamp send: " + timestamp.toString());
                 myDataSocket.sendMessage(timestamp.toString());
                 myDataSocket.close();
              
            }//end while
        }//end try
        catch(Exception ex){
            ex.printStackTrace();
        }
    }//end main
}//end class
