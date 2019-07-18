package users.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import users.dao.UsersDao;

public class DeleteMemService {
	private DeleteMemService() {

	}

	private static DeleteMemService service = new DeleteMemService();

	public static DeleteMemService getInstance() {
		return service;
	}
	
	// 아이디&비밀번호 매칭 통과 -> 삭제 진행 
	public int deleteMem(String user_id) throws SQLException {
		
		int rCnt = 0;
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UsersDao dao = UsersDao.getInstance();
			
			// 트렌젝션 처리
			conn.setAutoCommit(false);
			
			// DB에서 해당 회원정보 삭제
			rCnt = dao.deleteMem(conn, user_id);
			
			// 정상처리
			conn.commit();
			
		}catch (SQLException e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}
		
		return rCnt;
	}
}
