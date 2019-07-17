package library_service;

import java.sql.Connection;
import java.sql.SQLException;
import jdbc.ConnectionProvider;
import library_dao.LibraryDao;
import library_exception.InfoNotFoundException;
import library_exception.InvalidUserPasswordException;
import library_model.MemberInfo;

public class LoginService {
	
	private LoginService() {
	}
	
	private static LoginService service = new LoginService();
	public static LoginService getInstance() {
		return service;
	}
	
	// 아이디&비밀번호 매칭
	public boolean logCheck(String user_id, String user_pw) throws SQLException, InfoNotFoundException, InvalidUserPasswordException {
		boolean chk = false;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			LibraryDao dao = LibraryDao.getInstance();
			
			// 1. 아이디로 회원 정보 확인
			MemberInfo memberInfo = dao.select(conn, user_id);
			
			// 2. 회원 정보가 존재하지 않으면 예외처리
			if(memberInfo == null) {
				throw new InfoNotFoundException("회원정보 없음"+user_id);
			}
			
			// 3. 회원 정보 존재 -> 입력한 비밀번호와 비교 -> 일치하지 않으면 예외처리
			if(!memberInfo.matchPassword(user_pw)) {
				throw new InvalidUserPasswordException("비밀번호 불일치");
			}
			
			// 4. 아이디&비밀번호 일치 -> true 
			chk = true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} catch (InfoNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (InvalidUserPasswordException e) {
			e.printStackTrace();
			throw e;
		}
		
		return chk;
	}
}
