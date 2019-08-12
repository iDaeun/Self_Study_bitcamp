package com.bitcamp.guest.dao;
// ★★ SQL문 작성 기능 ★★

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.guest.domain.Message;

//@Repository("jdbcTemplateDao")
@Repository("sessionTemplateDao")
public class MessageSessionTemplateDao {

	@Autowired
	private SqlSessionTemplate template;

	private String nameSpace = "com.bitcamp.guest.mapper.mybatis.guestMapper";

	public int insert(Message message) {
		String str = nameSpace + ".insertMessage";
		int rCnt = template.update(str, message);
		// == template.update(nameSpace+".insertMessage", message);
		return rCnt;
	}

	public int selectCount() {
		String str = nameSpace + ".selectCount";
		return template.selectOne(str);
	}

	public List<Message> selectList(Map<String, Object> params) {
		return template.selectList(nameSpace + ".selectList", params);
	}

	public Message select(int messageId) {
		return template.selectOne(nameSpace+".select", messageId);
	}

	public int deleteMssage(int messageId) {
		return template.update(nameSpace+".deleteMessage",messageId);
	}

}
