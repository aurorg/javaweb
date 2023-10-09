/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter5;

import java.net.*;
/**
 *
 * @author qzhang
 */
public class DaytimeClientHelper1 {
    public static String getTimestamp(String hostName,String portNum){
        
        String timestamp = "";
        try{
            InetAddress serverHost = InetAddress.getByName(hostName);
            int serverPort = Integer.parseInt(portNum);
            
            MyClientDatagramSocket mySocket  = new MyClientDatagramSocket();
            mySocket.sendMessage(serverHost,serverPort,"");
            timestamp = mySocket.receiveMessage();
            mySocket.close();
        }//end try
        catch(Exception ex){
            ex.printStackTrace();
        }//end catch
        return timestamp;
    }//end main
}//end class
