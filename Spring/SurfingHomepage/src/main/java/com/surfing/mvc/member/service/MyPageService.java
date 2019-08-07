package com.surfing.mvc.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.LoginInfo;
import com.surfing.mvc.member.domain.MemberInfo;

@Service("myPageService")
public class MyPageService implements SurfingService {
	
	@Autowired
	private Dao dao;
	
	
	public MemberInfo myPage(HttpServletRequest request) {
		
		LoginInfo loginInfo =  (LoginInfo) request.getSession(false).getAttribute("loginInfo");
		String id = loginInfo.getId();
		System.out.println(id);
		
		Connection conn = null;
		MemberInfo memberInfo = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			
			// 해당 아이디 정보 가져오기
			memberInfo = dao.searchMem(conn, id);
			System.out.println(memberInfo);
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return memberInfo;
		
	}
}
