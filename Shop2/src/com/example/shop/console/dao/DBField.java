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
	 * 外键约束，内容类似于house.id（采用的是java代码中类的首字母小写格式，非数据库表名字）
	 */
	String foreignKey() default "";
	
}
