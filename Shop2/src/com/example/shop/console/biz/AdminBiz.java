package com.example.shop.console.biz;

import com.example.shop.model.Admin;

public interface AdminBiz extends BaseBiz<Admin> {
	public Admin findByAccount(String account);
}
