package cn.hdu.wlw.client.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class Server extends Thread {
	public static final String TOKEN_MAP = "accessTocken_map";
	public static final String SOCKET_MAP = "socket_map";
	public static final String CLIENT_THREAD_LIST = "client_thread_list";
	public static final String ENCODE_TYPE = "utf-8";
	public static final int SOCKET_PORT = 5000;

	private Logger logger = Logger.getLogger(this.getClass());
	private ServerSocket serverSocket;
	private ClientThread clientThread;
	private Socket clientSocket;
	private List<ClientThread> clinetServerList;
	private ServletContext servletContext;

	public Server(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		super.run();
		clinetServerList = new ArrayList<ClientThread>();
		servletContext.setAttribute(CLIENT_THREAD_LIST, clinetServerList);
		try {
			serverSocket = new ServerSocket(SOCKET_PORT);
			while (true) {
				clientSocket = serverSocket.accept();
				clientSocket.setKeepAlive(true);
				clientThread = new ClientThread(clientSocket, servletContext);
				clinetServerList = (List<ClientThread>) servletContext.getAttribute(CLIENT_THREAD_LIST);
				clinetServerList.add(clientThread);
				servletContext.setAttribute(CLIENT_THREAD_LIST, clinetServerList);
				clientThread.start();
			}
		} catch (IOException e) {
			logger.error("failed to accept socket", e);
		}
	}

	@SuppressWarnings("unchecked")
	public void close() {
		clinetServerList = (List<ClientThread>) servletContext.getAttribute(CLIENT_THREAD_LIST);
		for (ClientThread cs : clinetServerList) {
			cs.close();
		}
		try {
			serverSocket.close();
		} catch (IOException e) {
			logger.error("serversocket cannot close in common ", e);
		}

	}
	
	/**
	 * 在HTTP请求处理逻辑中需要找一个线程去处理长连接的回执内容
	 * @param req HTTP请求的request
	 * @return 处理长连接的任意可用线程
	 * @throws Exception 
	 */
	public static ClientThread getAnyThread(HttpServletRequest req) throws Exception {
		@SuppressWarnings("unchecked")
		List<ClientThread> threadList = (List<ClientThread>) req.getServletContext().getAttribute(CLIENT_THREAD_LIST);
		for(ClientThread clientThread : threadList) {
			if(clientThread.isRun()) {
				return clientThread;
			}
		}
		throw new Exception("no clientThread already");
	}

}
