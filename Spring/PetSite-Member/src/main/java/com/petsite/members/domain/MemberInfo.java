package com.petsite.members.domain;


import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberInfo {
	private String id;
	private String pw;
	private String name;
	private String address;
	private MultipartFile pic;
	private String pic_name;
	private Date regDate;
	
	public MemberInfo() {
		this.regDate = new Date();
		this.pic_name = pic.getName();
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public MultipartFile getPic() {
		return pic;
	}

	public void setPic(MultipartFile pic) {
		this.pic = pic;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address + ", pic=" + pic
				+ ", regDate=" + regDate + "]";
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	
	
	
}
