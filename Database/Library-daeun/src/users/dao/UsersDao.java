package users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import users.model.MemberInfo;

public class UsersDao {

	private static UsersDao dao = new UsersDao();

	public static UsersDao getInstance() {
		return dao;
	}

	private UsersDao() {
	}

	// 아이디 중복체크 기능
	public boolean regCheck(Connection conn, String user_id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean chk = false;
		String sql = "select user_id from users where user_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			// resultSet이 empty한지 체크
			if (rs.next()) {
				// 데이터가 있음
				chk = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("DAO"+chk);
		return chk;
	}
	
	// 회원가입 -> 회원데이터 입력
	public int regInsert(Connection conn, MemberInfo memberInfo) {
		
		PreparedStatement pstmt = null;
		int rCnt = 0;
		String sql = "insert into users values (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberInfo.getUser_id());
			pstmt.setString(2, memberInfo.getUser_pw());
			pstmt.setString(3, memberInfo.getUser_name());
			pstmt.setDate(4, new java.sql.Date(memberInfo.getUser_reg().getTime()));
			
			rCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rCnt;
	}
	
	// (아이디&비밀번호 매칭) 입력된 아이디의 memberInfo객체 리턴
	//  내 정보 출력
	public MemberInfo select(Connection conn, String user_id) {
		
		MemberInfo memberInfo = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from users where user_id = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				memberInfo = new MemberInfo();

				memberInfo.setUser_id(rs.getString(1));
				memberInfo.setUser_pw(rs.getString(2));
				memberInfo.setUser_name(rs.getString(3));
				memberInfo.setUser_reg(new java.sql.Date(rs.getDate(4).getTime()));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberInfo;
	}

	// 아이디에 해당되는 회원정보 삭제
	public int deleteMem(Connection conn, String user_id) throws SQLException {
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from users where user_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rCnt = pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return rCnt;
		
	}
	

}
