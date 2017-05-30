package cn.hdu.wlw.console.dao;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.hibernate.Query;
import org.hibernate.engine.SessionFactoryImplementor;
import org.hibernate.hql.ast.QueryTranslatorImpl;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.hdu.wlw.console.common.Pager;


public class BaseDaoImpl<T extends Serializable,E extends Serializable> extends HibernateDaoSupport implements BaseDao<T,E> {

	private Class<T> t;  //model类

	public BaseDaoImpl(Class<T> t,Class<E> e){
		this.t=t;
	}
	/*
	 * 删除单个实体
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#delete(java.io.Serializable)
	 */
	public void delete(T model) {
		this.getHibernateTemplate().delete(model);
		
	}
	
	/*
	 * 删除多个实体
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#delete(java.io.Serializable)
	 */
	public void delete(String hql) {
		List<?> obList = getHibernateTemplate().find(hql);
		this.getHibernateTemplate().deleteAll(obList);

	}
	
	/*
	 * 查询所有结果
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#findAll()
	 */
	public List<T> findAll() {

		String hql="select o from "+ t.getName()+" o";
		return this.pageableFindByHQL(null, hql);
	}

	/*
	 * 通过hql语句来查询
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#findByHQL(java.lang.String)
	 */
	public List<T> findByHQL(String hql) {
		return this.pageableFindByHQL(null, hql);
	}

	/*
	 * (non-Javadoc)
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#findById(java.io.Serializable)
	 */
	public T findById(E pk) {

		return (T)this.getHibernateTemplate().get(this.t, pk);

	}
	
	public List<T> findByHQL(String hql, Map<String, Object> queryParams) {
		return pageableFindByHQL(null,hql,queryParams);
	}
	@SuppressWarnings("unchecked")
	public List<T> pageableFindByHQL(Pager pager, String hql,
			Map<String, Object> queryParams) {

		//分页的结果查询
		Query queryList=this.getSession().createQuery(hql);
		setQueryNamedParamters(queryParams, queryList);
		if(pager!=null)
		{
			int index=hql.toLowerCase().indexOf(" where ");

			String where=" ";
			if(index!=-1)
			{
				where=" and "+ hql.substring(index+6);
			}

			//得到所有的记录条数目
			Query queryCount = null;
			if (hql.indexOf("group by")!=-1) {
				// queryCount=  this.getSession().createQuery("select count(o) from (" + hql + ")");
				QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(hql, hql, Collections.EMPTY_MAP, (SessionFactoryImplementor) this.getSessionFactory()); 
				queryTranslator.compile(Collections.EMPTY_MAP, false); 
				String tempSQL = queryTranslator.getSQLString(); 
				String countSQL = "select count(*) from (" + tempSQL + ") tmp_count_t"; 
				Query query = this.getSession().createSQLQuery(countSQL); 			
				if(queryParams!=null && !queryParams.isEmpty()){
					int tindex = 0;
					Set<Entry<String,Object>> set=queryParams.entrySet();
					for(Entry<String, Object> entry:set){
						query.setParameter(tindex, entry.getValue()); 
						tindex++;
					}
				}				
				List<T> list = query.list(); 
				if (list == null || list.size() <= 0) {
					pager.setRecordCount(0);
				} else {
					BigInteger  count = (BigInteger ) list.get(0);
					pager.setRecordCount(count.intValue());
				}

				
			} else {
				queryCount=  this.getSession().createQuery("select count(o) from "+this.t.getName()+" o where 1=1 "+where );
				setQueryNamedParamters(queryParams, queryCount);
				pager.setRecordCount(Integer.parseInt(queryCount.uniqueResult().toString()));
			}
			
			//设置查询的开始位置
			queryList.setFirstResult(pager.getStart());
			queryList.setMaxResults(pager.getPageSize());
			System.out.println(pager.getStart()+";"+pager.getPageSize());
		}

		//返回查询的结果
		List<T> result = (List<T>)queryList.list();
		return result;
	}
	private void setQueryNamedParamters(Map<String, Object> queryParams,
			Query queryList) {
		if(queryParams!=null && !queryParams.isEmpty()){
			Set<Entry<String,Object>> set=queryParams.entrySet();
			for(Entry<String, Object> entry:set){
				queryList.setParameter(entry.getKey(), entry.getValue());
			}
		}
	}

	/*
	 * 分页查询
	 * @see com.ali.b2b.crm.workflow.dao.BaseDao#pageableFindByHQL(com.ali.b2b.crm.workflow.model.Pager, java.lang.String)
	 */
	public List<T> pageableFindByHQL(Pager pager, String hql) {
		return pageableFindByHQL(pager, hql, null);
	}

	public void update(T model) {
		this.getHibernateTemplate().update(model);
	}

	public void save(T model) {
		this.getHibernateTemplate().save(model);

	}
	
	
	@SuppressWarnings("unused")
	private int tablePostIndex(String lowerCaseSql, int index) {
		if(index==-1){
			index=lowerCaseSql.indexOf(" group ");
		}
		if(index==-1)
		{
			index=lowerCaseSql.indexOf(" having ");
		}
		if(index==-1)
		{
			index=lowerCaseSql.indexOf(" order ");
		}
		return index;
	}

	public List<T> pageableFindByNativeSql(Pager pager, String sql,
			Map<String, Object> queryParams) {

		return null;
	}
	public void saveOrUpdate(T model) {
		this.getHibernateTemplate().saveOrUpdate(model);
	}
	public Object uniqueQuery(String hql) {
		Query query=this.getSession().createQuery(hql);
		return query.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findByExample(T model,Pager pager){
		//Example example = Example.create(model).excludeZeroes().ignoreCase().enableLike(MatchMode.ANYWHERE);   
		//return this.getHibernateTemplate().findByExample(t.getName(),example,pager.getStart(),pager.getPageSize());

		return this.getHibernateTemplate().findByExample(model);
	}

	public int	update(String queryString) {
		return this.getHibernateTemplate().bulkUpdate(queryString);
	}
	
	
}
