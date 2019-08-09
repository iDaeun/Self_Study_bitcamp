package com.bitcamp.guest.dao;
// ★★ SQL문 작성 기능 ★★

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.jdbc.JdbcUtil;

@Repository("jdbcTemplateDao")
public class MessageJdbcTemplateDao { // 이름 정해주지 않으면 -> messageDao으로 자동설정
	
	@Autowired
	private JdbcTemplate template;
	
	public int insert(Message message) {
		
		String sql = "insert into guestbook_message"
				  + " (message_id, guest_name, password, message) " +
				  " values (GM_MID_SEQ.NEXTVAL, ?, ?, ?)";
		
		
		
		return template.update(sql, message.getGuestName(), message.getPassword(), message.getMessage());
	}

	// ★ 추가 기능
	// message -> getter
	/*
	 * public int insert(Connection conn, Message message) { int rCnt = 0;
	 * 
	 * PreparedStatement pstmt = null; String sql = "insert into guestbook_message"
	 * + " (message_id, guest_name, password, message) " +
	 * " values (GM_MID_SEQ.NEXTVAL, ?, ?, ?)";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * message.getGuestName()); pstmt.setString(2, message.getPassword());
	 * pstmt.setString(3, message.getMessage());
	 * 
	 * rCnt = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { try {
	 * pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
	 * 
	 * return rCnt; }
	 */
	
	// ---------------------------------------------------------------------------------------------------------
	
	public Message select(int messageId) {
		
		String sql = " select * from guestbook_message where message_id = ? ";
		
		return template.queryForObject(sql, new MessageRowMapper(), messageId);
	}
	
	// ★ id => 출력 기능
	// message -> setter
	// messageId에 맞는 message객체를 통해서 행 반환
	/*
	 * public Message select(Connection conn, int messageId) {
	 * 
	 * Message message = null;
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * String sql = " select * from guestbook_message where message_id = ? ";
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, messageId); rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) {
	 * 
	 * message = new Message();
	 * 
	 * message.setId(rs.getInt(1)); message.setGuestName(rs.getString(2));
	 * message.setPassword(rs.getString(3)); message.setMessage(rs.getString(4));
	 * 
	 * }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return message; }
	 */
	
	// ---------------------------------------------------------------------------------------------------------
	
	public int selectCount() {
				
		return template.queryForObject("select count(*) from guestbook_message", Integer.class);
	}

	// ★ 전체 게시물의 개수 리턴
	/*
	 * public int selectCount(Connection conn) {
	 * 
	 * Statement stmt = null; ResultSet rs = null; int totalCnt = 0;
	 * 
	 * String sql = "select count(*) from guestbook_message"; try { stmt =
	 * conn.createStatement();
	 * 
	 * rs = stmt.executeQuery(sql);
	 * 
	 * if (rs.next()) { totalCnt = rs.getInt(1); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return totalCnt; }
	 */
	
	// ---------------------------------------------------------------------------------------------------------

	public List<Message> selectList(int firstRow, int endRow) {
		
		String sql = "select message_id, guest_name, password, message from ( "
				+ " select rownum rnum, message_id, guest_name, password, message from ( "
				+ " select * from guestbook_message m order by m.message_id desc " + " ) where rownum <= ? "
				+ " ) where rnum >= ?";
		
		return template.query(sql, new MessageRowMapper(), endRow, firstRow);
		
	}
	
	// ★ firstRow, endRow 사이의 리스트 -> 전체 출력 기능
	/*
	 * public List<Message> selectList(Connection conn, int firstRow, int endRow) {
	 * 
	 * List<Message> list = new ArrayList<Message>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * String sql = "select message_id, guest_name, password, message from ( " +
	 * " select rownum rnum, message_id, guest_name, password, message from ( " +
	 * " select * from guestbook_message m order by m.message_id desc " +
	 * " ) where rownum <= ? " + " ) where rnum >= ?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, endRow); pstmt.setInt(2, firstRow);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * Message msg = new Message(); msg.setId(rs.getInt(1));
	 * msg.setGuestName(rs.getString(2)); msg.setPassword(rs.getString(3));
	 * msg.setMessage(rs.getString(4));
	 * 
	 * // 반복하면서 객체를 만들어 준 다음 -> list에 추가함 list.add(msg); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return list; }
	 */
	
	// ---------------------------------------------------------------------------------------------------------
	
	public int deleteMssage(int messageId) {
		
		String sql = "delete from guestbook_message where message_id=?";
		
		return template.update(sql, messageId);
		
	}
	
	// ★메세지 삭제 기능
	/*
	 * public int deleteMssage(Connection conn, int messageId) throws SQLException {
	 * 
	 * int resultCnt = 0;
	 * 
	 * // PreparedStatement 객체 생성 PreparedStatement pstmt = null;
	 * 
	 * String sql = "delete from guestbook_message where message_id=?";
	 * 
	 * try {
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setInt(1, messageId);
	 * 
	 * resultCnt = pstmt.executeUpdate();
	 * 
	 * } finally {
	 * 
	 * JdbcUtil.close(pstmt);
	 * 
	 * }
	 * 
	 * return resultCnt; }
	 */

}
