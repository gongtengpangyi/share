package com.example.shop.model;

import com.example.shop.console.dao.DBField;
import com.example.shop.console.dao.DBTable;

@DBTable(name = "info_admin")
public class Admin extends Entity {
	@DBField(name = "password", type = "varchar")
	private String pass;

	@DBField(name = "account", type = "varchar")
	private String account;

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "Admin [pass=" + pass + ", account=" + account + "]";
	}
	
}
