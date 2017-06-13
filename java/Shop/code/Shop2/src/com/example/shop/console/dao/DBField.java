package com.example.shop.console.dao;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

/**
 * 数据库字段注解
 * @author FRZ
 *
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DBField {
	
	/*
	 * 字段名
	 */
	String name() default "";
	
	/*
	 * 字段类型
	 */
	String type() default "varchar";
	
	/*
	 * 外键约束，描述外键在所在表所对应的model类中的变量名
	 */
	String foreignKey() default "";
	
}
