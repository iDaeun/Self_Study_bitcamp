package com.bitcamp.mvc.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Login {
	
	private String uId;
	@JsonIgnore
	private String uPw;
	
	private void login() {
		// TODO Auto-generated method stub

	}
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	
	
}
