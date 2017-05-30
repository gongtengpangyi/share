package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.ArticleTag;

public class ArticleTagBizImpl extends BaseBizImpl<ArticleTag> implements ArticleTagBiz {

	@Override
	public List<ArticleTag> findByArticleId(Long articleId) {
		String hql = "from " + ArticleTag.class.getName() + " o where o.article.id =:articleId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("articleId", articleId);
		List<ArticleTag> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<ArticleTag> findByTagId(Long tagId, int pageIndex) {
		String hql = "from " + ArticleTag.class.getName() + " o where o.tag.id =:tagId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("tagId", tagId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<ArticleTag> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<ArticleTag> findByMatchTagName(String tagName, int pageIndex, Integer type) {
		String[] strs = tagName.split("");
		String hql = " from " + ArticleTag.class.getName() + " o where o.article.type=:type group by o.article order by ";
		for(String str : strs) {
			hql = hql + "case when o.tag.name like '%" + str + "%' then 1 end +";
		}
		hql = hql.substring(0, hql.length()-1) + " desc";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("type", type);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<ArticleTag> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

}
