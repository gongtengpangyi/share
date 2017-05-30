package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.client.servlet.PhoneServlet;
import cn.hdu.wlw.console.biz.ArticleBiz;
import cn.hdu.wlw.console.biz.ArticleTagBiz;
import cn.hdu.wlw.console.biz.TagBiz;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.console.biz.UserCareBiz;
import cn.hdu.wlw.console.biz.UserTagBiz;
import cn.hdu.wlw.console.util.ModelUtil;
import cn.hdu.wlw.model.Tag;
import cn.hdu.wlw.model.User;
import cn.hdu.wlw.model.UserCare;
import cn.hdu.wlw.model.UserTag;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class UserController extends BaseController implements IController {
	private UserBiz userBiz;
	private UserCareBiz userCareBiz;
	private ArticleBiz articleBiz;
	private ArticleTagBiz articleTagBiz;
	private UserTagBiz userTagBiz;
	private TagBiz tagBiz;
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setUserCareBiz(UserCareBiz userCareBiz) {
		this.userCareBiz = userCareBiz;
	}

	public void setArticleBiz(ArticleBiz articleBiz) {
		this.articleBiz = articleBiz;
	}

	public void setArticleTagBiz(ArticleTagBiz articleTagBiz) {
		this.articleTagBiz = articleTagBiz;
	}

	public void setUserTagBiz(UserTagBiz userTagBiz) {
		this.userTagBiz = userTagBiz;
	}

	public void setTagBiz(TagBiz tagBiz) {
		this.tagBiz = tagBiz;
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		logger.info("this is in the userController");
	}

	/**
	 * 登录操作
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("this is in the login");
		System.out.println(request.getParameter("account"));
		User user = userBiz.findByAccount(request.getParameter("account"));
		if(user==null) {
			jobj.put("result", "error");
			jobj.put("msg", "no user");
		} else if(!user.getPassword().equals(request.getParameter("password"))) {
			jobj.put("result", "error");
			jobj.put("msg", "wrong password");
		} else {
			jobj.put("result", "success");
			jobj.put("user", JSONObject.fromObject(user));	
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 注册操作
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("this is in the register");
		User user = userBiz.findByAccount(request.getParameter("account"));
		if(user!=null) {
			jobj.put("result", "error");
			jobj.put("msg", "user already exist");
		} else {
			user = new User();
			user.setAccount(request.getParameter("account"));
			user.setName(request.getParameter("name"));
			user.setPassword(request.getParameter("password"));
			user.setImageIcon(request.getParameter("icon"));
//			System.out.println(Base64Util.encode(FileUtil.read("/upload/image/test.jpg")));
			System.out.println(request.getParameter("icon"));
//			user.setImageIcon(Base64Util.encode(FileUtil.read("/upload/image/test.jpg")));
			user.setCreateTime(new Date());
			userBiz.save(user);
			jobj.put("result", "success");
			jobj.put("msg", "please login");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 用户信息
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void getUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			jobj = JSONObject.fromObject(user);
			jobj.remove("password");
			jobj.put("follow", userCareBiz.countCare(user.getId()));
			jobj.put("followed", userCareBiz.countBeCared(user.getId()));
			jobj.put("articleList", getArticleListByUserAndPage(articleBiz, articleTagBiz, user.getId(), 1));
			List<UserTag> userTagList = userTagBiz.findByUserId(user.getId());
			JSONArray tagArray = new JSONArray();
			for (UserTag userTag : userTagList) {
				JSONObject tagObj = JSONObject.fromObject(userTag.getTag());
				tagObj.remove("createTime");
				tagArray.add(tagObj);
			}
			jobj.put("tag_list", tagArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
	
	/**
	 * 用户文章扩展
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void getUserArticleList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			jobj.put("articleList", getArticleListByUserAndPage(
					articleBiz, articleTagBiz,
					Long.valueOf(request.getParameter("userId")), 
					Integer.valueOf(request.getParameter("pageIndex"))
					));
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
 
	/**
	 * 获取用户关注列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void getUserCareList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			List<UserCare> userCareList = userCareBiz.getCareList(Long.valueOf(request.getParameter("userId")));
			JSONArray userArray = new JSONArray();
			for(UserCare userCare : userCareList) {
				JSONObject obj = new JSONObject();
				User user = userCare.getUser();
				obj.put("id", user.getId());
				obj.put("account", user.getAccount());
				obj.put("name", user.getName());
				obj.put("iconImage", user.getIconImage());
				userArray.add(obj);
			}
			jobj.put("care_user_list", userArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
	
	/**
	 * 获取用户关注列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void getUserBeCaredList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			List<UserCare> userCareList = userCareBiz.getBeCaredList(Long.valueOf(request.getParameter("userId")));
			JSONArray userArray = new JSONArray();
			for(UserCare userCare : userCareList) {
				JSONObject obj = new JSONObject();
				User user = userCare.getToUser();
				obj.put("id", user.getId());
				obj.put("account", user.getAccount());
				obj.put("name", user.getName());
				obj.put("iconImage", user.getIconImage());
				userArray.add(obj);
			}
			jobj.put("beCared_user_list", userArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
	
	/**
	 * 修改个人信息
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void changeUserInfo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Long userId = Long.valueOf(request.getParameter("userId"));
			if (PhoneServlet.USER_ID != userId) {
				throw new Exception("can't change other's info");
			}
			User user = userBiz.findById(userId);
			Map<String, String[]> params = request.getParameterMap();
			for(String key : params.keySet()) {
				String[] values = params.get(key);
				String value = values[values.length-1];
				if ("password name ".indexOf(key) != -1) {
					ModelUtil.setValue(user, key, value);
				} else if(key.equals("icon")) {
					user.setImageIcon(value);
				} else {
					continue;
				}
			}
			userBiz.update(user);
			// 保存新增加的标签
			if (request.getParameter("addTagNames")!=null) {
				String[] tagNames = request.getParameter("addTagNames").split(",");
				for (String tagName : tagNames) {
					Tag tag = tagBiz.findByName(tagName);
					
					if (tag==null || userTagBiz.findByUserIdAndTagId(user.getId(), tag.getId())!=null) {
						continue;
					}
					UserTag userTag = new UserTag();
					userTag.setCreateTime(new Date());
					userTag.setUser(user);
					userTag.setTag(tag);
					userTagBiz.save(userTag);
				}
			}
			// 删除需要取消的标签
			if (request.getParameter("delTagNames")!=null) {
				String[] tagNames = request.getParameter("delTagNames").split(",");
				for (String tagName : tagNames) {
					Tag tag = tagBiz.findByName(tagName);
					UserTag userTag;					
					if (tag==null || (userTag = userTagBiz.findByUserIdAndTagId(user.getId(), tag.getId()))==null) {
						continue;
					}
					userTagBiz.delete(userTag);
				}
			}
			jobj.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	
	
}
