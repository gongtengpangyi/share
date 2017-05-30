package cn.hdu.wlw.console.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import cn.hdu.wlw.console.common.Pager;


public interface BaseDao<T extends Serializable,E extends Serializable>  {

	/**
	 *
	 * @param model
	 */
	void saveOrUpdate(T model);

	/**
	 *
	 * @param model
	 */
	void save(T model);

	/**
	 *
	 * @param model
	 */
	void update(T model);

	/**
	 *
	 * @param model
	 */
	void delete(T model);

	
	/**
	 *
	 * @param hql
	 */
	void delete(String hql);	
	
	/**
	 *
	 * @param pk
	 * @return
	 */
	T findById(E pk);


	/**
	 *
	 * @return
	 */
	List<T> findAll();
	/**
	 *
	 * @param hql
	 * @return
	 */
	List<T> findByHQL(String hql);
	/**
	 *
	 * @param pager
	 * @param hql
	 * @return
	 */
	List<T> pageableFindByHQL(Pager pager,String hql);
	/**
	 *
	 * @param hql
	 * @param queryParams
	 * @return
	 */
	List<T> findByHQL(String hql,Map<String,Object> queryParams);
	/**
	 *
	 * @param pager
	 * @param hql
	 * @param queryParams
	 * @return
	 */
	List<T> pageableFindByHQL(Pager pager,String hql,Map<String,Object> queryParams);
	
	/**
	 * 通过一个实例来找
	 * @param example
	 * @return
	 */
	List<T> findByExample(T example,Pager pager);
	
	Object uniqueQuery(String hql);
	
	
	int	update(String queryString);
	
	
}
