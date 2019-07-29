package member;
// 데이터 저장
import java.util.Date;

public class Member {

	private Long id;
	private String email;
	private String password;
	private String name;
	private Date registerDate;
	
	// 생성자 -> id 없음, 밑에서 setter으로 지정
	public Member(String email, String password, String name, Date registerDate) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.registerDate = registerDate;
	}
	
	public Long getId() {
		return id;
	}
	
	// id SETTER
	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public Date getRegisterDate() {
		return registerDate;
	}
	
	// 비밀번호 바꾸기 : 기존 비밀번호 & 입력한 비밀번호 일치하지 않으면 예외처리
	public void changePassword(String oldPassword, String newPassword) throws IdPasswordNotMatchingException {
		
		if(!this.password.equals(oldPassword)) {
			
			throw new IdPasswordNotMatchingException();
			
		}
		
		this.password = newPassword;
		
	}
	
	
}
