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
public class DaytimeClientHelper2 {
    public static String getTimestamp(String hostName,String portNum)
        throws Exception{
            String timestamp = "";
        
            int serverPort = Integer.parseInt(portNum);
        
            System.out.println("Connection request made");
            MyStreamSocket mySocket = new MyStreamSocket(
                    hostName, serverPort);
            timestamp = mySocket.receiveMessage();
            mySocket.close();
            return timestamp;
    }//end
}//end class
