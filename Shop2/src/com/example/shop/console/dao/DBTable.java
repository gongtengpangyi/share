package com.example.shop.console.dao;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 数据表注解
 * @author FRZ
 * 
 */
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DBTable {
	/*
	 * 表名
	 */
	String name() default "";
	
	/*
	 * 主键在数据库中的字段名（处理某些id都乱命名的白痴行为）
	 */
	String keyName() default "id";
//	
//	/*
//	 * 主键在java类中的变量名字
//	 */
//	String keyParamName() default "id";
//	
//	/*
//	 * 主键字段类型
//	 */
//	String keyType() default "int";
}
