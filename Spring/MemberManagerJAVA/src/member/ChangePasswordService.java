package member;
// 암호변경 
public class ChangePasswordService {

	private MemberDao memberDao;

	public ChangePasswordService(MemberDao dao) {

		memberDao = dao;

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
