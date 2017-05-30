package cn.hdu.wlw.client.servlet;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.hdu.wlw.client.controller.IController;
import cn.hdu.wlw.console.util.ToolSpring;

public class RequestSubUtil {
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private String servletUrl;
	private String childUrl;
	private String packageUrl;
	private int index;

	public RequestSubUtil(HttpServletRequest req, HttpServletResponse resp, String servletUrl, String packageUrl) {
		super();
		this.req = req;
		this.resp = resp;
		this.packageUrl = packageUrl;
		this.servletUrl = servletUrl;
		this.index = req.getRequestURL().indexOf(servletUrl)+servletUrl.length()+1;
		this.childUrl = req.getRequestURL().substring(index);
	}

	public HttpServletRequest getReq() {
		return req;
	}

	public void setReq(HttpServletRequest req) {
		this.req = req;
	}
	
	public String getServletUrl() {
		return servletUrl;
	}

	public void setServletUrl(String servletUrl) {
		this.servletUrl = servletUrl;
	}
	
	/**
	 * 获取具体控制器
	 * @return controller
	 */
	public String getController(){
		String controller =  this.childUrl.substring(0, this.childUrl.indexOf("/"));
		return controller.substring(0, 1).toLowerCase() + controller.substring(1);
	}

	/**
	 * 获取具体操作的字符串
	 * @return action
	 */
	public String getAction(){
		return this.childUrl.substring(this.childUrl.indexOf("/")+1);
	}
	
	/**
	 * 执行controller.action()
	 */
	public void doAction(){
		try {
			IController controller = (IController) ToolSpring.getBean(this.getController() + "Controller");
			@SuppressWarnings("unchecked")
			Class<IController> c = (Class<IController>) controller.getClass();  
			Class<?> paramsType[] = {
				javax.servlet.http.HttpServletRequest.class, 
				javax.servlet.http.HttpServletResponse.class
			};
    		Object paramsValue[] = {req, resp};
    		Method method = c.getMethod(getAction(), paramsType);    
    		controller.beforeAction();
            method.invoke(controller, paramsValue);
            controller.afterAction();
		} catch (IllegalAccessException e) {
			System.out.println("参数不对");
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			System.out.println("method找不到:" + packageUrl + "." + getController() + "Controller." + getAction());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
        	System.out.println("执行目标不对" + this.getController() + "Controller" + getAction() + ".\n");
			e.printStackTrace();
		}
		
		
	}
	
}
