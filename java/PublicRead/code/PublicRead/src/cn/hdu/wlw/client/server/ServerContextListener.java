package cn.hdu.wlw.client.server;

import javax.servlet.ServletContext;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

public class ServerContextListener implements ServletContextListener {
	private Logger logger = Logger.getLogger(this.getClass());
	private Server server;
	private ServletContext servletContext;
	private Map<Long, Socket> socketMap;
	private Map<String, Long> accessTokenMap;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		server.close();
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		logger.info("the server is starting******服务器启动");
		servletContext = arg0.getServletContext();
		socketMap = new HashMap<Long, Socket>();
		accessTokenMap = new HashMap<String, Long>();
		// 测试用
		accessTokenMap.put("testToken", new Long(1));
		servletContext.setAttribute(Server.SOCKET_MAP, socketMap);
		servletContext.setAttribute(Server.TOKEN_MAP, accessTokenMap);
		server = new Server(servletContext);
		server.start();
	}

}
