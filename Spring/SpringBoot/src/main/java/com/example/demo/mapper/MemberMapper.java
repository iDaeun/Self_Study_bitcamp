package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.demo.domain.MemberInfo;

public interface MemberMapper {
	
	@Select("SELECT * FROM member order by idx")
	public List<MemberInfo> selectAll();
	public MemberInfo selectMemberById(String uid);
	
}
