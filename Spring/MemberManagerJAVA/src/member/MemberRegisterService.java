package member;
// 회원가입 처리 
import java.util.Date;

public class MemberRegisterService {

	private MemberDao memberDao;

	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void regist(RegisterRequest request) throws AlreadyExistingMemberException {
		
		// 사용자가 입력한 email -> 기존 저장된 데이터에 있는지 찾기
		Member member = memberDao.selectByEmail(request.getEmail());

		if (member != null) {
			throw new AlreadyExistingMemberException();
		}
		
		// 겹치는 데이터가 없으면 회원가입 실행
		Member newMember = new Member(request.getEmail(), request.getPassword(), request.getName(), new Date());
		
		// + id도 같이 생성
		memberDao.insert(newMember);

	}

}
