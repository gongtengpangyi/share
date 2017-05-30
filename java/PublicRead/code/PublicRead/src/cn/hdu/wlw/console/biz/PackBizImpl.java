package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.Pack;

public class PackBizImpl extends BaseBizImpl<Pack> implements PackBiz {

	@Override
	public List<Pack> findNotSuccess(Long userId) {
		String hql = "from " + Pack.class.getName() + " o where o.user.id=:userId order by o.createTime";
		Map<String, Object> parms  = new HashMap<String, Object>(1);
		parms.put("userId", userId);
		Pager pager = new Pager();
		pager.setPageSize(1);
		List<Pack> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

}
