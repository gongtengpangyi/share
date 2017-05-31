package com.example.shop.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.example.shop.console.dao.Dao;
import com.example.shop.console.dao.DaoImpl;
import com.example.shop.model.Admin;
import com.example.shop.model.CommodityType;

public class DaoTest {
	Dao<Admin> dao;
	@Before
	public void init() {
		dao = new DaoImpl<Admin>(Admin.class);
	}
	
	@Test
	public void testExcute() {
		String sql = "insert into info_admin(account, password) values(:account,:password)";
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("account", "oooo");
		params.put("password", "ppppp");
		dao.excute(sql, params);
	}
	
	@Test
	public void testSave() {
		Admin admin = new Admin();
		admin.setAccount("woteme");
		admin.setPass("tebieshuai");
		dao.save(admin);
		System.out.println(admin.getId());
	}
	
	@Test
	public void testUpdate() {
		Admin admin = new Admin();
		admin.setId(13);
		admin.setAccount("wozhende");
		admin.setPass("hhdddh");
		dao.update(admin);
	}
	
	@Test
	public void testDelete() {
		Admin admin = new Admin();
		admin.setId(13);
		admin.setAccount("wozhende");
		admin.setPass("hhhhhhh");
		dao.delete(admin);
	}
	
	@Test
	public void testQuery() {
		String sql = "from " + Admin.class.getName() + " o where o.id=:id and o.account=:account and o.pass = :password";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", 5);
		params.put("account", "haojian");
		params.put("password", "shabi");
		List<Admin> list = dao.query(sql, params);
		for(Admin admin : list) {
			System.out.println(admin.getId());
			System.out.println(admin.toString());
		}
	}
	
	@Test
	public void testFindAll() {
		List<Admin> list = dao.findAll();
		for(Admin admin : list) {
			System.out.println(admin.getId());
			System.out.println(admin.toString());
		}
	}
	
	@Test
	public void testFindById() {
		Admin admin = dao.findById(5);
		System.out.println(admin.toString());
	}
	
	@Test
	public void testMany() {
		List<Admin> list = dao.findAll();
		for(Admin admin : list) {
			System.out.println(admin.getId());
			System.out.println(admin.toString());
		}
		Admin admin = dao.findById(5);
		System.out.println(admin.toString());
	}
	
	@Test
	public void testMore() {
		Dao<CommodityType> dao2 = new DaoImpl<CommodityType>(CommodityType.class);
//		CommodityType type = new CommodityType();
//		type.setId(1);
//		type.setName("学习用品");
//		dao2.update(type);
		List<CommodityType> list = dao2.findAll();
		for (CommodityType type : list) {
			System.out.println(type.getId() + type.getName());
		}
		CommodityType type = dao2.findById(1);
		System.out.println(type.getName());
	}
	
	
	
}
