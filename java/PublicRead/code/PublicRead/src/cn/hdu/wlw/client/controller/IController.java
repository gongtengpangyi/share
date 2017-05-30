package cn.hdu.wlw.client.controller;

public interface IController {
	
	/**
	 * 所有操作公共的初始化
	 */
	public void beforeAction();
	
	/**
	 * 所有操作公共的结束
	 */
	public void afterAction();
}
