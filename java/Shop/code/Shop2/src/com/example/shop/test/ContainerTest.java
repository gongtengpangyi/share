package com.example.shop.test;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.example.shop.console.biz.AdminBiz;
import com.example.shop.console.container.Container;
import com.example.shop.console.container.ContextReader;
import com.example.shop.console.container.ToolContrainer;
import com.example.shop.console.dao.Dao;
import com.example.shop.model.Admin;

public class ContainerTest {
	@Test
	public void testParseXml() {
		ContextReader reader = new ContextReader();
		reader.parseXml("/context.xml");
		reader.getContainer().display();
	}
	
	@Test
	public void testGetBean() {
		ContextReader reader = new ContextReader();
		reader.parseXml("/context.xml");
		AdminBiz biz = (AdminBiz) Container.instance().getBean("adminBiz");
		biz = (AdminBiz) ToolContrainer.getBean("adminBiz");
		Admin admin = biz.findByAccount("mmm");
		System.out.println(admin.getId());
		System.out.println(admin.toString());
	}
	
	@Test
	public void testShabi(){
		try {
			Class<?> clazz = Class.forName("com.example.shop.console.dao.DaoImpl");
			Constructor<?> c = clazz.getConstructor(Class.class);
			String str = "com.example.shop.model.Admin";
			Class<?>[] paramTypes = c.getParameterTypes();
			System.out.println(paramTypes[0]);
			System.out.println(Class.forName(str));
			@SuppressWarnings("unchecked")
			Dao<Admin> dao = (Dao<Admin>) c.newInstance("com.example.shop.console.dao.DaoImpl.class");
			
			String sql = "from " + Admin.class.getName() + " o where o.id=:id and o.account=:account and o.pass = :password";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", 5);
			params.put("account", "haojian");
			params.put("password", "shabi");
			List<Admin> list = dao.query(sql, params);
			for(Admin admin : list) {
				System.out.println(admin.getId());
				System.out.println(admin.toString());
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
