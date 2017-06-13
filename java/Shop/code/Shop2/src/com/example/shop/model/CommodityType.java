package com.example.shop.model;

import com.example.shop.console.dao.DBField;
import com.example.shop.console.dao.DBTable;

@DBTable(name="info_comm_type", keyName="commTypeId")
public class CommodityType extends Entity {
	@DBField(name="commtyptName")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "CommodityType [name=" + name + "]";
	}
	
	
}
