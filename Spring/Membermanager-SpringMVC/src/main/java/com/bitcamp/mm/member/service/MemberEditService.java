package com.bitcamp.mm.member.service;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberEdit;

@Service("editService")
public class MemberEditService {
	// 자동 메퍼를 이용해서 생성할 dao
	private MemberSessionDao dao;

	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	// @Inject : 타입에 맞는 주입 ( java 에서 지원 : 특정 프레임워크에 의존하지 않음 )
	@Inject
	private SqlSessionTemplate template;

	public MemberInfo getEditFormData(int id) {

		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberSessionDao.class);

		MemberInfo memberInfo = dao.selectMemberByIdx(id);
		return memberInfo;
	}

	public int edit(RequestMemberEdit edit, String oldFileName, HttpServletRequest request) {

		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberSessionDao.class);

		int rCnt = 0;
		MemberInfo memberInfo = edit.toMemberInfo();
		System.out.println(memberInfo);

		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);

		// 신규 파일 체크
		if (edit.getuPhoto() != null && !edit.getuPhoto().isEmpty() && edit.getuPhoto().getSize() > 0) {

			String newFileName = edit.getuId() + "_" + edit.getuPhoto().getOriginalFilename();

			try {
				// 신규파일 저장
				edit.getuPhoto().transferTo(new File(dir, newFileName));
				// 데이터 베이스 저장을 위한 새로운 파일 이름
				memberInfo.setuPhoto(newFileName);
				// 이전 파일 삭제
				new File(dir, oldFileName).delete();

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			// 신규파일이 없으면 이전 파일 이름을 그대로 업데이트
			memberInfo.setuPhoto(oldFileName);
		}

		rCnt = dao.memberUpdate(memberInfo);
		System.out.println(rCnt);

		return rCnt;
	}

}