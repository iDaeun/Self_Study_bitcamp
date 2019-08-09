package com.surfing.mvc.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.ListViewData;
import com.surfing.mvc.member.domain.MemberInfo;
import com.surfing.mvc.member.domain.SearchParam;

@Service("listService")
public class MemberListService {
	
	@Autowired
	private Dao dao;
	
	final int MEMBER_CNT_LIST = 3;
	
	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {
		
		ListViewData listData = new ListViewData();
		
		try {
			
			Connection conn = ConnectionProvider.getConnection();
			
			// 현재 페이지 번호
			listData.setCurrentPageNumber(currentPageNumber);
			
			// 전체 게시물 개수
			int listTotalCount = dao.selectTotalCount(conn, searchParam);
			listData.setListTotalCount(listTotalCount);
			
			int pageTotalCount = 0;
			// 전체 페이지 개수
			if(listTotalCount>0) {
				pageTotalCount = listTotalCount/MEMBER_CNT_LIST;
				if(listTotalCount%MEMBER_CNT_LIST>0) {
					pageTotalCount ++;
				}
			}
			listData.setPageTotalCount(pageTotalCount);
			
			// [ORACLE] StartRow, EndRow 구하는 공식 ---------------
			int startRow = 0;
			int endRow = 0;
			if(listTotalCount>0) {
				startRow = (currentPageNumber-1)*MEMBER_CNT_LIST+1;
				endRow = startRow+MEMBER_CNT_LIST-1;
				
				listData.setStartRow(startRow);
				listData.setEndRow(endRow);
			}
			// -------------------------------------------------
			
			// [mySQL] -----------------------------------------
			// 구간 검색을 위한 index
			// page 1 -> 0 index, page 2 -> 3 index, page 3 -> 6 index
			int index = (currentPageNumber-1)*MEMBER_CNT_LIST;
			
			// 조건에 따라 memberList뽑기
			List<MemberInfo> memberList = null;
			 
			if(searchParam == null) {
				memberList = dao.selectList(conn, startRow, endRow);
			} else if(searchParam.getsType().equals("both")) {
				memberList = dao.selecListByBoth(conn, startRow, endRow, searchParam);
			} else if(searchParam.getsType().equals("id")) {
				memberList = dao.selectListById(conn, startRow, endRow, searchParam);
			} else if(searchParam.getsType().equals("name")) {
				memberList = dao.selectListByName(conn, startRow, endRow, searchParam);
			}
						 
			// 회원 정보 리스트
			listData.setMemberList(memberList);
			
			// page 1 -> 9-0 = 9
			// page 2 -> 9-3 = 6
			 int no = listTotalCount - index;
			 listData.setNo(no);
			// [mySQL] -----------------------------------------
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listData;
	}
}
