package com.example.shop.client.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public void afterAction(HttpServletResponse resp, String result) throws IOException;
	
}
