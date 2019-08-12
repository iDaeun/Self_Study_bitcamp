package com.bitcamp.guest.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.guest.domain.Message;

public interface MessageSessionDao {
	public int insert(Message message);
	public int selectCount();
	public List<Message> selectList(Map<String, Object> params);
	public Message select(int messageId);
	public int deleteMssage(int messageId);
}
