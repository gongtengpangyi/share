package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.model.Tag;

public class TagBizImpl extends BaseBizImpl<Tag> implements TagBiz {
	public List<Tag> findListPager(int pageIndex) {
		String hql = "from " + Tag.class.getName() + "";
		Map<String, Object> parms  = new HashMap<String, Object>(0);
		Pager pager = new Pager();
		pager.setPageSize(10);
		pager.setPageIndex(pageIndex);
		List<Tag> list = dao.pageableFindByHQL(pager, hql, parms);
		if(list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public Tag findByName(String tagName) {
		String hql = "from " + Tag.class.getName() + " o where o.name = :tagName order by o.createTime";
		Map<String, Object> parms  = new HashMap<String, Object>(0);
		parms.put("tagName", tagName);
		List<Tag> list = dao.findByHQL(hql, parms);
		if(list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

}
