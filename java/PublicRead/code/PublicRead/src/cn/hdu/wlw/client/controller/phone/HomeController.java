package cn.hdu.wlw.client.controller.phone;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.console.biz.ArticleBiz;
import cn.hdu.wlw.console.biz.ArticleTagBiz;
import cn.hdu.wlw.console.biz.TagBiz;
import cn.hdu.wlw.console.biz.UserBiz;
import cn.hdu.wlw.console.biz.UserBlackBiz;
import cn.hdu.wlw.console.biz.UserCareBiz;
import cn.hdu.wlw.console.biz.UserLikeArticleBiz;
import cn.hdu.wlw.console.biz.UserReadBiz;
import cn.hdu.wlw.console.biz.UserTagBiz;
import cn.hdu.wlw.console.util.ModelUtil;
import cn.hdu.wlw.model.Article;
import cn.hdu.wlw.model.ArticleTag;
import cn.hdu.wlw.model.Tag;
import cn.hdu.wlw.model.User;
import cn.hdu.wlw.model.UserLikeArticle;
import cn.hdu.wlw.model.UserRead;
import cn.hdu.wlw.model.UserTag;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class HomeController extends BaseController implements IController {
	private UserBiz userBiz;
	private ArticleBiz articleBiz;
	private ArticleTagBiz articleTagBiz;
	private TagBiz tagBiz;
	private UserReadBiz userReadBiz;
	private UserLikeArticleBiz userLikeArticleBiz;
	private UserTagBiz userTagBiz;
	private UserCareBiz userCareBiz;
	private UserBlackBiz userBlackBiz;

	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	public void setArticleBiz(ArticleBiz articleBiz) {
		this.articleBiz = articleBiz;
	}

	public void setArticleTagBiz(ArticleTagBiz articleTagBiz) {
		this.articleTagBiz = articleTagBiz;
	}

	public void setTagBiz(TagBiz tagBiz) {
		this.tagBiz = tagBiz;
	}	

	public void setUserReadBiz(UserReadBiz userReadBiz) {
		this.userReadBiz = userReadBiz;
	}

	public void setUserLikeArticleBiz(UserLikeArticleBiz userLikeArticleBiz) {
		this.userLikeArticleBiz = userLikeArticleBiz;
	}
	
	public void setUserTagBiz(UserTagBiz userTagBiz) {
		this.userTagBiz = userTagBiz;
	}

	public void setUserCareBiz(UserCareBiz userCareBiz) {
		this.userCareBiz = userCareBiz;
	}

	public void setUserBlackBiz(UserBlackBiz userBlackBiz) {
		this.userBlackBiz = userBlackBiz;
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		logger.info("this is in the homeController");
	}
	
	/**
	 * 按时间分页获取所有文章操作
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void articleList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			logger.info("this is in the articleList");
			List<Article> articleList = articleBiz.findListOrderByTime(Integer.valueOf(request.getParameter("pageIndex")));
			JSONArray jsonArray = new JSONArray();
			for(Article article : articleList){
				JSONObject obj = new JSONObject();
				obj.put("title", article.getTitle());
				obj.put("createTime", article.getCreateTime());
				obj.put("writer", article.getUser().getName());
				obj.put("writer_id", article.getUser().getId());
				obj.put("id", article.getId());
				List<ArticleTag> articleTagList = articleTagBiz.findByArticleId(article.getId());
				JSONArray tagArray = new JSONArray();
				if(articleTagList!=null){
					for(ArticleTag articleTag : articleTagList){
						Tag tag = articleTag.getTag();
						if(tag!=null) {							
							JSONObject tagObj = JSONObject.fromObject(tag);
							tagObj.remove("createTime");
							tagArray.add(tagObj);
						}
					}
					obj.put("tag_list", tagArray);
					jsonArray.add(obj);
				} else {
					continue;
				}
			}
			jobj.put("article_list", jsonArray);
		} catch(Exception e){
			jobj.put("result", "error");
			e.printStackTrace();
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 文章详情
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void articleIntroduce(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Article article = articleBiz.findById(Long.valueOf(request.getParameter("articleId")));
			jobj = JSONObject.fromObject(article);
			jobj.put("liked", "false");
			String userId ;
			if((userId = request.getParameter("userId"))!=null) {
				// 保存用户的阅读记录
				User user = userBiz.findById(Long.valueOf(userId));
				UserRead userRead = new UserRead();
				userRead.setArticle(article);
				userRead.setUser(user);
				userRead.setReadTime(new Date());
				userReadBiz.save(userRead);
				if(userLikeArticleBiz.findByUserIdAndArticleId(user.getId(), article.getId())!=null) {
					jobj.put("liked", "true");
				}
			}
			// 返回文章内容
			List<ArticleTag> articleTagList = articleTagBiz.findByArticleId(article.getId());
			JSONArray tagArray = new JSONArray();
			if(articleTagList!=null){
				for(ArticleTag articleTag : articleTagList){
					JSONObject tagObj = JSONObject.fromObject(articleTag.getTag());
					tagObj.remove("createTime");
					tagArray.add(tagObj);
				}
			}
			jobj.put("tag_list", tagArray);
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
	
	/**
	 * 添加文章
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void addArticle(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try{
			Article article = new Article();
			ArticleTag articleTag;
			Map<String, String[]> paramMap = request.getParameterMap();
			for(String key : paramMap.keySet()){
				if(key.equals("tagIds")||key.equals("newTagNames")) {
					continue;
				} else if(key.equals("userId")){
					article.setUser(userBiz.findById(Long.valueOf(request.getParameter("userId"))));
					continue;
				}
				ModelUtil.setValue(article, key, paramMap.get(key)[paramMap.get(key).length-1]);
			}
			article.setCreateTime(new Date());
			String strTagIds = request.getParameter("tagIds");
			String newTagNames = request.getParameter("newTagNames");
			if((strTagIds!=null && !strTagIds.equals(""))||(newTagNames!=null && !newTagNames.equals(""))){
				if(strTagIds!=null && !strTagIds.equals("")){
					articleBiz.save(article);
					String[] tagIds = strTagIds.split(",");
					for(String tagId : tagIds){
						articleTag = new ArticleTag();
						articleTag.setArticle(article);
						articleTag.setCreateTime(new Date());
						articleTag.setTag(tagBiz.findById(Long.valueOf(tagId)));
						articleTagBiz.save(articleTag);
					}
	 			}
	 			if(newTagNames!=null && !newTagNames.equals("")){
					articleBiz.save(article);
					String[] tagNames = newTagNames.split(",");
					for(String tagName : tagNames) {
						Tag tag = new Tag();
						tag.setName(tagName);
						tag.setCreateTime(new Date());
						tagBiz.save(tag);
						articleTag = new ArticleTag();
						articleTag.setArticle(article);
						articleTag.setCreateTime(new Date());
						articleTag.setTag(tag);
						articleTagBiz.save(articleTag);
					}
				}
	 			jobj.put("result", "success");
			} else {
				throw new Exception();
			}
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 点赞文章
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void likeArticle(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Article article = articleBiz.findById(Long.valueOf(request.getParameter("articleId")));
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			if(userLikeArticleBiz.findByUserIdAndArticleId(user.getId(), article.getId())==null) {
				UserLikeArticle userLikeArticle = new UserLikeArticle();
				userLikeArticle.setArticle(article);
				userLikeArticle.setUser(user);
				userLikeArticle.setLikeTime(new Date());
				userLikeArticleBiz.save(userLikeArticle);
				jobj.put("result", "success");
			} else {
				throw new Exception("article_" + article.getId() + " is already liked by user_" + user.getId());
			}
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}

	/**
	 * 取消点赞文章
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void delLikeArticle(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Article article = articleBiz.findById(Long.valueOf(request.getParameter("articleId")));
			User user = userBiz.findById(Long.valueOf(request.getParameter("userId")));
			UserLikeArticle userLikeArticle;
			if((userLikeArticle = userLikeArticleBiz.findByUserIdAndArticleId(user.getId(), article.getId()))!=null) {
				userLikeArticleBiz.delete(userLikeArticle);
				jobj.put("result", "success");
			} else {
				throw new Exception("article_" + article.getId() + " is not liked by user_" + user.getId());
			}
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 根据标签来获取文章列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void articleListByTag(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			Long tagId = Long.valueOf(request.getParameter("tagId"));
			int pageIndex = Integer.valueOf(request.getParameter("pageIndex"));
			if(tagId==null||pageIndex<=0){
				jobj.put("result", "error");
			} else {
				List<ArticleTag> articleTagList = articleTagBiz.findByTagId(tagId, pageIndex);
				JSONArray articleArray = new JSONArray();
				if(articleTagList!=null){
					for(ArticleTag articleTag : articleTagList){
						JSONObject obj = new JSONObject();
						obj.put("title", articleTag.getArticle().getTitle());
						obj.put("id", articleTag.getArticle().getId());
						obj.put("writer", articleTag.getArticle().getUser().getName());
						articleArray.add(obj);
					}
				}
				jobj.put("result", "success");
				jobj.put("article_list", articleArray);
			}
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
	
	/**
	 * 分页获取标签列表
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void tagList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			List<Tag> tagList = tagBiz.findListPager(Integer.valueOf(request.getParameter("pageIndex")));
			JSONArray tagArray = new JSONArray();
			for(Tag tag : tagList) {
				tagArray.add(JSONObject.fromObject(tag));
			}
			jobj.put("result", "success");
			jobj.put("tag_list", tagArray);
		} catch(Exception e) {
			e.printStackTrace();
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj);
	}
	
	/**
	 * 用户主页
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void userHome(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			User user = userBiz.findById(Long.valueOf(request.getParameter("toUserId")));
			jobj = JSONObject.fromObject(user);
			jobj.remove("password");
			jobj.put("cared", "false");
			jobj.put("blacked", "false");
			jobj.put("articleList", getArticleListByUserAndPage(articleBiz, articleTagBiz, user.getId(), 1));
			List<UserTag> userTagList = userTagBiz.findByUserId(user.getId());
			JSONArray tagArray = new JSONArray();
			for (UserTag userTag : userTagList) {
				JSONObject tagObj = JSONObject.fromObject(userTag.getTag());
				tagObj.remove("createTime");
				tagArray.add(tagObj);
			}
			Long userId = Long.valueOf(request.getParameter("userId"));
			if(userCareBiz.isCare(userId, user.getId())!=null) {
				jobj.put("cared", "true");
			} else if(userBlackBiz.isBlack(userId, user.getId())!=null) {
				jobj.put("blacked", "true");
			}
			jobj.put("tag_list", tagArray);
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().println(jobj.toString());
	}
	
}
