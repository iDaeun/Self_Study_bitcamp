package com.surfing.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import javax.sql.DataSource;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.surfing.mvc.domain.MemberInfo;

@Repository
public class Dao {
	
	//private JdbcTemplate jdbcTemplate;
	
	/*
	 * @Autowired public void setDataSource(DataSource dataSource) {
	 * this.jdbcTemplate = new JdbcTemplate(dataSource); }
	 */

	// 아이디 -> 있으면 해당 객체 리턴 / 없으면 null 리턴
		public MemberInfo searchMem(Connection conn, String id) {

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberInfo memberInfo = null;

			String sql = "select * from SurfingMemberInfo where id = ?";

			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {

					memberInfo = new MemberInfo();

					memberInfo.setIdx(rs.getInt(1));
					memberInfo.setId(rs.getString(2));
					memberInfo.setPw(rs.getString(3));
					memberInfo.setName(rs.getString(4));
					memberInfo.setpNum(rs.getString(5));
					memberInfo.setPhotoName(rs.getString(6));
					memberInfo.setLevel(rs.getInt(7));
					memberInfo.setRegisterDate(rs.getTimestamp(8));

				}

			} catch (Exception e) {
				// TODO: handle exception
			}

			return memberInfo;

		}

		// 회원정보 입력
		public int insertMem(Connection conn, MemberInfo memberInfo) {

			System.out.println("DAO" + memberInfo);

			PreparedStatement pstmt = null;
			int rCnt = 0;
			
			String sql = "insert into SurfingMemberInfo values (smi_idx_seq.nextval,?,?,?,?,?,?,?)";
			
		/*
		 * rCnt = jdbcTemplate.update(sql, new Object[] { memberInfo.getId(),
		 * memberInfo.getPw(), memberInfo.getName(), memberInfo.getFileName(),
		 * memberInfo.getLevel(), memberInfo.getRegisterDate() });
		 */
						
		
		  try {
		  
		  pstmt = conn.prepareStatement(sql);
		  
		  pstmt.setString(1, memberInfo.getId()); 
		  pstmt.setString(2, memberInfo.getPw()); pstmt.setString(3, memberInfo.getName());
		  pstmt.setString(4, memberInfo.getpNum()); 
		  pstmt.setString(5, memberInfo.getPhotoName()); 
		  pstmt.setInt(6, memberInfo.getLevel());
		  pstmt.setTimestamp(7, memberInfo.getRegisterDate());
		  
		  rCnt = pstmt.executeUpdate();
		  
		  System.out.println("DAO" + rCnt);
		  
		  } catch (SQLException e) { e.printStackTrace(); }
		 

			return rCnt;
		}

		// 회원 전체 목록 뽑기
		public List<MemberInfo> selectAllMem(Connection conn) {
			
			ResultSet rs = null;
			List<MemberInfo> list = new ArrayList<MemberInfo>();

			String sql = "select * from SurfingMemberInfo order by idx";

			try {
				
				Statement stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {

					MemberInfo memberInfo = new MemberInfo();

					memberInfo.setIdx(rs.getInt(1));
					memberInfo.setId(rs.getString(2));
					memberInfo.setPw(rs.getString(3));
					memberInfo.setName(rs.getString(4));
					memberInfo.setpNum(rs.getString(5));
					memberInfo.setPhotoName(rs.getString(6));
					memberInfo.setLevel(rs.getInt(7));
					memberInfo.setRegisterDate(rs.getTimestamp(8));

				list.add(memberInfo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
}
