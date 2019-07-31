package member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("changePasswordService")
// 암호변경 
public class ChangePasswordService2 {
	
	@Autowired
	// @Qualifier("sys1") 
	private MemberDao memberDao;

	/*
	 * public ChangePasswordService2(MemberDao dao) {
	 * 
	 * memberDao = dao; }
	 */

	/*
	 * public void setMemberDao(MemberDao memberDao) { this.memberDao = memberDao; }
	 */
	
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
