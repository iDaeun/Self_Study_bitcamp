package com.bitcamp.guest.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.guest.dao.MessageDao;
import com.bitcamp.guest.dao.MessageJdbcTemplateDao;
import com.bitcamp.guest.dao.MessageSessionDao;
import com.bitcamp.guest.dao.MessageSessionTemplateDao;
import com.bitcamp.guest.domain.Message;
import com.bitcamp.guest.domain.MessageListView;
import com.bitcamp.guest.jdbc.ConnectionProvider;

@Service("listService")
public class GetMessageListService implements GuestBookService {

	/*
	 * @Autowired private MessageDao dao;
	 */

	@Autowired
	//private MessageJdbcTemplateDao dao;
	//private MessageSessionTemplateDao dao;
	private SqlSessionTemplate template;
	
	private MessageSessionDao dao;
	
	// 1. 한 페이지에 보여줄 게시글의 개수
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageListView(int pageNumber) {
		
		// dao생성(자동매핑)
		dao = template.getMapper(MessageSessionDao.class);
		
		// 2. 현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		//Connection conn;
		
		MessageListView view = null;
		
		//try {
			// Connection
			//conn = ConnectionProvider.getConnection();
			
			// 전체 게시물의 개수
			// int messageTotalCount = dao.selectCount(conn);
			int messageTotalCount = dao.selectCount();
			
			// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(messageTotalCount > 0) {
				
				// firstRow, endRow 구하는 공식
				firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE+1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE -1;
				
				//messageList = dao.selectList(conn, firstRow, endRow);
				//messageList = dao.selectList(firstRow, endRow);
				Map<String,Object> params = new HashMap<String, Object>();
				params.put("firstRow", firstRow);
				params.put("endRow", endRow);
				messageList = dao.selectList(params);
				
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			
			view = new MessageListView(
					messageTotalCount, 
					currentPageNumber, 
					messageList, 
					MESSAGE_COUNT_PER_PAGE, 
					firstRow, endRow);
			
		/*} catch (SQLException e) {
			e.printStackTrace();
		}
		*/
		return view;
	}

}	
