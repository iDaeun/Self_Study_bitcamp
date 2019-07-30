package member;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service

// 암호변경 
public class ChangePasswordService {

	@Autowired
	//@Qualifier("sys")
	//@Resource(name="memberdao2")
	//@Resource(name = "boardDao")
	private MemberDao memberDao;
	
	/*
	 * public ChangePasswordService(MemberDao dao) {
	 * 
	 * memberDao = dao;
	 * 
	 * }
	 */

	// setter 방식 (property사용)
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
