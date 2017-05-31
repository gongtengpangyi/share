package com.example.shop.client.mapping;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MappingAction {
	/*
	 * action的name
	 */
	String name() default "";
	
	/*
	 * 枚举几种常见的结果
	 */
	public enum Do{
		JSON,
		XML,
		FORWORD,
		REDIRECT
	}
	
	/*
	 * 返回的类型，推荐还是使用JSON
	 */
	Do doAction() default Do.JSON;
	
	/*
	 * 如果doAction的返回类型是后两者，则需要指定url的值
	 */
	String url() default "";
}
