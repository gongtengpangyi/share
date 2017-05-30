package cn.hdu.wlw.console.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.model.UserCare;

public class UserCareBizImpl extends BaseBizImpl<UserCare> implements UserCareBiz {
	
	@Override
	public UserCare isCare(Long userId, Long toUserId) {
		String hql = "from " + UserCare.class.getName() + " o where o.user.id =:userId and o.toUser.id =:toUserId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		parms.put("toUserId", toUserId);
		List<UserCare> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<UserCare> getCareList(Long userId) {
		String hql = "from " + UserCare.class.getName() + " o where o.user.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		List<UserCare> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
	
	@Override
	public List<UserCare> getBeCaredList(Long userId) {
		String hql = "from " + UserCare.class.getName() + " o where o.toUser.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		List<UserCare> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public int countCare(Long userId) {
		List<UserCare> list = getCareList(userId);
		if(list == null) {
			list = new ArrayList<UserCare>();
		}
		return list.size();
	}

	@Override
	public int countBeCared(Long userId) {
		String hql = "from " + UserCare.class.getName() + " o where o.toUser.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		List<UserCare> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list.size();
		} else {
			return 0;
		}
	}

	
}
