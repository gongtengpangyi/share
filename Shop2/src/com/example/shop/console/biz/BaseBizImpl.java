package com.example.shop.console.biz;

import java.util.List;

import com.example.shop.console.dao.Dao;
import com.example.shop.model.Entity;

public class BaseBizImpl<T extends Entity> implements BaseBiz<T> {
	Dao<T> dao;
	
	public void setDao(Dao<T> dao) {
		this.dao = dao;
	}

	@Override
	public void save(T model) {
		dao.save(model);
	}

	@Override
	public void delete(T model) {
		dao.delete(model);
	}

	@Override
	public void update(T model) {
		dao.update(model);
	}

	@Override
	public List<T> findAll() {
		return dao.findAll();
	}

	@Override
	public T findById(Integer id) {
		return dao.findById(id);
	}

}
