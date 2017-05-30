package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.console.biz.FlockBiz;
import cn.hdu.wlw.console.biz.FlockUserBiz;
import cn.hdu.wlw.console.biz.TagBiz;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.console.biz.UserTagBiz;
import cn.hdu.wlw.model.Flock;
import cn.hdu.wlw.model.FlockUser;
import cn.hdu.wlw.model.Tag;
import cn.hdu.wlw.model.User;
import cn.hdu.wlw.model.UserTag;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TalkController extends BaseController implements IController {
	private TagBiz tagBiz;
	private UserTagBiz userTagBiz;
	private UserBiz userBiz;
	private FlockBiz flockBiz;
	private FlockUserBiz flockUserBiz;

	public void setTagBiz(TagBiz tagBiz) {
		this.tagBiz = tagBiz;
	}

	public void setUserTagBiz(UserTagBiz userTagBiz) {
		this.userTagBiz = userTagBiz;
	}
	
	public void setFlockBiz(FlockBiz flockBiz) {
		this.flockBiz = flockBiz;
	}

	public void setFlockUserBiz(FlockUserBiz flockUserBiz) {
		this.flockUserBiz = flockUserBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		System.out.println("this is in the talkController");
	}

	/**
	 * 根据标签名字来获取用户
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void getUserByTag(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String tagName = request.getParameter("tagName");
			Tag tag = tagBiz.findByName(tagName);
			if (tag == null) {
				jobj.put("mag", "tag is not exist");
				throw new Exception("tag_" + tagName + " is not exist");
			} else {
				List<UserTag> userTagList = userTagBiz.findByTagId(tag.getId());
				if (userTagList == null) {
					jobj.put("mag", "tag is no user");
					throw new Exception("tag_" + tagName + " is no user");
				} else {
					JSONArray userArray = new JSONArray();
					for (UserTag userTag : userTagList) {
						userArray.add(JSONObject.fromObject(userTag.getUser()));
					}
					jobj.put("result", "success");
					jobj.put("user_list", userArray);
				}
			}
		} catch (Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 创建群聊
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void addFlock(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String tagName = request.getParameter("tagName");
			Tag tag = tagBiz.findByName(tagName);
			if (tag == null) {
				jobj.put("mag", "tag is not exist");
				throw new Exception("tag_" + tagName + " is not exist");
			} else {
				Flock flock = new Flock();
				flock.setCreateTime(new Date());
				flock.setName(request.getParameter("flockName"));
				flock.setTag(tag);
				User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
				if (user==null) {
					jobj.put("mag", "user is not exist");
					throw new Exception("user_" + request.getParameter("userId") + " is not exist");
				} else {
					flockBiz.save(flock);
					FlockUser flockUser = new FlockUser();
					flockUser.setFlock(flock);
					flockUser.setCreateTime(new Date());
					flockUser.setUser(user);
					flockUser.setNickName(user.getName());
					flockUser.setType(0);
					flockUserBiz.save(flockUser);
					String[] flockUserIdList = request.getParameter("flock_user_list").split(",");
					for(String userId : flockUserIdList) {
						user = userBiz.findById(Long.valueOf(userId));
						if(flockUserBiz.findByUserAndFlock(user.getId(), flock.getId())!=null) {
							continue;
						}
						flockUser = new FlockUser();
						flockUser.setFlock(flock);
						flockUser.setCreateTime(new Date());
						flockUser.setUser(user);
						flockUser.setNickName(user.getName());
						flockUser.setType(1);
						flockUserBiz.save(flockUser);
					}
					jobj.put("result", "success" );
				}
			}
		} catch (Exception e) {
			jobj.put("result", "error" );
		}
		response.getWriter().print(jobj.toString());
	}

	/**
	 * 获取所有群聊
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void flockList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String pageIndexStr = request.getParameter("pageIndex");
			if (pageIndexStr==null || pageIndexStr.equals("")) {
				pageIndexStr = "1";
			}
			List<FlockUser> flockUserList = flockUserBiz.findByUserId(
					Long.valueOf(request.getParameter("userId")), Integer.valueOf(pageIndexStr));
			JSONArray flockArray = new JSONArray();
			for(FlockUser flockUser : flockUserList) {
				flockArray.add(JSONObject.fromObject(flockUser.getFlock()));
			}
			jobj.put("flock_list", flockArray);
		} catch (Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 群聊用户列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void flockUserList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			List<FlockUser> flockUserList = flockUserBiz.findByFlockId(Long.valueOf(request.getParameter("flockId")));
			JSONArray userArray = new JSONArray();
			for(FlockUser flockUser : flockUserList) {
				JSONObject userObj = JSONObject.fromObject(flockUser.getUser());
				userObj.put("type", flockUser.getType());
				userObj.put("flockNickName", flockUser.getNickName());
				userArray.add(userObj);
			}
			jobj.put("flock_user_list", userArray);
		} catch (Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 增加群聊用户
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void addFlockUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			
		} catch (Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 改变群聊用户信息
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void changeFlockUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			
		} catch (Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
}
