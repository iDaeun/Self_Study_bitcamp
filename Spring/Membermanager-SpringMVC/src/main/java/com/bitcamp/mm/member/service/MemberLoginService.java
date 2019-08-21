package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;

@Service("loginService")
public class MemberLoginService implements MemberService {

	@Autowired
	// private MemberDao dao;
	// private MemberJdbcTemplateDao dao;
	private SqlSessionTemplate template;

	private MemberSessionDao dao;

	public int login(String id, String pw, HttpServletRequest request) {

		// dao 생성
		dao = template.getMapper(MemberSessionDao.class);

		int loginChk = 3;

		MemberInfo memberInfo = null;
		Connection conn = null;

		// try {

		// conn = ConnectionProvider.getConnection();
		// memberInfo = dao.selectMemberById(conn, id);
		memberInfo = dao.selectMemberById(id);

		// 인증처리 여부 확인
		char regCheck = memberInfo.getVerify();

		if (regCheck == 'Y' && memberInfo != null && memberInfo.pwChk(pw)) {
			// session에 저장
			request.getSession(true).setAttribute("loginInfo", memberInfo.toLoginInfo());
			loginChk = 0; // 정상적으로 로그인
		} else if (regCheck == 'N') {
			loginChk = 1; // 미인증 회원
		} else {
			loginChk = 2; // 로그인 실패
		}

		// 정보 매칭 -> 로그인 처리
//		if (memberInfo != null && memberInfo.pwChk(pw)) {
//
//			// session에 저장
//			request.getSession(true).setAttribute("loginInfo", memberInfo.toLoginInfo());
//
//			loginChk = true;
//		}

		// } catch (SQLException e) {
		// TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		return loginChk;
	}

}
