package com.bitcamp.mm.member.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

public interface MemberSessionDao {
	public MemberInfo selectMemberById(String userId);
	public int insertMember(MemberInfo memberInfo);
	public int selectTotalCount(SearchParam searchParam);
	public List<MemberInfo> selectList(Map<String,Object>params);
	public List<MemberInfo> selectAllList(); // 전체 리스트 받아옴
	public int memberDelete(int id);// 회원 정보 삭제
	public MemberInfo selectMemberByIdx(int id); // 회원 정보 수정을 위한 정보 획득
	public int memberUpdate(MemberInfo memberInfo); // 회원 정보 수정
}
