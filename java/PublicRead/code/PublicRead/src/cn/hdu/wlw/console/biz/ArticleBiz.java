package cn.hdu.wlw.console.biz;

import java.util.List;

import cn.hdu.wlw.model.Article;

public interface ArticleBiz extends BaseBiz<Article> {
	/**
	 * 根据时间排序分页取文章
	 * @param pageIndex 页数
	 * @return 文章集合
	 */
	public List<Article> findListOrderByTime(int pageIndex);
	
	/**
	 * 根据用户分页取文章
	 * @param pageIndex 页数
	 * @return 文章集合
	 */
	public List<Article> findListByUser(Long userId, int pageIndex);
}
