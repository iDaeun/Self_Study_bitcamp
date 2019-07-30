package member;
// 암호변경 
public class ChangePasswordService {

	private MemberDao memberDao;
	
	/*
	 * public ChangePasswordService(MemberDao dao) {
	 * 
	 * memberDao = dao;
	 * 
	 * }
	 */

	// setter 방식 (property사용)
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void changePassword(String email, String oldPassword, String newPassword)
			throws MemberNotFoundException, IdPasswordNotMatchingException {

		Member member = memberDao.selectByEmail(email);

		if (member == null) {
			throw new MemberNotFoundException();
		}

		member.changePassword(oldPassword, newPassword);

		memberDao.update(member);

	}

}
