package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.UserCare;
import cn.hdu.wlw.model.UserRead;

public class UserReadBizImpl extends BaseBizImpl<UserRead> implements UserReadBiz {

	@Override
	public List<UserRead> findByUserId(Long userId, int pageIndex) {
		String hql = "from " + UserRead.class.getName() + " o where o.user.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<UserRead> list = dao.pageableFindByHQL(pager, hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<UserRead> findByCareUserId(Long userId, int pageIndex) {
		String hql = "select o from " + UserRead.class.getName() + " o, " + UserCare.class.getName() + 
				" c where c.user.id =:userId and c.toUser.id = o.user.id group by o.article, o.user";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<UserRead> list = dao.pageableFindByHQL(pager, hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	
}
