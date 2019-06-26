package member;

public class LoginInfo {
	private String id;
	private String name;
	private String photo;
	private String nickname;
	private int grade;
	private String pNum;
	
	public LoginInfo(String id, String name, String photo, String nickname, int grade, String pNum) {
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.nickname = nickname;
		this.grade = grade;
		this.pNum = pNum;
	}
	
	//dummy info
	public LoginInfo(String id) {
		this.id = id;
		this.name = "강다은";
		this.photo = "noimg";
		this.nickname = "kkang";
		this.grade = 1;
		this.pNum = "000-000-0000";
	}	

	//setter는 만들지 않는다!
	
	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public String getNickname() {
		return nickname;
	}

	public int getGrade() {
		return grade;
	}

	public String getpNum() {
		return pNum;
	}
	
	
}	
