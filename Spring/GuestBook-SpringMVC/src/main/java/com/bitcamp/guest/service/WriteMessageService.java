package com.bitcamp.guest.service;

import org.mybatis.spring.SqlSessionTemplate;

//import java.sql.Connection;
//import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.dao.MessageSessionDao;
import com.bitcamp.guest.dao.MessageSessionTemplateDao;
import com.bitcamp.guest.domain.Message;
//import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("writeService")
public class WriteMessageService implements GuestBookService {

	@Autowired
	// private MessageDao dao;
	// private MessageJdbcTemplateDao templateDao;
	// private MessageSessionTemplateDao templateDao;
	private SqlSessionTemplate template;

	private MessageSessionDao templateDao;

	public int write(Message message) {
		
	// dao생성
	templateDao = template.getMapper(MessageSessionDao.class);
	
		int rCnt = 0;
		rCnt = templateDao.insert(message);

		// 1. Connection 생성 2. dao 생성 3. insert 메소드 실행

		// Connection conn = null; try { conn = ConnectionProvider.getConnection();

		// MessageDao dao = MessageDao.getInstance();

		// rCnt = dao.insert(conn, message);

		// } catch (SQLException e) { // TODO Auto-generated catch block
		// e.printStackTrace(); }

		return rCnt;
	}

}
