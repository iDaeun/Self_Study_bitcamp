package com.surfing.mvc.member.domain;

import java.util.List;

public class ListViewData {
	
	private List<MemberInfo> memberList;
	private int listTotalCount;
	private int no;
	private int currentPageNumber;
	private int pageTotalCount;
	
	private int startRow;
	private int endRow;
	
	public List<MemberInfo> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<MemberInfo> memberList) {
		this.memberList = memberList;
	}
	public int getListTotalCount() {
		return listTotalCount;
	}
	public void setListTotalCount(int listTotalCount) {
		this.listTotalCount = listTotalCount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
