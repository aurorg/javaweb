package chapter5;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
import java.util.Stack;

public class EchoServer4 {
    static Stack<EchoServerThread2> ts;
    public static void main(String[] args) {

        int serverPort = 8000;
        int threadobjectnumber = 20;
        ts = new Stack<EchoServerThread2>();
        try {
            InputStreamReader is = new InputStreamReader(System.in);
            BufferedReader br = new BufferedReader(is);
            System.out.println("Welcome to the Echo server4. \n" +
                    "Please input thread objects number");
            String tonumber = br.readLine();

            if (tonumber.length() != 0)
                threadobjectnumber = Integer.parseInt(tonumber);
        } catch (Exception e) {
            // TODO: handle exception 请同学完善代码1
        }

        for (int i = 0; i < threadobjectnumber; i++) {
            ts.push(new EchoServerThread2());
            System.out.println("创建线程对象 " + i);
        }

        try {
            ServerSocket myConnectionSocket = new ServerSocket(serverPort);
            System.out.println("Echo Server  ready.");

            while (true) {
                System.out.println("Waiting for a connection.");
                MyStreamSocket myDataSocket = new MyStreamSocket(myConnectionSocket.accept());
                System.out.println("connection accepted");
                if (ts.size() > 0) {
                    EchoServerThread2 est = ts.pop();
                    est.getSocket(myDataSocket);
                    Thread theThread = new Thread(est);
                    theThread.start();
                    System.out.println("当前线程栈中的线程数量：" + ts.size());
                }else{//请同学完善代码2，EchoServer4提前批量创建的线程对象使用完毕，后续的请求在此处处理
                    System.out.println("已经没有更多的线程对象，请同学完善代码，实时提供新线程对象");
                }
            } // end while forever
        } // end try
        catch (Exception ex) {
            ex.printStackTrace();
        } // end catch
    }// end main

    static void toRecycle(EchoServerThread2 esto){
        ts.push(esto);
    }
}
