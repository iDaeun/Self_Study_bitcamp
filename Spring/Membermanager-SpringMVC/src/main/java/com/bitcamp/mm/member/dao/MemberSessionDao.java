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
	
}
