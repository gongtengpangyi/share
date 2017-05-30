package cn.hdu.wlw.client.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import cn.hdu.wlw.console.common.Constants;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class PhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(this.getClass());
	public static Long USER_ID;
    private String userId;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhoneServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Constants.WEBCONTENT_PATH = this.getServletContext().getRealPath("");
		RequestSubUtil reqUtil = new RequestSubUtil(request, response, "phone", "cn.hdu.wlw.client.controller.phone");
		logger.info(reqUtil.getController()+"."+reqUtil.getAction());
		// 获取当前用户ID
		if((userId = request.getParameter("userId"))!=null) {
			USER_ID = Long.valueOf(userId);
		} else {
			USER_ID = null;
		}
		reqUtil.doAction();
	}

}
