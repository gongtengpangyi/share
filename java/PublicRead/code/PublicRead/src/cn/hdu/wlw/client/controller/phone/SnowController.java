package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.console.biz.ArticleTagBiz;
import cn.hdu.wlw.console.biz.UserLikeArticleBiz;
import cn.hdu.wlw.console.biz.UserReadBiz;
import cn.hdu.wlw.model.Article;
import cn.hdu.wlw.model.ArticleTag;
import cn.hdu.wlw.model.UserLikeArticle;
import cn.hdu.wlw.model.UserRead;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SnowController extends BaseController implements IController {
	private UserReadBiz userReadBiz;
	private UserLikeArticleBiz userLikeArticleBiz;
	private ArticleTagBiz articleTagBiz;

	public void setArticleTagBiz(ArticleTagBiz articleTagBiz) {
		this.articleTagBiz = articleTagBiz;
	}

	public void setUserReadBiz(UserReadBiz userReadBiz) {
		this.userReadBiz = userReadBiz;
	}

	public void setUserLikeArticleBiz(UserLikeArticleBiz userLikeArticleBiz) {
		this.userLikeArticleBiz = userLikeArticleBiz;
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		logger.info("this is in the snowController");
	}
	
	/**
	 * 根据好友阅读情况分页选择文章列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void articleList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Long userId = Long.valueOf(request.getParameter("userId"));
			int pageIndex = Integer.valueOf(request.getParameter("pageIndex"));
			List<UserRead> userReadList = userReadBiz.findByCareUserId(userId, pageIndex);
			JSONArray articleArray = new JSONArray();
			for(UserRead userRead : userReadList) {
				Article article = userRead.getArticle();
				JSONObject obj = new JSONObject();
				obj.put("title", article.getTitle());
				obj.put("createTime", article.getCreateTime());
				obj.put("writer_name", article.getUser().getName());
				obj.put("writer_id", article.getUser().getId());
				obj.put("writer_icon", article.getUser().getIconImage());
				obj.put("id", article.getId());
				obj.put("friend_name", userRead.getUser().getName());
				obj.put("friend_id", userRead.getUser().getId());
				obj.put("friend_icon", userRead.getUser().getIconImage());
				List<ArticleTag> articleTagList = articleTagBiz.findByArticleId(article.getId());
				JSONArray tagArray = new JSONArray();
				if(articleTagList!=null){
					for(ArticleTag articleTag : articleTagList){
						JSONObject tagobj = JSONObject.fromObject(articleTag.getTag());
						tagobj.remove("createTime");
						tagArray.add(tagobj);
					}
				}
				obj.put("tag_list", tagArray);
				articleArray.add(obj);
			}
			jobj.put("article_list", articleArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}

	/**
	 * 根据好友爱好情况分页选择文章列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void careLikeArticleList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Long userId = Long.valueOf(request.getParameter("userId"));
			int pageIndex = Integer.valueOf(request.getParameter("pageIndex"));
			List<UserLikeArticle> userLikeArticleList = userLikeArticleBiz.findByCareUserId(userId, pageIndex);
			JSONArray articleArray = new JSONArray();
			for(UserLikeArticle userLikeArticle : userLikeArticleList) {
				Article article = userLikeArticle.getArticle();
				JSONObject obj = new JSONObject();
				obj.put("title", article.getTitle());
				obj.put("createTime", article.getCreateTime());
				obj.put("writer_name", article.getUser().getName());
				obj.put("writer_id", article.getUser().getId());
				obj.put("writer_icon", article.getUser().getIconImage());
				obj.put("id", article.getId());
				obj.put("friend_name", userLikeArticle.getUser().getName());
				obj.put("friend_id", userLikeArticle.getUser().getId());
				obj.put("friend_icon", userLikeArticle.getUser().getIconImage());
				List<ArticleTag> articleTagList = articleTagBiz.findByArticleId(article.getId());
				JSONArray tagArray = new JSONArray();
				if(articleTagList!=null){
					for(ArticleTag articleTag : articleTagList){
						JSONObject tagobj = JSONObject.fromObject(articleTag.getTag());
						tagobj.remove("createTime");
						tagArray.add(tagobj);					}
				}
				obj.put("tag_list", tagArray);
				articleArray.add(obj);
			}
			jobj.put("article_list", articleArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
}
