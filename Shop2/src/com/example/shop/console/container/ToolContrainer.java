package com.example.shop.console.container;

public class ToolContrainer {
	/**
	 * 获取bean
	 * @param key Bean的id
	 * @return 对应的Bean
	 */
	public static Object getBean(String key) {
		return Container.instance().getBean(key);
	}
}
