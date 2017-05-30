package com.example.shop.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.example.shop.console.dao.DataBase;

public class DBTest {
	DataBase db;
	@Before
	public void init() {
		db = new DataBase();
	}
	
	@Test
	public void testExcute() {
		List<Object> objs = new ArrayList<Object>();
		objs.add("jintao");
		objs.add("shabi");
		db.excute("insert into info_admin(account, password) values(?,?)", objs);
	}
	
	@Test
	public void testBindExcute() {
		String sql = "insert into info_admin(account, password) values(:account,:password)";
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("account", "xxxxxxx");
		params.put("password", "sssss");
		db.excute(sql, params);		
	}
	
	@Test
	public void testQuery() {
		String sql = "select * from info_admin where account = ?";
		List<Object> objs = new ArrayList<Object>();
		objs.add("jintao");
		ResultSet rs = db.select(sql, objs);
		try {
			while(rs.next()) {
				System.out.println(rs.getString("account"));
				System.out.println(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testBindQuery() {
		String sql = "select * from info_admin where account = :account";
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("account", "xxxxxxx");
		ResultSet rs = db.select(sql, params);
		try {
			while(rs.next()) {
				System.out.println(rs.getString("account"));
				System.out.println(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
