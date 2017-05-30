package com.example.shop.test;

import java.util.List;

import org.junit.Test;

import com.example.shop.console.biz.AdminBiz;
import com.example.shop.console.biz.AdminBizImpl;
import com.example.shop.console.biz.CommodityBiz;
import com.example.shop.console.biz.CommodityBizImpl;
import com.example.shop.console.dao.DaoImpl;
import com.example.shop.model.Admin;
import com.example.shop.model.Commodity;

public class BizTest {
	@Test
	public void testFindName() {
		AdminBiz biz = new AdminBizImpl();
		biz.setDao(new DaoImpl<Admin>(Admin.class));
		Admin admin = biz.findByAccount("mmm");
		System.out.println(admin.getId());
		System.out.println(admin.toString());
	}
	
	@Test
	public void testFindAll2() {
		CommodityBiz biz = new CommodityBizImpl();
		biz.setDao(new DaoImpl<Commodity>(Commodity.class));
		List<Commodity> list = biz.findAll();
		for(Commodity c : list) {
			System.out.println(c.toString());
		}
	}
}
