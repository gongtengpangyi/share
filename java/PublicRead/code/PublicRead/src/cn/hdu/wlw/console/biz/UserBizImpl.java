package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.User;

public class UserBizImpl extends BaseBizImpl<User> implements UserBiz {

	@Override
	public User findByAccount(String account) {
		String hql = "from " + User.class.getName() + " o where o.account=:account order by o.id desc";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("account", account);
		Pager pager = new Pager();
		pager.setPageSize(1);
		List<User> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return (User)list.get(0);
		} else {
			return null;
		}
	}

}
