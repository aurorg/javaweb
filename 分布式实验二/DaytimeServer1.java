/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter5;

import java.io.*;
import java.util.Date;

/**
 *
 * @author qzhang
 */
public class DaytimeServer1 {
    public static void main(String[]args){
        int serverPort = 8000;
        if(args.length==1)
            serverPort = Integer.parseInt(args[0]);
        try{
            MyServerDatagramSocket mySocket = 
                    new MyServerDatagramSocket(serverPort);
            System.out.println("Daytime server ready.");
            while(true){
                DatagramMessage request = 
                        mySocket.receiveMessageAndSender();
                System.out.println("Request Received");
                
                Date timestamp = new Date();
                System.out.println("timestamp sent:" +
                        timestamp.toString());
                mySocket.sendMessage(request.getAddress(),
                        request.getPort(),timestamp.toString());
            }//end while
        }//end try
        catch(Exception ex){
            ex.printStackTrace();
        }//end catch
    }//end main
}//end class
