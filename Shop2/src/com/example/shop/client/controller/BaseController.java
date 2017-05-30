package com.example.shop.client.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONObject;

public class BaseController implements IController {
	protected JSONObject jobj;

	@Override
	public void beforeAction(HttpServletRequest request) {
		System.out.println("before");
		jobj = new JSONObject();
	}
	
	@Override
	public void afterAction(HttpServletResponse response, String result) throws IOException{
		System.out.println("after");
		jobj.put("result", result);
		// 返回请求结果
		response.getWriter().print(jobj.toString());
	}


}
