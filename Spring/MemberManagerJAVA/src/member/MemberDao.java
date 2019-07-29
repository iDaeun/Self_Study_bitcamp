package member;

// member객체 저장
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class MemberDao {

	private static long nextId = 0;
	private Map<String, Member> map = new HashMap<String, Member>();

	// email로 member객체 찾기
	public Member selectByEmail(String email) {

		return map.get(email);

	}

	// 멤버 정보 추가
	public void insert(Member member) {
		// 생성자에 아이디 없음, 여기서 setId로 아이디 지정
		// 겹치지 않도록 함
		member.setId(++nextId);
		map.put(member.getEmail(), member);

	}

	// 멤버 정보 업데이트
	public void update(Member member) {

		map.put(member.getEmail(), member);

	}

	// Collection 객체로 반환
	public Collection<Member> selectAll() {

		return map.values();

	}

}
