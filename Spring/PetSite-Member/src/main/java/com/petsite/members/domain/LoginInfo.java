package com.petsite.members.domain;

import java.util.Date;

public class LoginInfo {
	private String id;
	private String pw;
	private String name;
	private String pic_name;
	private String address;
	private Date regDate;

	public LoginInfo(String id, String pw, String name, String pic_name, String address, Date regDate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.pic_name = pic_name;
		this.address = address;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", pic_name=" + pic_name + ", address="
				+ address + ", regDate=" + regDate + "]";
	}
	
	
}
