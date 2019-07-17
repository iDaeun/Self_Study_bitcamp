package library_model;

import java.util.Date;

public class MemberInfo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private Date user_reg;
	
	public MemberInfo() {
		this.user_reg = new Date();
	}	
	
	public MemberInfo(String user_id, String user_pw, String user_name) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_reg = new Date();
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public Date getUser_reg() {
		return user_reg;
	}


	public void setUser_reg(Date user_reg) {
		this.user_reg = user_reg;
	}
	
	// 로그인 시에 비밀번호 비교 
	public boolean matchPassword(String user_pw) {
		return this.user_pw.equals(user_pw);
	}
	
}
