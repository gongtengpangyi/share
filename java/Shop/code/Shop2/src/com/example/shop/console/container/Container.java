package com.example.shop.console.container;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 容器类
 * @author FRZ
 * 这个类是自开发的容器类，都懒得说是用来干啥的，反正用的时候就在context.xml里面配置好
 * 然后每次用的时候都用getBean来读，其实理论上getBean是唯一开放给外部的函数
 * 不过既然这里是自开发，就不高什么protect类型了，就简单搞搞public和private
 * 实现的过程大致是，由ContextReader去读取XML文件并且存入容器的beanInfo的键值对中
 * 然后在getBean的时候去看一下bean的键值对里面有没有，没有就去beanInfo里面拿bean的信息然后初始化然后储存
 * 反正就是每次用完把他放到map里面去储存再来不让他扔掉。单例模式
 */
public class Container {
	/**
	 * 以下几块内容实现了容器类的单例模式
	 * 因为容器需要是单一且独立的,然后对外开放唯一的接口instance去完成初始化
	 */
	private static Container CONTAINER;
	
	private Container() {
		
	}
	
	public static Container instance() {
		if (CONTAINER == null || !(CONTAINER instanceof Container)) {
			synchronized (Container.class) {				
				CONTAINER = new Container();
			}
		}
		return CONTAINER;
	}
	
	/**
	 * Bean详细信息的键值对，键为Bean的id，值为Bean信息的封装类对象
	 */
	private Map<String, BeanInfo> beanInfoMap;
	
	/**
	 * Bean的键值对，键为Bean的id，值为Bean对应的类对象
	 */
	private Map<String, Object> beanMap;
	
	/**
	 * 增加Bean的信息
	 * @param key id
	 * @param bean 信息类对象
	 */
	public void setBeanInfo(String key, BeanInfo bean) {
		if(beanInfoMap==null) {
			beanInfoMap = new HashMap<String, BeanInfo>();
		}
		beanInfoMap.put(key, bean);
	}
	
	/**
	 * 提取Bean的信息
	 * @param key id
	 * @return 信息类对象
	 */
	public BeanInfo getBeanInfo(String key) {
		if(beanInfoMap==null) {
			beanInfoMap = new HashMap<String, BeanInfo>();
		}
		return beanInfoMap.get(key);
	}
	
	/**
	 * 设置Bean 
	 * @param key Bean的id
	 * @param obj 对应的对象
	 */
	public void setBean(String key, Object obj) {
		if(beanMap==null) {
			beanMap = new HashMap<String, Object>();
		}
		beanMap.put(key, obj);
	}
	
	/**
	 * 获取Bean的对象
	 * @param key Bean的id
	 * @return Bean的对象
	 */
	public Object getBean(String key) {
		if(beanMap==null) {
			beanMap = new HashMap<String, Object>();
		}
		// 从map里面获取Bean
		Object bean = beanMap.get(key);
		if (bean!=null) {
			return bean;
		} else {
			// 如果不存在就通过Bean的信息Map去初始化
			Object obj =  this.addBean(beanInfoMap.get(key));
			if(obj !=null) {
				// 如果初始化完成就加到容器里面
				this.setBean(key, obj);
				return obj;
			}else{
				// 如果还特么不存在就可以报错了
				//TODO:throw ex
				// 这里最好再搞个抛出异常，不过这个项目目前不自定义异常了
				System.out.println("没有这个bean:" + key);
				return null;
			}
		}
		
	}
	
	/**
	 * 添加Bean
	 * @param beanInfo bean信息
	 * @return 添加完的对象
	 */
	private Object addBean(BeanInfo beanInfo) {
		if (beanInfo == null) {
			// 如果信息本来不存在，就返回准备报错吧，其实应该在这里就抛出个异常，然后到上层继续往上抛
			return null;
		}
		// 获取bean的class
		Class<?> clazz = beanInfo.getClazz();
		// 获取构造函数注入的参数列表
		List<String> constructorArgList = beanInfo.getConstructorArgList();
		// 获取set函数注入的参数键值对
		Map<String, String> propertyMap = beanInfo.getPropertyMap();
		try {
			Object obj = null;	//设置需要存入的对象
			if (constructorArgList!=null && constructorArgList.size()>0) {
				// 如果有需要用构造函数注入的参数，就往下执行，获取所有构造函数
				Constructor<?>[] constructors = clazz.getConstructors();
				if(constructors.length != 1 || 
						constructors[0].getParameterTypes().length != constructorArgList.size()) {
					// 如果不是按要求只写了一个构造函数就不支持这种方式的获取
					System.out.println("没有合适的构造函数我擦擦擦！！！！");
					return null;
				}
				// 获取那个用来初始化的构造函数
				Constructor<?> constructor = constructors[0];
				// 获取构造函数的参数的class
				Class<?>[] paramTypes = constructors[0].getParameterTypes();
				Object[] params = new Object[paramTypes.length];
				for (int i = 0; i<paramTypes.length; i++) {
					/*
					 * 这里简单的说就是把XML中的那些value节点内的字符串转换为参数对应的对象
					 * 然后把这些对象装到一个参数数组里面去
					 */
					Class<?> paramType = paramTypes[i];
					Object param = null;
					String paramStr = constructorArgList.get(i);
					if (paramType.equals(Class.class)) {
						param = Class.forName(paramStr);
					} else {
						//TODO: 兼容其他类型
					}
					params[i] = param;
				}
				// 调用构造函数初始化
				obj = constructor.newInstance(params);
			} else {
				// 如果不需要用构造函数去初始化，那就直接用类去初始化（说起来这个好像有哪里不太合理，算了不考虑太灵活）
				obj = clazz.newInstance();
			}
			if (propertyMap !=null) {				
				// 如果有用set函数注入的参数就调用这个函数去一个个set
				this.setProperty(obj, clazz, propertyMap);
			}
			return obj;
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
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	/**
	 * 调用类及其父类的set函数来完成这个牛逼哄哄的事情
	 * @param obj 对象
	 * @param clazz class
	 * @param propertyMap set注入的参数键值对
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	private void setProperty(Object obj, Class<?> clazz, Map<String, String> propertyMap) 
			throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		for (String fieldName : propertyMap.keySet()) {
			try {
				/**
				 * 这个和modelUtil的做法差不多，唯一不同的是如果找不到方法或者变量不直接报错，而是先递归到父类
				 */
				Field field = clazz.getDeclaredField(fieldName);
				String methodName = "set" + fieldName.substring(0,1).toUpperCase() + fieldName.substring(1);
				Method method = clazz.getMethod(methodName, field.getType());
				method.invoke(obj, this.getBean(propertyMap.get(fieldName)));
			} catch (NoSuchFieldException|NoSuchMethodException e) {
				if (clazz.getGenericSuperclass()!=null) {
					this.setProperty(obj, clazz.getSuperclass(), propertyMap);
				}else{					
					e.printStackTrace();
					continue;
				}
			}
		}
	}
	
	//Test
	public void display() {
		for(String key : beanInfoMap.keySet()) {
			System.out.println(key);
			beanInfoMap.get(key).display();
		}
	}
}
