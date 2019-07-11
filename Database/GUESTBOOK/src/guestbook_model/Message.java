package guestbook_model;

public class Message {

	private int id;
	private String guestName;
	private String password;
	private String message;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	// 비밀번호 비어있는지 확인 :
	public boolean hasPassword() {
		// 비밀번호가 존재하면 -> true
		// password.length()>0 == !password.isEmpty()
		return password != null && !password.isEmpty();
	}
	
	// 삭제 시에 비밀번호 비교 :
	public boolean matchPassword(String pw) {
		// 비밀번호가 존재 & 일치 -> true
		return hasPassword() && password.equals(pw);
	}
}
