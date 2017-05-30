package cn.hdu.wlw.console.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import cn.hdu.wlw.console.common.Pager;
import cn.hdu.wlw.console.dao.BaseDao;
import cn.hdu.wlw.model.Entity;


public class BaseBizImpl<T extends Entity> implements BaseBiz<T> {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	protected BaseDao<T, Long> dao;
	

	public void setDao(BaseDao<T, Long> dao) {
		this.dao = dao;
	}

	public List<T> findAll(){
		return dao.findAll();
	}

	public void update(T t){
		dao.saveOrUpdate(t);
	}

	public void save(T t){
		dao.saveOrUpdate(t);
	}


	public void delete(T model){
		dao.delete(model);
	}
	
	@SuppressWarnings("unused")
	public void falseDelete(T model) {
		String className = model.getClass().getName();
		String simpleClassName = model.getClass().getSimpleName();
		update("update " + className + " set state = 0 where id = " + model.getId());
	}

	@Override
	public List<T> query(T model,Pager pager) {
		
		return dao.findByExample(model,pager);
	}

	@Override
	public T findById(Long id) {
		return dao.findById(id);
	}
	
	public Boolean checkExist(String objectName, String name, Object value) {
		String hql="from "+ objectName + " where " + name + "=:value";	
		Map<String, Object> params = new HashMap<String, Object>(1);
		params.put("value", value);
		List<T> list = dao.findByHQL(hql, params);
		return list.size()>0;
	}
	
	public Boolean checkExist(String objectName, String name1, Object value1, String name2, Object value2) {
		String hql="from "+ objectName + " where " + name1 + "=:value1 and " + name2 + "=:value2";	
		Map<String, Object> params = new HashMap<String, Object>(2);
		params.put("value1", value1);
		params.put("value2", value2);
		List<T> list = dao.findByHQL(hql, params);
		return list.size()>0;
	}
	
	public int	update(String queryString) {
		return dao.update(queryString);
	}

	@Override
	public List<T> query(String hql, Map<String, Object> params, Pager pager) {
		return dao.pageableFindByHQL(pager, hql, params);
	}

	public void close() {

	}
}
