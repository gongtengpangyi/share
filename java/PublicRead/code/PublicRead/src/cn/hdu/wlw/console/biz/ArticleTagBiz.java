package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.ArticleTag;

public interface ArticleTagBiz extends BaseBiz<ArticleTag> {
	/**
	 * 根据文章id寻找所有标签
	 * @param articleId 文章id
	 * @return 文章标签集合
	 */
	public List<ArticleTag> findByArticleId(Long articleId);
	
	/**
	 * 根据标签id来查找所有文章
	 * @param tagId 标签id
	 * @param pageIndex 当前页
	 * @return 文章标签集合	 
	 */
	public List<ArticleTag> findByTagId(Long tagId, int pageIndex);
	
	/**
	 * 根据标签关键字来匹配
	 * @param tagName 关键字
	 * @param pageIndex 页码
	 * @return 文章标签集合
	 */
	public List<ArticleTag> findByMatchTagName(String tagName, int pageIndex, Integer type);
}
