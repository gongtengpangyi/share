package com.example.shop.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.shop.model.Admin;

public class AdminBizImpl extends BaseBizImpl<Admin> implements AdminBiz {

	@Override
	public Admin findByAccount(String account) {
		String sql = "from " + Admin.class.getName() + " o where o.account=:account";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("account", account);
		List<Admin> list = dao.query(sql, params);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}


}
