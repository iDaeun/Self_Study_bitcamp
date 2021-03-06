package com.bitcamp.mm.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.jdbc.ConnectionProvider;
import com.bitcamp.mm.member.dao.MemberDao;
import com.bitcamp.mm.member.dao.MemberJdbcTemplateDao;
import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.ListViewData;
import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.SearchParam;

@Service("listService")
public class MemberListService implements MemberService {

	/*
	 * @Autowired private MemberDao dao;
	 */
	@Autowired
	// private MemberJdbcTemplateDao dao;
	private SqlSessionTemplate template;

	private MemberSessionDao dao;

	final int MEMBER_CNT_LIST = 3;

	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {

		// dao 생성
		dao = template.getMapper(MemberSessionDao.class);

		ListViewData listData = new ListViewData();

		//try {
			//Connection conn = ConnectionProvider.getConnection();

			// 현재 페이지 번호
			listData.setCurrentPageNumber(currentPageNumber);
			// 전체 게시물 개수
			// int totalCnt = dao.selectTotalCount(conn, searchParam);
			int totalCnt = dao.selectTotalCount(searchParam);

			int totalPageCnt = 0;
			// 전페 페이지 개수
			if (totalCnt > 0) {
				totalPageCnt = totalCnt / MEMBER_CNT_LIST;
				if (totalCnt % MEMBER_CNT_LIST > 0) {
					totalPageCnt++;
				}
			}
			listData.setPageTotalCount(totalPageCnt);

			// 구간 검색을 위한 index
			// 1 -> 0, 2->3, 3->6, 4->9
			int index = (currentPageNumber - 1) * MEMBER_CNT_LIST;

			// 회원 정보 리스트
			// listData.setMemberList(dao.selectList(conn, index, MEMBER_CNT_LIST));
			
			// map으로 삽입
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("index",index);
			params.put("count",MEMBER_CNT_LIST);
			listData.setMemberList(dao.selectList(params));

			List<MemberInfo> memberList = null;
			// 1. 검색 조건이 없는 경우 : selectList -> 전체 회원의 리스트
			// 2. id로 검색 : where like uid '%?%'
			// 3. name으로 검색 : where like uname '%?%'
			// 4. id 또는 name : where like uname '%?%' or like uid '%?%'

			// 1-> 9-0 = 9
			// 2 -> 9-3 = 6
			int no = totalCnt - index;
			listData.setNo(no);

			listData.setTotalCount(totalCnt);

		//} catch (SQLException e) {
			// TODO: handle exception
		//}

		return listData;
	}
	
	public List<MemberInfo> getAllList(){
		
		dao = template.getMapper(MemberSessionDao.class);
		List<MemberInfo> list = dao.selectAllList();
		
		return list;
	}

}
