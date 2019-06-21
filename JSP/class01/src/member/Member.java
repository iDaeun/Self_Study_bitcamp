package member;

public class Member {
	private String name;
	private String id;
	private String pNum;
	
	public Member(String name, String id, String pNum) {
		this.name = name;
		this.id = id;
		this.pNum = pNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpNum() {
		return pNum;
	}

	public void setpNum(String pNum) {
		this.pNum = pNum;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", id=" + id + ", pNum=" + pNum + "]";
	}
	
	
}
