package com.surfing.mvc.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.MemberInfo;

@Service("memberIdCheckService")
public class MemberIdCheckService implements SurfingService {
	
	@Autowired
	private Dao dao;
	
	public String idCheck(String id) {
		
		Connection conn = null;
		MemberInfo memberInfo = null;
		
		String resultCode = "N";
		
		try {
			conn = ConnectionProvider.getConnection();
			memberInfo = dao.searchMem(conn, id);
			
			if(memberInfo == null) {
				// 사용가능한 아이디임
				resultCode = "Y";
			}
			
		}catch (SQLException e) {
			// TODO: handle exception
		}
				
		return resultCode;
	}

}
