package com.example.shop.console.biz;

import java.util.List;

import com.example.shop.console.dao.Dao;
import com.example.shop.model.Entity;

/**
 * 用于模板的顶层控制，啊反正就是数据库操作都用它就对了嗯。
 * @author FRZ
 * 依赖于自开发的DAO
 * @param <T> model泛型对象
 */
public interface BaseBiz<T extends Entity> {
	/**
	 * 设置DAO
	 * @param dao DAO对象
	 */
	public void setDao(Dao<T> dao);
	
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
