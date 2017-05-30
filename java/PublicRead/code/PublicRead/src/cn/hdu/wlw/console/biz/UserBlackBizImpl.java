package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.model.UserBlack;

public class UserBlackBizImpl extends BaseBizImpl<UserBlack> implements UserBlackBiz {

	@Override
	public UserBlack isBlack(Long userId, Long toUserId) {
		String hql = "from " + UserBlack.class.getName() + " o where o.user.id =:userId and o.toUser.id =:toUserId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		parms.put("toUserId", toUserId);
		List<UserBlack> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<UserBlack> getBlackList(Long userId) {
		String hql = "from " + UserBlack.class.getName() + " o where o.user.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		List<UserBlack> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}
}
