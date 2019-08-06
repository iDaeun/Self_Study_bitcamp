package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberRegist;

@Service("registService")
public class MemberRegService implements MemberService {

	@Autowired
	private MemberDao dao;

	public int memberInsert(HttpServletRequest request, RequestMemberRegist regist) {

		// 서버경로
		String path = "/uploadfile/userphoto";
		// 절대경로
		String dir = request.getSession().getServletContext().getRealPath(path);
		MemberInfo memberInfo = regist.toMemberInfo();

		// 새로운 파일 이름 생성
		String newFileName = memberInfo.getuId() + "_" + regist.getuPhoto().getOriginalFilename();

		int resultCnt = 0;
		Connection conn = null;

		try {
			
			conn = ConnectionProvider.getConnection();
			
			// 파일 서버의 지정 경로에 저장
			regist.getuPhoto().transferTo(new File(dir, newFileName));

			// 데이터베이스 저장을 하기 위한 파일 이름 set
			memberInfo.setuPhoto(newFileName);

			// DB저장
			resultCnt = dao.insertMember(conn, memberInfo);

		} catch (IllegalStateException e) {
			// TODO: handle exception
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			new File(dir, newFileName).delete();
		}

		return resultCnt;
	}

}
