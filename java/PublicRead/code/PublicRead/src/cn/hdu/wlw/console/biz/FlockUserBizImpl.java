package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.FlockUser;

public class FlockUserBizImpl extends BaseBizImpl<FlockUser> implements FlockUserBiz {

	@Override
	public List<FlockUser> findByFlockId(Long flockId) {
		String hql = "from " + FlockUser.class.getName() + " o where o.flock.id =:flockId group by o.user";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("flockId", flockId);
		List<FlockUser> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<FlockUser> findByUserId(Long userId, int pageIndex) {
		String hql = "from " + FlockUser.class.getName() + " o where o.user.id =:userId group by o.flock";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<FlockUser> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public FlockUser findByUserAndFlock(Long userId, Long flockId) {
		String hql = "from " + FlockUser.class.getName() + " o where o.flock.id =:flockId and o.user.id = :userId";
		Map<String, Object> parms  = new HashMap<String, Object>(2);
		parms.put("flockId", flockId);
		parms.put("userId", userId);
		List<FlockUser> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

}
