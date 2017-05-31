package com.example.shop.client.mapping;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.shop.client.controller.IController;
import com.example.shop.console.container.ToolContrainer;

/**
 * 将请求映射到相应的action中
 * @author FRZ
 *
 */
public class RequestMapping {
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private String[] sections;

	public RequestMapping(HttpServletRequest req, HttpServletResponse resp) {
		super();
		this.req = req;
		this.resp = resp;
		// 将请求根据"/"转为数组
		this.sections = req.getRequestURI().toString().split("/");
	}
	
	/**
	 * 获取具体控制器
	 * @return controller
	 */
	public String getController(){
		return this.sections[3];
	}

	/**
	 * 获取具体操作的字符串
	 * @return action
	 */
	public String getAction(){
		return this.sections[4];
	}
	
	/**
	 * 执行controller.action()
	 * 根据注解的action映射,目前的功能还非常弱，
	 * 由于类型转换过程的复杂性，目前只支持及少数类型变量直接传入
	 * 如String，Integer，Long，Float等等，对于其他类型的变量，
	 * 目前尚不支持也懒得去写支持，具体传入String之后自己去转换
	 * 推荐用String类型
	 * 此外这种模式放在后置位置进行判断，
	 * 因为参数的具体化导致内部代码虽然简介却不易抽象，在大多数情况下还是推荐用前者进行映射
	 */
	public void doAction(){
		// 从容器中获取相应的controller
		IController controller = (IController) ToolContrainer.getBean(this.getController() + "Controller");
		// 执行先行操作
		controller.beforeAction(req);
		// 先设置请求结果为失败
		String result = IController.ERROR;
		MappingAction action = null;
		try {
			@SuppressWarnings("unchecked")
			// 获取Controller的class
			Class<IController> c = (Class<IController>) controller.getClass();  
			// 获取controller的所有方法
			Method[] methods = c.getDeclaredMethods();
			// 初始化方法的参数数组
			Object[] paramsValue = null;
			for(Method method : methods) {
				/*
				 * 遍历所有方法
				 */
				action = method.getAnnotation(MappingAction.class);
				if (action!=null && action.name().equals(getAction())) {
					/*
					 * 当查询到所需要映射的方法之后，获取方法的所有参数的parameter对象
					 */
					Parameter[] params = method.getParameters();
					// 将参数数组长度设置为方法的参数个数
					paramsValue = new Object[params.length];
					int index = 0;
					for (Parameter param : params) {
						// 遍历参数，如果是request或者response就直接放入参数数组中
						if (param.getType().equals(HttpServletRequest.class)) {
							paramsValue[index++] = req;
						} else if(param.getType().equals(HttpServletResponse.class)){
							paramsValue[index++] = req;
						} else {
							// 如果是其他形式的参数就把请求中的量给拿出来，并且转换为相应类型
							String key = param.getAnnotation(MappingParam.class).value();
							if(param.getType().equals(String.class)) {
								paramsValue[index++] = req.getParameter(key);
								continue;
							}
							// 拿到类中的valueOf方法
							Method valueOf = param.getType().getMethod("valueOf", new Class[]{String.class});
							// 填充参数数组
							paramsValue[index++] = valueOf.invoke(null, req.getParameter(key));
						}
					}
					// 执行方法
					method.invoke(controller, paramsValue);
					result = IController.SUCCESS;
					return;
				}
			}	
			// 如果顺利执行完毕没有异常就把请求结果设置为成功
		} catch (IllegalAccessException e) {
			System.out.println("参数不对");
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			System.out.println("method找不到:" + getController() + "Controller." + getAction());
			e.printStackTrace();
		} catch (InvocationTargetException e) {
        	System.out.println("执行目标不对" + this.getController() + "Controller" + getAction() + ".\n");
			e.printStackTrace();
		} finally {
			try {
				// 执行请求处理后的函数
				controller.afterAction(resp, result);
				controller.response(req, resp, result, action);
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
	
	}
	
}
