package com.example.shop.client.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.shop.client.mapping.MappingAction;

public interface IController {
	public static final String ERROR = "error";
	public static final String SUCCESS = "success";
	
	/**
	 * 请求前执行
	 * @param req
	 */
	public void beforeAction(HttpServletRequest req);

	/**
	 * 请求后执行
	 * @param resp
	 * @param result
	 * @throws IOException
	 */
	public void afterAction(HttpServletResponse resp, String result);
	
	/**
	 * 请求返回
	 * @param req request
	 * @param resp response
	 * @param result 成功与否
	 * @param action 请求执行注解
	 * @throws IOException
	 */
	public void response(HttpServletRequest req, HttpServletResponse resp, String result, MappingAction action) throws IOException;
	
}
