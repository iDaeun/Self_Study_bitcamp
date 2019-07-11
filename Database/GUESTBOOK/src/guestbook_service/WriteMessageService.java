package guestbook_service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook_model.Message;
import jdbc.ConnectionProvider;

public class WriteMessageService {
	
	// SINGLETON
	private static WriteMessageService service = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return service;
	}
	
	private WriteMessageService() {}
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메소드 실행
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao dao = MessageDao.getInstance();
			
			rCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
