package guestbook_service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook_model.Message;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService {
	// SINGLETON
	private DeleteMessageService() {
	}

	private static DeleteMessageService service = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return service;
	}

	public int deleteMessage(int messageId, String password) throws SQLException, MessageNotFoundException, InvalidMessagePasswordException {
		int resultCnt = 0;

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();

			// 트렌젝션 처리
			conn.setAutoCommit(false);

			// Message Dao 필요
			MessageDao dao = MessageDao.getInstance();
			// 1. 전달받은 게시물 아이디로 게시물 확인
			Message message = dao.select(conn, messageId);

			// 2. 게시물이 존재하지 않으면 예외처리
			if (message == null) {
				throw new MessageNotFoundException("메세지가 없습니다 :" + messageId);
			}

			// 3. 게시물이 존재하면 비밀번호 확인 -> 사용자가 입력한 비밀번호와 비교
			if (!message.hasPassword()) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			
			// 4. 비밀번호가 존재하지 않거나 사용자 비밀번호가 틀린 경우 예외처리
			if(!message.matchPassword(password)) {
				throw new InvalidMessagePasswordException("비밀번호가 일치하지 않습니다.");
			}
			
			// 5. 비밀번호가 일치하면 정상 처리 commit
			dao.deleteMssage(conn, messageId);

			// 정상처리
			conn.commit();

		} catch (SQLException e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (MessageNotFoundException e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		} catch (InvalidMessagePasswordException e) {
			// 예외발생 -> 트렌젝션의 rollback
			JdbcUtil.rollback(conn);
			e.printStackTrace();
			throw e;
		}

		return resultCnt;
	}
}
