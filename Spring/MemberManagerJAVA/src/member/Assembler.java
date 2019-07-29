package member;

// 객체 생성, 관리 역할
public class Assembler {

	// 보관 객체
	private MemberDao memberDao;
	private MemberRegisterService registerService;
	private ChangePasswordService pwService;

	public Assembler() {
		// 객체 생성, 주입
		memberDao = new MemberDao();
		registerService = new MemberRegisterService(memberDao);
		pwService = new ChangePasswordService(memberDao);
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}
	
	// 회원가입 객체 getter
	public MemberRegisterService getRegisterService() {
		return registerService;
	}
	
	// 암호변경 객체 getter
	public ChangePasswordService getPwService() {
		return pwService;
	}

}
