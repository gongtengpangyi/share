package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.UserCare;
import cn.hdu.wlw.model.UserLikeArticle;

public class UserLikeArticleBizImpl extends BaseBizImpl<UserLikeArticle> implements UserLikeArticleBiz {

	@Override
	public List<UserLikeArticle> findByUserId(Long userId, int pageIndex) {
		String hql = "from " + UserLikeArticle.class.getName() + " o where o.user.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<UserLikeArticle> list = dao.pageableFindByHQL(pager, hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public UserLikeArticle findByUserIdAndArticleId(Long userId, Long articleId) {
		String hql = "from " + UserLikeArticle.class.getName() + " o where o.user.id =:userId and "
				+ "o.article.id = :articleId order by o.likeTime desc";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		parms.put("articleId", articleId);
		List<UserLikeArticle> list = dao.findByHQL(hql, parms);		
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<UserLikeArticle> findByCareUserId(Long userId, int pageIndex) {
		String hql = "select o from " + UserLikeArticle.class.getName() + " o, " + UserCare.class.getName() + 
				" c where c.user.id =:userId and c.toUser.id = o.user.id group by o.article, o.user";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<UserLikeArticle> list = dao.pageableFindByHQL(pager, hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}


}
