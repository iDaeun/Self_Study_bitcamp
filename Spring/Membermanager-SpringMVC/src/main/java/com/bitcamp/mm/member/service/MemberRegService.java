package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;

@Service("registService")
public class MemberRegService implements MemberService {

	/*
	 * @Autowired private MemberDao dao;
	 */

	@Autowired
	// private MemberJdbcTemplateDao dao;
	private SqlSessionTemplate template;

	private MemberSessionDao dao;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		// dao 생성
		dao = template.getMapper(MemberSessionDao.class);

		// 서버경로
		String path = "/uploadfile/userphoto";
		// 절대경로
		String dir = request.getSession().getServletContext().getRealPath(path);
		MemberInfo memberInfo = regist.toMemberInfo();

		int resultCnt = 0;
		// Connection conn = null;
		String newFileName = "";

		try {
			if (regist.getuPhoto() != null) {
				// 새로운 파일 이름 생성
				newFileName = memberInfo.getuId() + "_" + regist.getuPhoto().getOriginalFilename();
				// conn = ConnectionProvider.getConnection();

				// 파일 서버의 지정 경로에 저장
				regist.getuPhoto().transferTo(new File(dir, newFileName));

				// 데이터베이스 저장을 하기 위한 파일 이름 set
				memberInfo.setuPhoto(newFileName);
			} 

			// DB저장
			// resultCnt = dao.insertMember(conn, memberInfo);
			resultCnt = dao.insertMember(memberInfo);

		} catch (IllegalStateException e) {
			// TODO: handle exception
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); new File(dir, newFileName).delete(); }
		 */

		return resultCnt;
	}

	public char idCheck(String id) {

		char chk = dao.selectMemberById(id) == null ? 'Y' : 'N';

		return chk;
	}

	public String idCheck1(String id) {

		return dao.selectMemberById(id) == null ? "Y" : "N";
	}

}
