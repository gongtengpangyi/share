package com.example.shop.model;

import com.example.shop.console.dao.DBField;
import com.example.shop.console.dao.DBTable;

@DBTable(name="info_comm", keyName="commId")
public class Commodity extends Entity {
	@DBField(name="commName")
	private String name;
	
	@DBField(name="commPurPrice", type="int")
	private Integer purPrice;

	@DBField(name="commPrice", type="int")
	private Integer price;
	
	@DBField(name="commStock", type="int")
	private Integer stock;

	@DBField(name="commTypeId", type="int")
	private Integer typeId;
	
	@DBField(name="commsuppId", type="int")
	private Integer suppId;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPurPrice() {
		return purPrice;
	}

	public void setPurPrice(Integer purPrice) {
		this.purPrice = purPrice;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getSuppId() {
		return suppId;
	}

	public void setSuppId(Integer suppId) {
		this.suppId = suppId;
	}

	@Override
	public String toString() {
		return "Commodity [name=" + name + ", purPrice=" + purPrice + ", price=" + price + ", stock=" + stock
				+ ", typeId=" + typeId + ", suppId=" + suppId + "]";
	}
	
	
}
