package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.client.server.Server;
import cn.hdu.wlw.client.server.pack.SendPack;
import cn.hdu.wlw.client.server.pack.send.ArticleBeFoundSendPack;
import cn.hdu.wlw.console.biz.ArticleTagBiz;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.console.biz.UserFindBiz;
import cn.hdu.wlw.model.Article;
import cn.hdu.wlw.model.ArticleTag;
import cn.hdu.wlw.model.Tag;
import cn.hdu.wlw.model.User;
import cn.hdu.wlw.model.UserFind;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FindController extends BaseController implements IController {
	private ArticleTagBiz articleTagBiz;
	private UserFindBiz userFindBiz;
	private UserBiz userBiz;
	public void setArticleTagBiz(ArticleTagBiz articleTagBiz) {
		this.articleTagBiz = articleTagBiz;
	}

	public void setUserFindBiz(UserFindBiz userFindBiz) {
		this.userFindBiz = userFindBiz;
	}

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		logger.info("this is in the findController");
	}
	
	/**
	 * 关键字查找 
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void findArticle(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			String articleType = request.getParameter("type");
			String findStr = request.getParameter("key");
			Long userId = Long.valueOf(request.getParameter("userId"));
			List<ArticleTag> articleTagList = articleTagBiz.findByMatchTagName(findStr, 1, Integer.valueOf(articleType));
			JSONArray articleArray = new JSONArray();
			Date now = new Date();
			User user = userBiz.findById(userId);
			for(ArticleTag articleTag : articleTagList) {
				Article article = articleTag.getArticle();
				// 获取返回数据
				JSONObject obj = new JSONObject();
				obj.put("title", article.getTitle());
				obj.put("createTime", article.getCreateTime());
				obj.put("writer", article.getUser().getName());
				obj.put("writer_id", article.getUser().getId());
				obj.put("id", article.getId());
				obj.put("tag", articleTag.getTag().getName());
				articleArray.add(obj);
				// 储存查找记录
				UserFind userFind = new UserFind();
				userFind.setUser(user);
				userFind.setKey(findStr);
				userFind.setFindTime(now);
				userFind.setArticle(article);
				userFindBiz.save(userFind);
				// 发送消息记录
				if (article.getType()==1 && isSend(articleTag.getTag(), findStr.split(""))) {
					sendBeFindDataToUser(article, request, user);					
				}
			}
			jobj.put("article_list", articleArray);
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 判断是否要发送消息
	 * @param tag 标签
	 * @param keys 关键字集合
	 * @return 是否
	 */
	private boolean isSend(Tag tag, String[] keys) {
		int count = 0;
		String tagName = tag.getName();
		for (String key : keys) {
			if (tagName.indexOf(key) >= 0) {
				count++;
			}
		}
		return count >= tagName.length()/2;
	}

	/**
	 * 发送被搜索消息给卖家
	 * @param article 文章
	 * @param req 请求体
	 * @param user 查询的用户
	 */
	private void sendBeFindDataToUser(Article article, HttpServletRequest req, User user) {
		ArticleBeFoundSendPack pack = (ArticleBeFoundSendPack) SendPack.newInstance("articleBeFound");
		pack.setUser(user);
		try {
			Server.getAnyThread(req).sendPack(article.getUser().getId(), pack);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
}
