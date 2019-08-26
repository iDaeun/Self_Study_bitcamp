package com.petsite.members.dao;

import com.petsite.members.domain.MemberInfo;

public interface MemberDao {
	public int insertMem(MemberInfo memberInfo); // 회원가입
	public MemberInfo selectById(String id); // 로그인, 중복 아이디 체크
	public int updateVerify(String id); // verify값 변경
}
