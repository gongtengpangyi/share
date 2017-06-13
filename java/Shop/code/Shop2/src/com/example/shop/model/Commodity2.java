package com.example.shop.model;

import com.example.shop.console.dao.DBField;
import com.example.shop.console.dao.DBTable;

@DBTable(name="info_comm", keyName="commId")
public class Commodity2 extends Entity {
	@DBField(name="commName")
	private String name;
	
	@DBField(name="commPurPrice", type="int")
	private Integer purPrice;

	@DBField(name="commPrice", type="int")
	private Integer price;
	
	@DBField(name="commStock", type="int")
	private Integer stock;

	@DBField(name="commTypeId", type="int", foreignKey="id")
	private CommodityType type;
	
	@DBField(name="commsuppId", type="int", foreignKey="id")
	private Supplier supp;

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

	public CommodityType getType() {
		return type;
	}

	public void setType(CommodityType type) {
		this.type = type;
	}

	public Supplier getSupp() {
		return supp;
	}

	public void setSupp(Supplier supp) {
		this.supp = supp;
	}

	@Override
	public String toString() {
		return "Commodity2 [name=" + name + ", purPrice=" + purPrice + ", price=" + price + ", stock=" + stock
				+ ", type=" + type + ", supp=" + supp + "]";
	}

	
}
