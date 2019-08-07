package com.surfing.mvc.member.dao;

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

import com.surfing.mvc.member.domain.MemberInfo;
import com.surfing.mvc.member.domain.SearchParam;

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

		public int selectTotalCount(Connection conn, SearchParam searchParam) {

			int listTotalCount = 0;
			Statement stmt = null;
			ResultSet rs = null;
			
			String sql = "select count(*) from SurfingMemberInfo";
			
			if(searchParam != null) {
				sql = "select count(*) from SurfingMemberInfo where ";
				
				if(searchParam.getsType().equals("both")) {
					sql += " id like '%" +searchParam.getKeyword()+ "%' or name like '%" +searchParam.getKeyword() +"%'";
				}
				if(searchParam.getsType().equals("id")) {
					sql += " id like '%" +searchParam.getKeyword()+ "%'";
				}
				if(searchParam.getsType().equals("name")) {
					sql += " name like '%" +searchParam.getKeyword()+ "%'";
				}
			}
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					listTotalCount = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return listTotalCount;
		}

		public List<MemberInfo> selectList(Connection conn, int startRow, int endRow) {
			
			List<MemberInfo> memberList = new ArrayList<MemberInfo>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// String sql = "select * from SurfingMemberInfo";
			
			String sql = "select rownum, id, pw, name, pnum, lv, registerdate, photo "
					+ "from ( select rownum rnum, id, pw, name, pnum, lv, registerdate, photo "
					+ "from ( select * from SurfingMemberInfo order by idx desc ) where rownum <= ? ) " + "where rnum >= ?";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
										
					memberList.add(new MemberInfo(rs.getInt("rownum"), rs.getString("id"), rs.getString("pw"), 
							rs.getString("name"), rs.getString("pnum"), rs.getInt("lv"), rs.getTimestamp("registerdate"), rs.getString("photo")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return memberList;
			
		}

		public int updateMem(Connection conn, MemberInfo memberInfo) {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "";
			
			return 0;
		}
	
}
