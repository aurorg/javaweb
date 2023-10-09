package chapter5;

import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.AsynchronousSocketChannel;
import java.util.concurrent.Future;
 
public class AsynNoblockServer {
	public static void main(String[] args) {
		try {
			AsynNoblockServer server = new AsynNoblockServer();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
	public AsynNoblockServer() throws Exception {
		AsynchronousServerSocketChannel serverSocketChannel = AsynchronousServerSocketChannel.open();
		InetSocketAddress inetSocketAddress = new InetSocketAddress("localhost", 8000);
		serverSocketChannel.bind(inetSocketAddress);
 
		Future<AsynchronousSocketChannel> accept;
 
		while (true) {
			// accept()不会阻塞。
			accept = serverSocketChannel.accept();
 
			System.out.println("=================");
			System.out.println("服务器等待连接...");
			AsynchronousSocketChannel socketChannel = accept.get();// get()方法将阻塞。
 
			System.out.println("服务器接受连接");
			System.out.println("服务器与" + socketChannel.getRemoteAddress() + "建立连接");
 
			ByteBuffer buffer = ByteBuffer.wrap("老师在实验室值班办公室".getBytes());
			Future<Integer> write=socketChannel.write(buffer);
			
			while(!write.isDone()) {
				Thread.sleep(10);
			}
			
			System.out.println("服务器发送数据完毕.");
			socketChannel.close();
		}
	}
}