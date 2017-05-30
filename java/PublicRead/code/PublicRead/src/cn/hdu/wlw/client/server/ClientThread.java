package cn.hdu.wlw.client.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import org.apache.log4j.Logger;

import cn.hdu.wlw.client.server.pack.PackUtil;
import cn.hdu.wlw.client.server.pack.RecvPack;
import cn.hdu.wlw.client.server.pack.SendPack;
import cn.hdu.wlw.client.server.pack.send.HertSendPack;
import cn.hdu.wlw.console.util.ToolSpring;
import cn.hdu.wlw.model.Pack;

public class ClientThread extends Thread {
	private Logger logger = Logger.getLogger(this.getClass());
	private Socket clientSocket = null;
	private BufferedReader br = null;
	private String line = null;
	private RecvPack pack;
	private OutputStream os;
	private PackUtil packUtil;
	private ServletContext servletContext;
	private Map<Long, Socket> socketMap;
	private List<ClientThread> chatServerList;
	private boolean flag = true;
	/**
	 * 初始化
	 * @param clientSocket 当前线程
	 * @param servletContext 容器
	 */
	public ClientThread(Socket clientSocket, ServletContext servletContext) {
		this.clientSocket = clientSocket;
		this.servletContext = servletContext;
		packUtil = (PackUtil) ToolSpring.getBean("packUtil");
		try {
			br = new BufferedReader(new InputStreamReader(this.clientSocket.getInputStream(), Server.ENCODE_TYPE));
		} catch (IOException e) {
			logger.error("Socket读取输入流出错", e);
		}
	}
		
	public PackUtil getPackUtil() {
		return packUtil;
	}

	public boolean isRun() {
		return flag;
	}

	/**
	 * 运行接收消息
	 */
	@Override
	public void run() {
		super.run();
		try {
			while (flag && (line = br.readLine()) != null) {
				logger.info("received data : " + line);
				pack = (RecvPack) BasePack.newInstance(line);
				pack.parse(this);
			}
		} catch (Exception e) {
			logger.error("Socket读取上传消息出错", e);
		}
	}
	
	/**
	 * 实现发送消息
	 * @param userId 接收者id
	 * @param data 字符串
	 */
	@SuppressWarnings("unchecked")
	private void doSendData(Long userId, String data) {
		try {
			socketMap = (Map<Long, Socket>) servletContext.getAttribute(Server.SOCKET_MAP);
			Socket socket = socketMap.get(userId);
			if(socket == null) {
				return;
			}
			os = socket.getOutputStream();
			System.out.println("doing send : " + data);
			os.write(data.getBytes(Server.ENCODE_TYPE));
			logger.info("send data : " + data);
		} catch (Exception e) {
			logger.error("发送信息出错");
		}
	}
	
	/**
	 * 发送消息
	 * @param userId 接收者id
	 * @param data 字符串
	 */
	public void sendData(Long userId, String data) {
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				doSendData(userId, data);
			}
			
		}).start();
	}

	/**
	 * 发送消息的具体实现
	 * @param userId 接收者id
	 * @param pack 发送内容
	 */
	private void doSendPack(Long userId, SendPack pack) {
		String sendString = pack.sendString();
		if(!(pack instanceof HertSendPack)) {
			// 存储发送记录
			Long packId = packUtil.memorySend(pack, userId);
			sendString = "packId:" + packId + ";" + sendString;			
		}
		// 发送
		this.doSendData(userId, sendString);
	}
	
	/**
	 * 发送消息
	 * @param userId 接收者id
	 * @param pack 发送内容
	 */
	public void sendPack(Long userId, SendPack pack) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				doSendPack(userId, pack);		
			}
			
		}).start();
	}
	
	/**
	 * 发送消息
	 * @param userId 接收者id
	 * @param packs 发送内容列表
	 */
	public void sendPacks(Long userId, List<SendPack> packs) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				for(SendPack pack : packs) {
					doSendPack(userId, pack);
				}
				
			}
			
		}).start();
	}
	
	/**
	 * 发送历史遗留消息
	 * @param userId 接收者id
	 * @param pack 发送内容
	 */
	public void sendHisPack(Long userId, Pack pack) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				doSendData(userId, pack.getContent());
			}
			
		}).start();
	}
	
	/**
	 * 发送历史遗留消息
	 * @param userId 接收者id
	 * @param packs 发送内容列表
	 */
	public void sendHisPacks(Long userId, List<Pack> packs) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				for(Pack pack : packs) {
					doSendData(userId, pack.getContent());
				}
				
			}
			
		}).start();
	}
	
	/**
	 * 储存在socketMap中
	 * @param userId 用户ID
	 */
	@SuppressWarnings("unchecked")
	public void saveInMap(Long userId) {
		socketMap = (Map<Long, Socket>) servletContext.getAttribute(Server.SOCKET_MAP);
		socketMap.put(userId, clientSocket);
		servletContext.setAttribute(Server.SOCKET_MAP, socketMap);
		logger.info(userId + " connect to the serverSocket");
	}
	
	/**
	 * 根据token来获取userId
	 * @param token 
	 * @return userId
	 */
	@SuppressWarnings("unchecked")
	public Long getUserId(String token) {
		Map<String, Long> tokenMap = (Map<String, Long>) servletContext.getAttribute(Server.TOKEN_MAP);
		return tokenMap.get(token);
	}

	/**
	 * 关闭线程
	 */
	@SuppressWarnings({ "unchecked" })
	public void close() {
		try {
			flag = false;
			clientSocket.close();
			chatServerList = (List<ClientThread>) servletContext.getAttribute(Server.CLIENT_THREAD_LIST);
			socketMap = (Map<Long, Socket>) servletContext.getAttribute(Server.SOCKET_MAP);
			chatServerList.remove(this);
			servletContext.setAttribute(Server.SOCKET_MAP, socketMap);
			servletContext.setAttribute(Server.CLIENT_THREAD_LIST, chatServerList);
		} catch (IOException e) {
			logger.error("Socket关闭连接出错", e);
		}
	}

}
