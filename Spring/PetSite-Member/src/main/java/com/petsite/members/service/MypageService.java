package com.petsite.members.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petsite.members.dao.MemberDao;
import com.petsite.members.domain.MemberInfo;

@Service("mypageService")
public class MypageService {
	
	@Autowired
	private SqlSessionTemplate template;
	private MemberDao dao;
	
	// 내 정보 불러오기
	public MemberInfo myInfo(String id) {
		
		dao = template.getMapper(MemberDao.class);
		
		MemberInfo memberInfo = dao.selectById(id);
		
		return memberInfo;
	}
}
