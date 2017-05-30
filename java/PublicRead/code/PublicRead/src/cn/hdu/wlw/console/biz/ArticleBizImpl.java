package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.Article;

public class ArticleBizImpl extends BaseBizImpl<Article> implements ArticleBiz {
	public List<Article> findListOrderByTime(int pageIndex) {
		String hql = "from " + Article.class.getName() + " o order by o.createTime desc";
		Map<String, Object> parms  = new HashMap<String, Object>(0);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<Article> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<Article> findListByUser(Long userId, int pageIndex) {
		String hql = "from " + Article.class.getName() + " o where o.user.id=:userId order by o.createTime desc";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<Article> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
}
