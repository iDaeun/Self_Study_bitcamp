package com.bitcamp.mm.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Repository("templateDao")
public class MemberJdbcTemplateDao { 
	
	@Autowired
	private JdbcTemplate template;
	
	public MemberInfo selectMemberById(String userId) {
		
		String sql = "select * from member where uid=?";
		List<MemberInfo> list = template.query(sql,new Object[] {userId}, new MemberInfoRowMapper());
		//template.query(sql, rowmapper, userId);
		
		return list.isEmpty()?null:list.get(0); //list가 비어있으면 -> null, 아니면 -> index 0 리턴
		
	}
	
	/*
	 * public MemberInfo selectMemberById(Connection conn, String userId) {
	 * 
	 * MemberInfo memberInfo = null;
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * System.out.println("dao : memberId -> " + userId);
	 * 
	 * String sql = "select * from member where uid=?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, userId); rs =
	 * pstmt.executeQuery(); if (rs != null && rs.next()) {
	 * System.out.println("check ::::::::::::::::::::::::"); memberInfo = new
	 * MemberInfo(rs.getInt("idx"), rs.getString("uid"), rs.getString("upw"),
	 * rs.getString("uname"), rs.getString("uphoto"), new
	 * Date(rs.getTimestamp("regdate").getTime())); } } catch (SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); } finally {
	 * JdbcUtil.close(rs); JdbcUtil.close(pstmt); }
	 * 
	 * return memberInfo; }
	 */
	
	public int insertMember(MemberInfo memberInfo) {
		
		String sql = "insert into member (uid, uname, upw, uphoto) values (?,?,?,?) ";
		
		return template.update(sql, memberInfo.getuId(), memberInfo.getuName(), memberInfo.getuPw(), memberInfo.getuPhoto() );
		
	}
	
	/*
	 * public int insertMember(Connection conn, MemberInfo memberInfo) {
	 * 
	 * PreparedStatement pstmt = null;
	 * 
	 * int rCnt = 0;
	 * 
	 * String sql =
	 * "insert into member (uid, uname, upw, uphoto) values (?,?,?,?) ";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * memberInfo.getuId()); pstmt.setString(2, memberInfo.getuName());
	 * pstmt.setString(3, memberInfo.getuPw()); pstmt.setString(4,
	 * memberInfo.getuPhoto()); rCnt = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return rCnt;
	 * 
	 * }
	 */
	
	public List<MemberInfo> selectList(int index, int count) {
		
		String sql = "SELECT * FROM member limit ?,?";
		
		return template.query(sql, new MemberInfoRowMapper(), index, count);
	}
	
	/*
	 * public List<MemberInfo> selectList(Connection conn, int index, int count) {
	 * 
	 * List<MemberInfo> memberList = new ArrayList<MemberInfo>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * String sql = "SELECT * FROM member limit ?,?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setInt(1, index);
	 * pstmt.setInt(2, count); rs = pstmt.executeQuery(); while (rs.next()) {
	 * memberList.add(new MemberInfo(rs.getInt(1), rs.getString(2), rs.getString(3),
	 * rs.getString(4), rs.getString(5), new Date(rs.getDate(6).getTime()))); } }
	 * catch (SQLException e) { // TODO: handle exception }
	 * 
	 * return memberList; }
	 */
	
	public int selectTotalCount(SearchParam searchParam) {
		
		String sql = "select count(*) from member";
		
		if (searchParam != null) {
			sql = "select count(*) from member where ";
			if (searchParam.getType().equals("both")) {
				sql += " uid like '%"+searchParam.getKeyword()+"%' or uname like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getType().equals("id")) {
				sql += " uid like '%"+searchParam.getKeyword()+"%'";
			}
			if (searchParam.getType().equals("name")) {
				sql += "uname like '%"+searchParam.getKeyword()+"%'";
			}
		}
		
		return template.queryForObject(sql, Integer.class);
		
	}	

	/*
	 * public int selectTotalCount(Connection conn, SearchParam searchParam) {
	 * 
	 * int totalCnt = 0;
	 * 
	 * Statement stmt = null; ResultSet rs = null;
	 * 
	 * String sql = "select count(*) from member";
	 * 
	 * if (searchParam != null) { sql = "select count(*) from member where "; if
	 * (searchParam.getType().equals("both")) { sql +=
	 * " uid like '%"+searchParam.getKeyword()+"%' or uname like '%"+searchParam.
	 * getKeyword()+"%'"; } if (searchParam.getType().equals("id")) { sql +=
	 * " uid like '%"+searchParam.getKeyword()+"%'"; } if
	 * (searchParam.getType().equals("name")) { sql +=
	 * "uname like '%"+searchParam.getKeyword()+"%'"; } }
	 * 
	 * try {
	 * 
	 * stmt = conn.createStatement(); rs = stmt.executeQuery(sql); if (rs.next()) {
	 * totalCnt = rs.getInt(1); }
	 * 
	 * } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return totalCnt; }
	 */

	public int memberDelete(Connection conn, int id) {
		
		int rCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "delete from member where idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}

}
