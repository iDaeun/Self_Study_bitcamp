package surfing.mvc.domain;

import java.util.Date;

//로그인한 회원 정보 저장

public class LoginInfo {
	private String id;
	private String pw;
	private Date loginDate;
	
	public LoginInfo() {
		// TODO Auto-generated constructor stub
	}	
	
	public LoginInfo(String id, String pw) {
		this.id = id;
		this.pw = pw;
		this.loginDate = new Date();
	}


	public void setId(String id) {
		this.id = id;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	
	public String getId() {
		return id;
	}


	@Override
	public String toString() {
		return "LoginInfo1 [id=" + id + ", pw=" + pw + ", loginDate=" + loginDate + "]";
	}

	
}
