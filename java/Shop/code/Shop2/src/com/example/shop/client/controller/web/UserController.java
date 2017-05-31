package com.example.shop.client.controller.web;

import javax.servlet.http.HttpServletRequest;

import com.example.shop.client.controller.BaseController;
import com.example.shop.client.controller.IController;
import com.example.shop.client.mapping.MappingAction;
import com.example.shop.client.mapping.MappingAction.Do;
import com.example.shop.client.mapping.MappingParam;
import com.example.shop.console.biz.AdminBiz;
import com.example.shop.console.util.JSONUtil;
import com.example.shop.model.Admin;

public class UserController extends BaseController implements IController {
	private AdminBiz adminBiz;

	public void setAdminBiz(AdminBiz adminBiz) {
		this.adminBiz = adminBiz;
	}

	@Override
	public void beforeAction(HttpServletRequest request) {
		super.beforeAction(request);
		System.out.println("in the userController");
	}

	@MappingAction(name = "login", doAction=Do.XML)
	public void login(@MappingParam("account") String account, @MappingParam("password") String password) {
		Admin admin = adminBiz.findByAccount(account);
		if (admin == null) {
			jobj.put("loginResult", 2);
		} else if (admin.getPass().equals(password)) {
			jobj.put("loginResult", 0);
		} else {
			jobj.put("loginResult", 1);
		}
	}
	
	@MappingAction(name = "all")
	public void getAll(HttpServletRequest request, @MappingParam("account") String account, @MappingParam("password") String password) {
		Admin admin = adminBiz.findByAccount(account);
		jobj.put("xxx", request.getParameter("index"));
		jobj.put("admin", JSONUtil.fromObject(admin, "*"));
	}

}
