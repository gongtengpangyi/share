package com.example.shop.model;

import com.example.shop.console.dao.DBField;
import com.example.shop.console.dao.DBTable;

@DBTable(name="info_supp", keyName="suppId")
public class Supplier extends Entity{
	@DBField(name="suppName")
	private String name;
	
	@DBField(name="suppAddr")
	private String addr;
	
	@DBField(name="suppTel")
	private String tel;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
