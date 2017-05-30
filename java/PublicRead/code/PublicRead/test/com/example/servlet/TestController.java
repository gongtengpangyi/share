package com.example.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.BaseController;
import cn.hdu.wlw.console.biz.BaseBiz;
import cn.hdu.wlw.console.util.ToolSpring;
import cn.hdu.wlw.model.Entity;

public class TestController extends BaseController{
	
	@SuppressWarnings("unchecked")
	public void doTest(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String name=request.getParameter("name");
		if(name==null){
			name="test";
		}
		StringBuilder sb = new StringBuilder();
		BaseBiz<Entity> testBiz = (BaseBiz<Entity>) ToolSpring.getBean(name+"Biz");
		List<Entity> testList = testBiz.findAll();
		for(Entity test : testList){
			sb.append(test.toString());
		}
		response.getWriter().println(sb.toString());
		
	}

	@Override
	public void beforeAction() {
		super.beforeAction();
		System.out.println("testBefore");
	}

	@Override
	public void afterAction() {
		super.afterAction();
		System.out.println("testAfter");
		
	}
	
	/**
	 * test
	 * @param request 请求
	 * @param response 回复
	 * @throws IOException 回复抛出异常
	 */
	public void test(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			
		} catch(Exception e) {
			jobj.put("result", "error");
		}
		response.getWriter().print(jobj.toString());
	}
}
