package cn.hdu.wlw.client.controller;

import java.util.List;

import org.apache.log4j.Logger;

import cn.hdu.wlw.console.biz.ArticleBiz;
import cn.hdu.wlw.console.biz.ArticleTagBiz;
import cn.hdu.wlw.model.Article;
import cn.hdu.wlw.model.ArticleTag;
import cn.hdu.wlw.model.Tag;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BaseController implements IController {
	protected Logger logger = Logger.getLogger(this.getClass());
	protected JSONObject jobj;

	@Override
	public void beforeAction() {
		System.out.println("before the action");
		jobj = new JSONObject();
	}

	@Override
	public void afterAction() {
		System.out.println("after the action");

	}
	
	/**
	 * 根据用户id和页码来获取用户的文章列表对应的JSONArray，
	 * 这是一个常被用到的函数，因此提取出来单独写，
	 * 这个是不作为action的方法
	 * @param articleBiz 传入所需要用到的BIZ
	 * @param articleTagBiz 所需要用到的BIZ
	 * @param userId 用户id
	 * @param pageIndex 页码
	 * @return 对应的JSONArray
	 */
	public JSONArray getArticleListByUserAndPage(ArticleBiz articleBiz, ArticleTagBiz articleTagBiz, 
			Long userId, int pageIndex) {
		JSONArray articleArray = new JSONArray();
		List<Article> articleList = articleBiz.findListByUser(userId, pageIndex);
		for (Article article : articleList) {
			JSONObject obj = new JSONObject();
			obj.put("title", article.getTitle());
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
			}
			obj.put("tag_list", tagArray);
			obj.put("createTime", article.getCreateTime());
			articleArray.add(obj);
		}
		return articleArray;
	}

}
