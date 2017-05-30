package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.console.biz.UserBlackBiz;
import cn.hdu.wlw.console.biz.UserCareBiz;
import cn.hdu.wlw.model.User;
import cn.hdu.wlw.model.UserBlack;
import cn.hdu.wlw.model.UserCare;


public class RelationController extends BaseController implements IController {
	private UserBiz userBiz;
	private UserBlackBiz userBlackBiz;
	private UserCareBiz userCareBiz;
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	public void setUserBlackBiz(UserBlackBiz userBlackBiz) {
		this.userBlackBiz = userBlackBiz;
	}
	
	public void setUserCareBiz(UserCareBiz userCareBiz) {
		this.userCareBiz = userCareBiz;
	}
	
	@Override
	public void beforeAction() {
		super.beforeAction();
		logger.info("this is in the relationController");
	}
	
	/**
	 * 关注
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void care(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			User toUser = userBiz.findById(Long.valueOf(request.getParameter("toUserId")));
			UserBlack userBlack;
			if(userCareBiz.isCare(user.getId(), toUser.getId())!=null){				
				throw new Exception("the user is already be Cared");
			} else if((userBlack = userBlackBiz.isBlack(user.getId(), toUser.getId()))!=null){	
				userBlackBiz.delete(userBlack);
				jobj.put("result", "success");
			}
			UserCare userCare = new UserCare();
			userCare.setUser(user);
			userCare.setToUser(toUser);
			userCareBiz.save(userCare);
			jobj.put("result", "success");
		} catch(Exception e) {
			jobj.put("result", "error");
			e.printStackTrace();
		}
		response.getWriter().print(jobj.toString());
	}

	/**
	 * 拉黑
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void black(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			User toUser = userBiz.findById(Long.valueOf(request.getParameter("toUserId")));
			UserCare userCare;
			if(userBlackBiz.isBlack(user.getId(), toUser.getId())!=null){				
				throw new Exception("the user is already in blackList");
			} else if((userCare = userCareBiz.isCare(user.getId(), toUser.getId()))!=null){	
				userCareBiz.delete(userCare);
				jobj.put("result", "success");
			}
			UserBlack userBlack = new UserBlack();
			userBlack.setUser(user);
			userBlack.setToUser(toUser);
			userBlackBiz.save(userBlack);
			jobj.put("result", "success");
		} catch(Exception e) {
			jobj.put("result", "error");
			e.printStackTrace();
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 取消拉黑
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void delBlack(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			User toUser = userBiz.findById(Long.valueOf(request.getParameter("toUserId")));
			UserBlack userBlack;
			if((userBlack = userBlackBiz.isBlack(user.getId(), toUser.getId()))!=null){	
				userBlackBiz.delete(userBlack);
				jobj.put("result", "success");
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			jobj.put("result", "error");
			e.printStackTrace();
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 取消关注
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void delCare(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			User toUser = userBiz.findById(Long.valueOf(request.getParameter("toUserId")));
			UserCare userCare;
			if((userCare = userCareBiz.isCare(user.getId(), toUser.getId()))!=null){	
				userCareBiz.delete(userCare);
				jobj.put("result", "success");
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			jobj.put("result", "error");
			e.printStackTrace();
		}
		response.getWriter().print(jobj.toString());
	}
	
}
