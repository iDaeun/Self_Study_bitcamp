package member;
//beans 클래스 구성

import java.util.Date;

public class UserInfo {
	/* beans클래스의 변수는 private처리한다 */
	private String id; //${user.id} --> = getId()
	private String pw;
	private String name;
	private String address;
	private String email;
	private Date registerDate;

	/* Default 생성자가 필수 */
	/* 필드를 이용하는 생성자가 필요하다면 default를 명시적으로 정의 */
	public UserInfo(String id, String pw, String name, String address, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.email = email;
		this.registerDate = new Date();
	}
	
	public UserInfo() {
		this.registerDate = new Date();
	}

	/* Setter, Getter 메소드 정의 */
	/* getVar() / setVal() */

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegiserDate() {
		return registerDate;
	}

	public void setRegiserDate(Date regiserDate) {
		this.registerDate = regiserDate;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address + ", email=" + email
				+ ", registerDate=" + registerDate + "]";
	}


}
