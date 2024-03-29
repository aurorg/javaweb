/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter5;

import java.io.*;
import java.net.*;
/**
 *
 * @author qzhang
 */
public class EchoServer2 {
    static final String endMessage = ".";
    
    public static void main(String[]args){
        int serverPort = 8000;
        String message;
        
        if(args.length == 1)
            serverPort = Integer.parseInt(args[0]);
        try{
            ServerSocket  myConnectionSocket = 
                    new ServerSocket(serverPort);
            System.out.println("Echo Server  ready.");
            
            while(true){
                System.out.println("Waiting for a connection.");
                MyStreamSocket myDataSocket = new MyStreamSocket
                        (myConnectionSocket.accept());
                System.out.println("connection accepted");
                
                boolean done = false;
                while(!done){
                    message = myDataSocket.receiveMessage();
                    System.out.println("message received: " + message);
                    if(message.trim().equals(endMessage)){
                        System.out.println("Session over.");
                        myDataSocket.close();
                        done = true;
                    }//end if
                    else{
                        myDataSocket.sendMessage(message);
//                        myDataSocket.close();
//                        done = true;
                    }//end else
                }//end while !done
                
            }//end while forever
        }//end try
        catch(Exception ex){
            ex.printStackTrace();
        }//end catch
    }//end main
}//end class
