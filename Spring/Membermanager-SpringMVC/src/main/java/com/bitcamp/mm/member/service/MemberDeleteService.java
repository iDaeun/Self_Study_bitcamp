package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;

@Service("deleteService")
public class MemberDeleteService implements MemberService {
	
	//@Autowired
	//private MemberDao dao;
	private MemberSessionDao dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int memberDelete(int id) {
	
		/*
		 * int rCnt = 0;
		 * 
		 * Connection conn = null; try { conn = ConnectionProvider.getConnection(); rCnt
		 * = dao.memberDelete(conn, id); } catch (SQLException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 * 
		 * return rCnt;
		 */
		
		dao = template.getMapper(MemberSessionDao.class);
		return dao.memberDelete(id);
	}
}
