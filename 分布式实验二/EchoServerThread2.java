package chapter5;

public class EchoServerThread2 implements Runnable {
    static final String endMessage = ".";
    MyStreamSocket myDataSocket;
    boolean available = false;

    EchoServerThread2() {
        ;
    }// end constructor

    public void run() {
        boolean done = false;
        String message;
        try {
            while (!done) {
                message = myDataSocket.receiveMessage();
                System.out.println("message received: " + message);
                if (message.trim().equals(endMessage)) {
                    System.out.println("Session over.");
                    myDataSocket.close();
                    done = true;
                    await();
                } // end if
                else {
                    myDataSocket.sendMessage(message);
                } // end else
            } // end while !done
        } // end try
        catch (Exception ex) {
            System.out.println("Exception caught in thread: " + ex);
        } // end catch

    }// end run

    private void await(){
            try {
                System.out.println("线程对象执行压栈操作。");
                EchoServer4.toRecycle(this);
                System.out.println("线程对象栈中的线程数量：" + EchoServer4.ts.size());
            } catch (Exception e) {
                // TODO: handle exception 请同学完善代码
            }
        
    }
    public void getSocket(MyStreamSocket myDataSocket){
        this.myDataSocket = myDataSocket;
    }
}
