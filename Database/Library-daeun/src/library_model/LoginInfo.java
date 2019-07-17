package library_model;

import java.util.Date;

public class LoginInfo {
	private String user_id;
	private Date user_reg;
	
	public LoginInfo(String user_id) {
		this.user_id = user_id;
		this.user_reg = new Date();
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getUser_reg() {
		return user_reg;
	}

	public void setUser_reg(Date user_reg) {
		this.user_reg = user_reg;
	}

	@Override
	public String toString() {
		return "LoginInfo [user_id=" + user_id + ", user_reg=" + user_reg + "]";
	}
		
	
}
