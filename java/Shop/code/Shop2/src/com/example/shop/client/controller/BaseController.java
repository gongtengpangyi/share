package com.example.shop.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.shop.client.mapping.MappingAction;
import com.example.shop.console.util.JSONUtil;

import net.sf.json.JSONObject;

public class BaseController implements IController {
	protected JSONObject jobj;

	@Override
	public void beforeAction(HttpServletRequest request) {
		System.out.println("before");
		jobj = new JSONObject();
	}
	
	@Override
	public void afterAction(HttpServletResponse response, String result){
		System.out.println("after");
		
	}

	@Override
	public void response(HttpServletRequest request, HttpServletResponse response, String result, MappingAction action) throws IOException{
		jobj.put("result", result);
		// 返回请求结果
		switch(action.doAction()) {
			case JSON:
				response.getWriter().print(jobj.toString());
				break;
			case XML:
				String xml = JSONUtil.json2xml(jobj.toString());
				System.out.println(xml);
				response.getWriter().print(xml);
				break;
			case FORWORD:
				// 请求转发
				try {
					request.getRequestDispatcher(action.url()).forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} 
				break;
			case REDIRECT:
				// 请求重定向
				response.sendRedirect(action.url());
				break;
			default:
				break;
		}
	}


}
