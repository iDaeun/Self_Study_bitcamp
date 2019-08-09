package com.surfing.mvc.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.surfing.mvc.member.domain.MemberInfo;

public class MemberInfoRowMapper implements RowMapper<MemberInfo> {

	@Override
	public MemberInfo mapRow(ResultSet rs, int rowNum) throws SQLException {

		MemberInfo memberInfo = new MemberInfo();

		memberInfo.setIdx(rs.getInt(1));
		memberInfo.setId(rs.getString(2));
		memberInfo.setPw(rs.getString(3));
		memberInfo.setName(rs.getString(4));
		memberInfo.setpNum(rs.getString(5));
		memberInfo.setPhotoName(rs.getString(6));
		memberInfo.setLevel(rs.getInt(7));
		memberInfo.setRegisterDate(rs.getTimestamp(8));
		
		return memberInfo;
	}

}
