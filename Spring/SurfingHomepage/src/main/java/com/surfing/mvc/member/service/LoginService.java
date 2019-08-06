package com.surfing.mvc.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surfing.mvc.exception.IdNotFoundException;
import com.surfing.mvc.exception.PwInvalidException;
import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.MemberInfo;

@Service("loginService")
public class LoginService implements SurfingService {

	@Autowired
	private Dao dao;

	public boolean login(String id, String pw) throws SQLException, IdNotFoundException, PwInvalidException {

		Connection conn = null;
		MemberInfo memberInfo = null;
		boolean chk = false;

		try {

			conn = ConnectionProvider.getConnection();

			// 아이디 존재?
			memberInfo = dao.searchMem(conn, id);

			if (memberInfo == null) {
				throw new IdNotFoundException("해당 아이디가 없습니다");
			}

			if (!memberInfo.matchPassword(pw)) {
				throw new PwInvalidException("비밀번호가 틀렸습니다");
			}

			// 아이디&비밀번호 존재
			chk = true;

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} catch (IdNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (PwInvalidException e) {
			e.printStackTrace();
			throw e;
		}
		
		return chk;

	}
}
