package com.example.shop.console.dao;

import java.util.List;
import java.util.Map;

import com.example.shop.model.Entity;

/**
 * 数据库操作公共接口，封装了数据库的高层次操作
 * @author FRZ
 * 基于DataBase类
 * @param <T> model泛型
 */
public interface Dao<T extends Entity> {
	/**
	 * 储存model
	 * @param model 模板类对象
	 */
	public void save(T model);
	
	/**
	 * 删除model
	 * @param model 模板类对象
	 */
	public void delete(T model);
	
	/**
	 * 更新model
	 * @param model 模板类对象
	 */
	public void update(T model);
	
	/**
	 * 执行SQL语句
	 * 这个东西是给特殊的操作使用的
	 * @param sql SQL语句
	 * @param params 参数键值对
	 */
	public void excute(String sql, Map<String, Object> params);
	
	/**
	 * 查询的基本函数，开放给上层以便对自定义查询便捷访问
	 * @param sql 半SQL语句， 只定义from以后的语句以免产生不必要报错
	 * @param params 参数键值对
	 * @return 查询结果
	 */
	public List<T> query(String sql, Map<String, Object> params);
	
	/**
	 * 查询所有
	 * @return 查询结果
	 */
	public List<T> findAll();
	
	/**
	 * 根据ID查询
	 * @param id ID
	 * @return 查询结果
	 */
	public T findById(Integer id);
}
