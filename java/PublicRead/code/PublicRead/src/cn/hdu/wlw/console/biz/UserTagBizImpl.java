package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.model.UserTag;

public class UserTagBizImpl extends BaseBizImpl<UserTag> implements UserTagBiz {

	@Override
	public List<UserTag> findByTagId(Long tagId) {
		String hql = "from " + UserTag.class.getName() + " o where o.tag.id =:tagId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("tagId", tagId);
		List<UserTag> list = dao.findByHQL(hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public List<UserTag> findByUserId(Long userId) {
		String hql = "from " + UserTag.class.getName() + " o where o.user.id =:userId";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		List<UserTag> list = dao.findByHQL(hql, parms);		
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public UserTag findByUserIdAndTagId(Long userId, Long tagId) {
		String hql = "from " + UserTag.class.getName() + " o where o.tag.id =:tagId"
				+ " and o.user.id=:userId order by o.createTime desc";
		Map<String, Object> parms  = new HashMap<String, Object>(2);
		parms.put("tagId", tagId);
		parms.put("userId", userId);
		List<UserTag> list = dao.findByHQL(hql, parms);		
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

}
