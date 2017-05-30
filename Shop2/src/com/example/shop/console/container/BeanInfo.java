package com.example.shop.console.container;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 存储Bean的信息
 * @author FRZ 
 * 对于这个bean的写法要求还是比较高的，因为毕竟是自开发，没有Spring那么灵活
 * 所以在这里构造函数的参数传入具体的值，而set函数的注入则传入bean的id
 * 当然为了易学一点，这两种法则的写法是属于Spring的写法之一的
 */
public class BeanInfo {
	// Bean的id
	private String id;
	
	// Bean的class对象
	private Class<?> clazz;
	
	// Bean的构造函数参数（对于要通过构造函数来初始化参数的情况，不要出现多余的构造函数，且参数按顺序写
	private List<String> constructorArgList;
	
	// 以set函数形式注入的（注意必须是标准的set函数，具体什么标准自己看）参数键值对
	// 键为参数名，值为注入的bean的id
	private Map<String, String> propertyMap;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public void setClazz(Class<?> clazz) {
		this.clazz = clazz;
	}

	public List<String> getConstructorArgList() {
		return constructorArgList;
	}

	public void setConstructorArgList(List<String> constructorArgList) {
		this.constructorArgList = constructorArgList;
	}

	public Map<String, String> getPropertyMap() {
		return propertyMap;
	}

	public void setPropertyMap(Map<String, String> propertyMap) {
		this.propertyMap = propertyMap;
	}

	/**
	 * 添加set注入的参数
	 * @param name 参数名
	 * @param ref 参数bean的id
	 */
	public void addProperty(String name, String ref) {
		if(propertyMap == null) {
			propertyMap = new HashMap<String, String>();
		}
		propertyMap.put(name, ref);
	}
	
	/**
	 * 添加构造函数注入的参数
	 * @param constructorArg 构造函数参数
	 */
	public void addConstructorArg(String constructorArg) {
		if(constructorArgList == null) {
			constructorArgList = new ArrayList<String>();
		}
		constructorArgList.add(constructorArg);
	}
	
	//Test
	public void display() {
		String displayStr = "id : " + id + " ; " + "class" + clazz.getName() + " ;";
		if (constructorArgList!=null) {
			displayStr = displayStr + " constructor : ";
			for(String str : constructorArgList) {
				displayStr = displayStr + str + ",";
			}
		}
		if(propertyMap!=null) {
			displayStr = displayStr + " property : ";
			for (String key : propertyMap.keySet()) {
				displayStr = displayStr + key + ":" + propertyMap.get(key) + ",";
			}			
		}
		System.out.println(displayStr);
	}

}
