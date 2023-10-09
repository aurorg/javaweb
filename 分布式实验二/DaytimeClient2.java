/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter5;

import java.io.*;

/**
 *
 * @author qzhang
 */
public class DaytimeClient2 {
    public static void main(String[]args){
        InputStreamReader is = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(is);
        
        try{
            System.out.println("Welcome to the Daytime client.\n" +
                    "What is the name of the server host?");
            String hostName = br.readLine();
            if(hostName.length()==0)
                hostName = "localhost";
            System.out.println("What is the port number of the server host?");
            String portNum = br.readLine();
            if(portNum.length()==0)
                portNum = "8000";
            System.out.println("Here is the timestamp received from the server \n"
                    +DaytimeClientHelper2.getTimestamp(hostName,portNum));
        }//end try
        catch(Exception ex){
            ex.printStackTrace();
        }//end catch
    }//end main
    
}//end class